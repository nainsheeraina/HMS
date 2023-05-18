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
        string sql = @"SELECT     TOP (200) tbl_prescription.SL, tbl_prescription.appointment_no, tbl_prescription.regno, tbl_prescription.remarks, tbl_prescription.medicine, tbl_prescription.date_of_checkup, 
                      tbl_prescription.test_details, tbl_PatientRegistration.MobileNo, tbl_PatientRegistration.Name
FROM         tbl_prescription INNER JOIN
                      tbl_PatientRegistration ON tbl_prescription.regno = tbl_PatientRegistration.regno where tbl_PatientRegistration.MobileNo='" + Session["UserId"].ToString()+"'";


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


  
  
}