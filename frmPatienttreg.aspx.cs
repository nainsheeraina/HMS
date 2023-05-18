using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class _frmStudentreg : System.Web.UI.Page
{

    clsDataAccess cls = new clsDataAccess();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
          
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
            string sql = "insert into tbl_PatientRegistration(Name, DOB,MobileNo,UID,Gender,EmailId)values(@Name,@DOB,@MobileNo,@UID,@Gender,@EmailId)";

            SqlParameter _Name = new SqlParameter("@Name", txtname.Text.Trim());
            SqlParameter _DOB = new SqlParameter("@DOB", txtdob.Text.Trim());

            SqlParameter _MobileNo = new SqlParameter("@MobileNo", txtmobileno.Text.Trim());
            SqlParameter _UID = new SqlParameter("@UID", txtuid.Text.Trim());
            SqlParameter _Gender = new SqlParameter("@Gender", DropDownList1.SelectedItem.Value);
            SqlParameter _EmailId = new SqlParameter("@EmailId", TextBox1.Text.Trim());
         

            if (cls.ExecuteSql(sql, new SqlParameter[] { _Name, _DOB, _MobileNo, _UID,_Gender,_EmailId }) > 0)
            {
                sql = @"insert into  tbl_UserLogin(UserId, Name, Password, Role, CreateDate, IsActive)values(@UserId,@Name, @Password, @Role, @CreateDate, 'Y')";

              
                SqlParameter UserId = new SqlParameter("@UserId", txtmobileno.Text.Trim());
                SqlParameter _UName = new SqlParameter("@Name", txtname.Text.Trim());
                SqlParameter _Password = new SqlParameter("@Password", txtpassword.Text.Trim());
                SqlParameter _Role = new SqlParameter("@Role","USR");
                SqlParameter _CreateDate = new SqlParameter("@CreateDate", System.DateTime.Now);
               int res=cls.ExecuteSql(sql, new SqlParameter[] { UserId, _UName, _Password, _Role, _CreateDate });
               if (res == 1)
                 
                   lblmsg.Text ="Succesfully Registered";
               else
                   
                  lblmsg.Text = "Mobile Number Already Registered!!";
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


