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
        string strWhere = string.Empty;
        if (txtfromdate.Text.Length > 0 & txttodate.Text.Length > 0)
        {
            strWhere = " where tbl_appointment.CDate between '" + txtfromdate.Text.Trim() + "' and '" + txttodate.Text.Trim() + "'";
        }
            string sql = @"SELECT     tbl_appointment.appointment_no, tbl_appointment.UserID, tbl_appointment.DateOfAppointment, tbl_appointment.DoctorCode, tbl_appointment.HealthIssue, 
                      tbl_appointment.CDate, tbl_UserLogin.Name, tbl_PatientRegistration.MobileNo, tbl_appointment.status,tbl_appointment.opt_remarks, tbl_appointment.alloted_doa
        FROM         tbl_appointment INNER JOIN
                      tbl_UserLogin ON tbl_appointment.UserID = tbl_UserLogin.UserID INNER JOIN
                      tbl_PatientRegistration ON tbl_UserLogin.UserID = tbl_PatientRegistration.MobileNo " + strWhere;


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






    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        bindAppointment(); 
    }
}