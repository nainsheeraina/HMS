using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class USR_BookAppointment : System.Web.UI.Page
{

    clsDataAccess cls = new clsDataAccess();

    void bindAppointment()
    {
        string sql = @"SELECT   appointment_no, UserID, DateOfAppointment, DoctorCode, HealthIssue, CDate,

CASE WHEN status='A' then 'Approved' when  status='R' then 'Reject' else 'Pending' end as status ,opt_remarks,alloted_doa
            FROM         tbl_appointment where UserID=" + Session["UserId"].ToString();


        DataTable dt = cls.GetDataTable(sql);

        GridView2.DataSource = dt;
        GridView2.DataBind();

    }

    void bindgrid()
    {
        string sql = @"SELECT top(1)    DoctorCode
                    FROM         tbl_DoctorProfile
                    ORDER BY DoctorName";

        DataTable dt = cls.GetDataTable(sql);


        sql = @"SELECT   DoctorName,DoctorCode
                    FROM         tbl_DoctorProfile
                    ORDER BY DoctorName";

        DataTable dt1 = cls.GetDataTable(sql);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        
     
     foreach( GridViewRow gvr in GridView1.Rows)
     {
         DropDownList ddldoctor = (DropDownList)gvr.FindControl("ddldoctor");
         ddldoctor.DataSource = dt1;
         ddldoctor.DataTextField = "DoctorName";
         ddldoctor.DataValueField = "DoctorCode";
         ddldoctor.DataBind();
         ddldoctor.Items.Insert(0, new ListItem("--select--", "0"));

     }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/FrmLogin.aspx");
        }
        if (!IsPostBack)
        {
            bindgrid();
            bindAppointment();


        }
    }

    protected void dbCourse_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }






    protected void lnkAppointment_Click(object sender, EventArgs e)
    {
        LinkButton lnkAppointment = (LinkButton)sender;

        GridViewRow gvr=(GridViewRow)lnkAppointment.NamingContainer;
        TextBox txtDOA = (TextBox)gvr.FindControl("txtDOA");
        TextBox txtHealthissue = (TextBox)gvr.FindControl("txtHealthissue");
        DropDownList ddldoctor = (DropDownList)gvr.FindControl("ddldoctor");
        if (txtDOA.Text.Length == 0)
        {
            lblmsg.Text = "please enter DOA...!!";
            return;
        }
        
        try
        {
             string sql = "insert into tbl_appointment(UserID, DateOfAppointment, HealthIssue, DoctorCode)values(@UserID, @DateOfAppointment, @HealthIssue, @DoctorCode)";

             SqlParameter _UserID = new SqlParameter("@UserID", Session["UserId"].ToString());
             SqlParameter _DateOfAppointment = new SqlParameter("@DateOfAppointment", txtDOA.Text.Trim());
             SqlParameter _HealthIssue = new SqlParameter("@HealthIssue", txtHealthissue.Text.Trim());
             SqlParameter _DoctorCode = new SqlParameter("@DoctorCode", ddldoctor.SelectedValue.Trim());
             if (cls.ExecuteSql(sql, new SqlParameter[] { _UserID, _DateOfAppointment, _HealthIssue, _DoctorCode }) > 0)
             {
                 lblmsg.Text = "Submitted!!!!";
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