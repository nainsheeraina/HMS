using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
public partial class FrmLogin : System.Web.UI.Page
{
    clsDataAccess cls = new clsDataAccess();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    void login()
    {
        string url = string.Empty;
        string sql = @"SELECT     name , UserId, Password, Role
            FROM         tbl_UserLogin where IsActive='Y' and UserId='" + Txtuser.Text.Trim() + "' and Password='" + Txtpassword.Text.Trim() + "' ";
        DataTable dt = cls.GetDataTable(sql);
        if (dt.Rows.Count > 0)
        {
            Session.Clear();
             Session["Role"] = dt.Rows[0]["Role"].ToString();
             Session["name"] = dt.Rows[0]["name"].ToString();
             Session["UserId"] = dt.Rows[0]["UserId"].ToString();

           
            string role = dt.Rows[0]["Role"].ToString().ToUpper();
            if (role.ToUpper() == "ADM")
            {
                url = "~/ADM/Default.aspx";
            }
            else if (role.ToUpper() == "DOC")
            {
                url = "~/DOC/Default.aspx";
            }
            else if (role.ToUpper() == "USR")
            {
                url = "~/USR/Default.aspx";
            }
            else if (role.ToUpper() == "OPT")
            {
                url = "~/OPT/Default.aspx";
            }
            else
            {
                   url = "FrmLogin.aspx";
            }
            
             FormsAuthentication.Initialize();
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, Txtuser.Text.Trim(), DateTime.Now, DateTime.Now.AddMinutes(30), false, dt.Rows[0]["Role"].ToString().Trim(), FormsAuthentication.FormsCookiePath);

            // Encrypt the cookie using the machine key for secure transport
            string hash = FormsAuthentication.Encrypt(ticket);
            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash); // Hashed ticket

            // Set the cookie's expiration time to the tickets expiration time
            if (ticket.IsPersistent) cookie.Expires = ticket.Expiration;

            // Add the cookie to the list for outgoing response
            Response.Cookies.Add(cookie);
            Response.Redirect(url);
         
        }
        else
        {
            lblmsg.Text = "Invalid user details..";
        }

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        ccJoin.ValidateCaptcha(txtCaptha.Text.Trim());
        if (!ccJoin.UserValidated)
        {
            lblmsg.Text = "Enter Text Again Shown in Code";
            txtCaptha.Focus();
            return;
        }
        System.Threading.Thread.Sleep(2000);
        login();
    }
}