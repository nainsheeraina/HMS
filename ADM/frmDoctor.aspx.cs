using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class ADM_frmDoctor : System.Web.UI.Page
{


    clsDataAccess cls = new clsDataAccess();

    void bindgrid()
    {
        string strWhere = string.Empty;
        
        string sql = @"SELECT     TOP (200) DoctorCode, DoctorName, Specialization, Qualification, Age, Gender,Experience,EmailId,MobileNo
FROM         tbl_DoctorProfile" + strWhere;


        DataTable dt = cls.GetDataTable(sql);

        GridView1.DataSource = dt;
        GridView1.DataBind();

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

    protected void dbCourse_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }




    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = @"insert into tbl_DoctorProfile(DoctorName, Specialization, Qualification, Gender, Age, Experience, MobileNo, EmailId)values
                            (@DoctorName, @Specialization, @Qualification, @Gender, @Age, @Experience, @MobileNo, @EmailId)";

            SqlParameter _DoctorName = new SqlParameter("@DoctorName", txtName.Text.Trim());
            SqlParameter _Specialization = new SqlParameter("@Specialization", txtSpecialization.Text.Trim());
            SqlParameter _Qualification = new SqlParameter("@Qualification", txtQualification.Text.Trim());
            SqlParameter _Gender = new SqlParameter("@Gender", DropDownList1.SelectedItem.Value);
            SqlParameter _Age = new SqlParameter("@Age", txtAge.Text.Trim());
            SqlParameter _Experience = new SqlParameter("@Experience", txtExperience.Text.Trim());
            SqlParameter _MobileNo = new SqlParameter("@MobileNo", txtMoNo.Text.Trim());
            SqlParameter _EmailId = new SqlParameter("@EmailId", txtEmailId.Text.Trim());
           
            if (cls.ExecuteSql(sql, new SqlParameter[] { _DoctorName, _Specialization, _Qualification, _Gender, _Age, _Experience, _MobileNo,  _EmailId}) > 0)
            {

                sql = @"insert into  tbl_UserLogin(UserId, Name, Password, Role, CreateDate, IsActive)values(@UserId,@Name, @Password, @Role, @CreateDate, 'Y')";


                SqlParameter UserId = new SqlParameter("@UserId", txtMoNo.Text.Trim());
                SqlParameter _UName = new SqlParameter("@Name", txtName.Text.Trim());
                SqlParameter _Password = new SqlParameter("@Password", txtPass.Text.Trim());
                SqlParameter _Role = new SqlParameter("@Role", "DOC");
                SqlParameter _CreateDate = new SqlParameter("@CreateDate", System.DateTime.Now);
                int res = cls.ExecuteSql(sql, new SqlParameter[] { UserId, _UName, _Password, _Role, _CreateDate });
                if (res == 1)
                    lblcmsg.Text = "Successfully Added";
                else

                    lblcmsg.Text = "Please try again...!!";

                lblcmsg.Text = "Inserted";
                bindgrid();
            }
            else
            {
                lblcmsg.Text = "please try again";
            }

        }
        catch (Exception ex)
        {
            lblcmsg.Text = "please try again" + ex.Message;
        }
    }
    protected void btnCreset_Click(object sender, EventArgs e)
    {
        txtName.Text = String.Empty;
        txtQualification.Text = String.Empty;
        txtSpecialization.Text = String.Empty;
        txtPass.Text = String.Empty;
        txtMoNo.Text = String.Empty;
        txtExperience.Text = String.Empty;
        txtEmailId.Text = String.Empty;
        txtConfpass.Text = String.Empty;
        txtAge.Text = String.Empty;
        DropDownList1.Text = String.Empty;
    }
}