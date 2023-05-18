using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class OPT_frmListofUser : System.Web.UI.Page
{

    clsDataAccess cls = new clsDataAccess();
    void bindAppointment()
    {
        string strWhere = string.Empty;
        if (txtfromdate.Text.Length > 0 & txttodate.Text.Length > 0)
        {
            strWhere = " where tbl_UserLogin.CreateDate between '" + txtfromdate.Text.Trim() + "' and '" + txttodate.Text.Trim() + "'";
        }
        string sql = @"SELECT     TOP (200) UserID, Name, Password, Role, CreateDate, IsActive
FROM         tbl_UserLogin" +strWhere;


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




    protected void txtfromdate_TextChanged(object sender, EventArgs e)
    {

    }
    protected void txttodate_TextChanged(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        bindAppointment();
    }
}