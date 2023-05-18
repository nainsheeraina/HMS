using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class USR_Default : System.Web.UI.Page
{
    clsDataAccess cls = new clsDataAccess();
    void bindgrid()
    {
        string sql = @"SELECT       Name, DOB, MobileNo, UID,Gender,EmailId  FROM         tbl_PatientRegistration WHERE MobileNo='" + Session["UserId"].ToString() + "'";
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
        string sql = @"SELECT    regno, Name, MobileNo, UID, DOB,Gender,EmailId
        FROM         tbl_PatientRegistration WHERE MobileNo='" + Session["UserId"].ToString() + "'";
        DataTable dt = cls.GetDataTable(sql);
        if (dt.Rows.Count > 0)
        {
            lblregno.Text = dt.Rows[0]["regno"].ToString();
            lblname.Text = dt.Rows[0]["Name"].ToString();
            txtDOB.Text = dt.Rows[0]["DOB"].ToString();
            txtuid.Text = dt.Rows[0]["UID"].ToString();
            Label1.Text = dt.Rows[0]["Gender"].ToString();
            TextBox1.Text = dt.Rows[0]["EmailId"].ToString();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
         try
        {
            string sql = @"update tbl_PatientRegistration set  UID=@UID, DOB=@DOB, Gender=@Gender,EmailId=@EmailId
            where regno=@regno";

            SqlParameter _UID = new SqlParameter("@UID", txtuid.Text.Trim());
             SqlParameter _DOB=new SqlParameter("@DOB",txtDOB.Text.Trim());
             SqlParameter _regno = new SqlParameter("@regno", lblregno.Text.Trim());
             SqlParameter _Gender = new SqlParameter("@Gender", Label1.Text.Trim());
             SqlParameter _EmailId = new SqlParameter("@EmailId", TextBox1.Text.Trim());
             
               


            if (cls.ExecuteSql(sql, new SqlParameter[] { _UID,_DOB,_regno,_Gender,_EmailId }) > 0)
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