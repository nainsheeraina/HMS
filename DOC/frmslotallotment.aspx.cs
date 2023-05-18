using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class OPT_frmListofappointment : System.Web.UI.Page
{
    clsDataAccess cls = new clsDataAccess();
    void bindAppointment()
    {
        string sql = @"SELECT  tbl_PatientRegistration.regno,tbl_appointment.sno AS slotno,   tbl_appointment.appointment_no, tbl_appointment.UserID, tbl_appointment.DateOfAppointment, tbl_appointment.DoctorCode, tbl_appointment.HealthIssue, 
                      tbl_appointment.CDate, tbl_UserLogin.Name, tbl_PatientRegistration.MobileNo, tbl_appointment.status,tbl_appointment.opt_remarks, tbl_appointment.alloted_doa
FROM         tbl_appointment INNER JOIN
                      tbl_UserLogin ON tbl_appointment.UserID = tbl_UserLogin.UserID INNER JOIN
                      tbl_PatientRegistration ON tbl_UserLogin.UserID = tbl_PatientRegistration.MobileNo where tbl_appointment.status='A' AND tbl_appointment.alloted_doa=cast(getdate() as date) and sno is NOT NULL";


        DataTable dt = cls.GetDataTable(sql);

        GridView2.DataSource = dt;
        GridView2.DataBind();

        //gvslotalloteddata
    }
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/FrmLogin.aspx");
            
        }
        if (!IsPostBack)
        {
            bindAppointment();
            pnlPrescriptionDetails.Visible = false;
            pnlmain.Visible = true;
        }
    }
    int validate()
    {
        int flag = 0;

        foreach (GridViewRow gvr in GridView2.Rows)
        {
            CheckBox CheckBox1 = (CheckBox)gvr.FindControl("CheckBox1");
            if (CheckBox1.Checked)
            {
                flag = 1;
                break;
            }
        }
        return flag;

    }
    int genslot()
    {
        int slot;
        string sql = "select max(sno) from tbl_appointment where  tbl_appointment.alloted_doa=cast(getdate() as date)";
        DataTable dt = cls.GetDataTable(sql);
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0][0] != DBNull.Value)
            {
                slot = int.Parse(dt.Rows[0][0].ToString()) + 1;
            }
            else
            {
                slot = 1;

            }
        }

        else
        {
            slot = 1;

        }

        return slot;
    }
    /*
    int validate()
    {
        int flag = 0;

        foreach (GridViewRow gvr in GridView2.Rows)
        {
            CheckBox CheckBox1 = (CheckBox)gvr.FindControl("CheckBox1");
            if (CheckBox1.Checked)
            {
                flag = 1;
                break;
            }
        }
        return flag;

    }
    int genslot()
    {
        int slot;
        string sql = "select max(sno) from tbl_appointment where  tbl_appointment.alloted_doa=cast(getdate() as date)";
        DataTable dt = cls.GetDataTable(sql);
        if (dt.Rows.Count > 0)
        {
            if (dt.Rows[0][0] != DBNull.Value)
            {
                slot = int.Parse(dt.Rows[0][0].ToString()) + 1;
            }
            else
            {
                slot = 1;

            }
        }

        else
        {
            slot = 1;

        }

        return slot;
    }
    protected void lnkSubmit_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        if (validate() == 0)
        {
            lblmsg.Text = "Please select at least one record..!!";
            return;
        }
        
        foreach (GridViewRow gvr in GridView2.Rows)
        {
            DropDownList ddlpaymentstatus = (DropDownList)gvr.FindControl("ddlpaymentstatus");
           
            TextBox txtadoa = (TextBox)gvr.FindControl("txtadoa");
            CheckBox CheckBox1 = (CheckBox)gvr.FindControl("CheckBox1");
             if (CheckBox1.Checked)
            {
                string appointment_no = GridView2.DataKeys[gvr.RowIndex].Values["appointment_no"].ToString().Trim();

                if (ddlpaymentstatus.SelectedValue == "0")
                {
                    lblmsg.Text = "Please select Status..!!";
                    return;
                }
               
              
                try
                {
                    string sql = "update tbl_appointment set Paystatus=@status,sno=@sno where appointment_no=@appointment_no";

                    SqlParameter _appointment_no = new SqlParameter("@appointment_no", appointment_no);
                    SqlParameter _status = new SqlParameter("@status", ddlpaymentstatus.SelectedValue.Trim());
                    SqlParameter _slotno=new SqlParameter("@sno",genslot());

                    if (cls.ExecuteSql(sql, new SqlParameter[] { _appointment_no, _status, _slotno }) > 0)
                    {
                        lblmsg.Text = "Submited..!!";
                        bindAppointment();
                      
                    }
                    else
                    {
                        lblmsg.Text = "Please try again....!!";
                    }
                }
                catch (Exception ex) { }
            }
        }

    }
    */
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = @"insert into  tbl_prescription( appointment_no, regno, remarks, medicine, date_of_checkup, test_details, cdate, cby
                        )values
                        ( @appointment_no, @regno, @remarks, @medicine, @date_of_checkup, @test_details,getDate(), @cby)";

            SqlParameter _appointment_no = new SqlParameter("@appointment_no", ViewState["appointment_no"].ToString().Trim());
            SqlParameter _regno = new SqlParameter("@regno", lblregno.Text.Trim());
            SqlParameter _remarks = new SqlParameter("@remarks", txtRemarks.Text.Trim());
            SqlParameter _medicine = new SqlParameter("@medicine", txtMedicine.Text.Trim());
            SqlParameter _date_of_checkup = new SqlParameter("@date_of_checkup", ddlDateOfCheckup.Text.Trim());
            SqlParameter _test_details = new SqlParameter("@test_details", txtMedicineDetails.Text.Trim());
            SqlParameter _cby = new SqlParameter("@cby", Session["UserId"].ToString().Trim());


            if (cls.ExecuteSql(sql, new SqlParameter[] { _appointment_no, _regno, _remarks, _medicine, _date_of_checkup, _test_details, _cby }) > 0)
            {

                sql = "update tbl_appointment set status=@status where appointment_no=@appointment_no";

                SqlParameter _appointmentnos = new SqlParameter("@appointment_no", ViewState["appointment_no"].ToString().Trim());
                SqlParameter _status = new SqlParameter("@status", "C");

                int res = cls.ExecuteSql(sql, new SqlParameter[] { _appointmentnos, _status });
                pnlmain.Visible = true;
                pnlPrescriptionDetails.Visible = false;
                bindAppointment();
                lblmsg.Text = "Data save...!";

            }
            else
            {
                lblmsg.Text = "please try again";
            }

        }
        catch (Exception ex) { }
    }
    protected void lnkSelect_CLick(object sender, EventArgs e)
    {
        LinkButton lnkSelect = (LinkButton)sender;
        GridViewRow gvr =(GridViewRow) lnkSelect.NamingContainer;
        string appointment_no = GridView2.DataKeys[gvr.RowIndex].Values["appointment_no"].ToString();
        string reg_no = GridView2.DataKeys[gvr.RowIndex].Values["regno"].ToString();

        lblappointmentno.Text = appointment_no;
        lblregno.Text = reg_no;
        pnlmain.Visible = false;
        pnlPrescriptionDetails.Visible = true;
        ViewState["appointment_no"] = appointment_no;
       

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        pnlmain.Visible = true;
        pnlPrescriptionDetails.Visible = false;
    }
    protected void lnkSubmit_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        if (validate() == 0)
        {
            lblmsg.Text = "Please select at least one record..!!";
            return;
        }
        foreach (GridViewRow gvr in GridView2.Rows)
        {
            DropDownList ddlstatus = (DropDownList)gvr.FindControl("ddlstatus");

            TextBox txtadoa = (TextBox)gvr.FindControl("txtadoa");
            CheckBox CheckBox1 = (CheckBox)gvr.FindControl("CheckBox1");
            if (CheckBox1.Checked)
            {
                string appointment_no = GridView2.DataKeys[gvr.RowIndex].Values["appointment_no"].ToString().Trim();
                string reg_no = GridView2.DataKeys[gvr.RowIndex].Values["reg_no"].ToString().Trim();

                if (ddlstatus.SelectedValue == "0")
                {
                    lblmsg.Text = "Please select Status..!!";
                    return;
                }


                try
                {
                    string sql = "update tbl_appointment set status=@status,sno=@sno where appointment_no=@appointment_no";

                    SqlParameter _appointment_no = new SqlParameter("@appointment_no", appointment_no);
                    SqlParameter _status = new SqlParameter("@status", ddlstatus.SelectedValue.Trim());
                    SqlParameter _slotno = new SqlParameter("@sno", genslot());

                    if (cls.ExecuteSql(sql, new SqlParameter[] { _appointment_no, _status, _slotno }) > 0)
                    {
                        lblmsg.Text = "Submited..!!";
                        bindAppointment();
                      
                    }
                    else
                    {
                        lblmsg.Text = "Please try again....!!";
                    }
                }
                catch (Exception ex) { }
            }
        }
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}