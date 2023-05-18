using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class DOC_Default : System.Web.UI.Page
{
     
    clsDataAccess cls = new clsDataAccess();
    void bindgrid()
    {
        string sql = @"SELECT       DoctorName, Specialization, Qualification, Gender, Age, Experience, MobileNo, EmailId    FROM         tbl_DoctorProfile WHERE MobileNo='" + Session["UserId"].ToString()+"'";
        DataTable dt = cls.GetDataTable(sql);
        DataList1.DataSource = dt;
        DataList1.DataBind();
        
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/FrmLogin.aspx");


        }
        if (!IsPostBack)
            bindgrid();
    }


    protected void lnkupdate_Click(object sender, EventArgs e)
    {
        pnlprofile.Visible = true;
        string sql = @"SELECT    DoctorCode, DoctorName, Specialization,Qualification,Gender,Age,Experience,MobileNo,EmailId
        FROM         tbl_DoctorProfile WHERE MobileNo='" + Session["UserId"].ToString() + "'";
        DataTable dt = cls.GetDataTable(sql);
        if (dt.Rows.Count > 0)
        {
            lblregno.Text = dt.Rows[0]["DoctorCode"].ToString();
            lblname.Text = dt.Rows[0]["DoctorName"].ToString();
            txtAge.Text = dt.Rows[0]["Age"].ToString();
            lblspecialization.Text = dt.Rows[0]["Specialization"].ToString();
            txtQualification.Text = dt.Rows[0]["Qualification"].ToString();
            lblGender.Text = dt.Rows[0]["Gender"].ToString();
            txtExperience.Text = dt.Rows[0]["Experience"].ToString();
            lblMobileNo.Text = dt.Rows[0]["MobileNo"].ToString();
            txtEmail.Text = dt.Rows[0]["EmailId"].ToString();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = @"update tbl_DoctorProfile set  Age=@Age, Qualification=@Qualification, Experience=@Experience, EmailId=@EmailId
            where DoctorCode=@DoctorCode";

            SqlParameter _Age = new SqlParameter("@Age", txtAge.Text.Trim());
            SqlParameter _Qualification = new SqlParameter("@Qualification", txtQualification.Text.Trim());
            SqlParameter _Experience = new SqlParameter("@Experience", txtExperience.Text.Trim());
            SqlParameter _EmailId = new SqlParameter("@EmailId", txtEmail.Text.Trim());
            SqlParameter _DoctorCode = new SqlParameter("@DoctorCode", lblregno.Text.Trim());



            if (cls.ExecuteSql(sql, new SqlParameter[] { _Age,_Qualification,_EmailId,_Experience,_DoctorCode }) > 0)
            {
                bindgrid();
                lblmsg.Text = "Updated";

            }
            else
            {
                lblmsg.Text = "Please try again...!!";
            }
        }



        catch (Exception ex)
        {
            lblmsg.Text = "please try again" + ex.Message;
        }
    }
}