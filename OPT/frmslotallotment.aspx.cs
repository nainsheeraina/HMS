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
        string sql = @"SELECT     tbl_appointment.appointment_no, tbl_appointment.UserID, tbl_appointment.DateOfAppointment, tbl_appointment.DoctorCode, tbl_appointment.HealthIssue, 
                      tbl_appointment.CDate, tbl_UserLogin.Name, tbl_PatientRegistration.MobileNo, tbl_appointment.status,tbl_appointment.opt_remarks, tbl_appointment.alloted_doa
FROM         tbl_appointment INNER JOIN
                      tbl_UserLogin ON tbl_appointment.UserID = tbl_UserLogin.UserID INNER JOIN
                      tbl_PatientRegistration ON tbl_UserLogin.UserID = tbl_PatientRegistration.MobileNo where tbl_appointment.status='A' AND tbl_appointment.alloted_doa=cast(getdate() as date) and sno is NULL";


        DataTable dt = cls.GetDataTable(sql);

        GridView2.DataSource = dt;
        GridView2.DataBind();

        //gvslotalloteddata
    }
    void bindAllotedadat()
    {
        string sql = @"SELECT     tbl_appointment.appointment_no, tbl_appointment.UserID, tbl_appointment.DateOfAppointment, tbl_appointment.DoctorCode, tbl_appointment.HealthIssue, 
                      tbl_appointment.CDate, tbl_UserLogin.Name, tbl_PatientRegistration.MobileNo, tbl_appointment.status,tbl_appointment.opt_remarks, tbl_appointment.alloted_doa,tbl_appointment.sno
FROM         tbl_appointment INNER JOIN
                      tbl_UserLogin ON tbl_appointment.UserID = tbl_UserLogin.UserID INNER JOIN
                      tbl_PatientRegistration ON tbl_UserLogin.UserID = tbl_PatientRegistration.MobileNo where tbl_appointment.status='A' AND tbl_appointment.alloted_doa=cast(getdate() as date) and sno is not NULL";


        DataTable dt = cls.GetDataTable(sql);

        gvslotalloteddata.DataSource = dt;
        gvslotalloteddata.DataBind();
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
            bindAllotedadat();
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
                        bindAllotedadat();
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


    protected void gvslotalloteddata_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}