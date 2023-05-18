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
                      tbl_UserLogin.Name, tbl_PatientRegistration.MobileNo
FROM         tbl_appointment INNER JOIN
                      tbl_UserLogin ON tbl_appointment.UserID = tbl_UserLogin.UserID INNER JOIN
                      tbl_PatientRegistration ON tbl_UserLogin.UserID = tbl_PatientRegistration.MobileNo where tbl_appointment.status is NULL";


        DataTable dt = cls.GetDataTable(sql);

        GridView2.DataSource = dt;
        GridView2.DataBind();

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
            TextBox txtremarks = (TextBox)gvr.FindControl("txtremarks");
            TextBox txtadoa = (TextBox)gvr.FindControl("txtadoa");
            CheckBox CheckBox1 = (CheckBox)gvr.FindControl("CheckBox1");
             if (CheckBox1.Checked)
            {
                string appointment_no = GridView2.DataKeys[gvr.RowIndex].Values["appointment_no"].ToString().Trim();
         
                if (ddlstatus.SelectedValue == "0")
                {
                    lblmsg.Text = "Please select Status..!!";
                    return;
                }
                if (txtremarks.Text.Length == 0)
                {
                    lblmsg.Text = "Please Enter remarks..!!";
                    return;
                }
                if (txtadoa.Text.Length == 0)
                {
                    lblmsg.Text = "Please Enter Date of Appointment..!!";
                    return;
                }
                try
                {
                    string sql = "update tbl_appointment set status=@status,opt_remarks=@opt_remarks,alloted_doa=@alloted_doa where appointment_no=@appointment_no";

                    SqlParameter _appointment_no = new SqlParameter("@appointment_no", appointment_no);
                    SqlParameter _status = new SqlParameter("@status", ddlstatus.SelectedValue.Trim());
                    SqlParameter _opt_remarks = new SqlParameter("@opt_remarks", txtremarks.Text.Trim());
                    SqlParameter _alloted_doa=null;
                    if (ddlstatus.SelectedValue == "A")
                    {
                         _alloted_doa = new SqlParameter("@alloted_doa", txtadoa.Text.Trim());
                    }
                        else
                    {
                               _alloted_doa = new SqlParameter("@alloted_doa", DBNull.Value);
                
                    }
                       if (cls.ExecuteSql(sql, new SqlParameter[] { _appointment_no, _status, _opt_remarks, _alloted_doa }) > 0)
                    {
                        lblmsg.Text = "Submited..!!s";
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
  
}