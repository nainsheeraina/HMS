<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FrmLogin.aspx.cs" Inherits="FrmLogin" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <head>
 <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  
  
</head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   <!-- <link href="Styles/login.css" rel="stylesheet" type="text/css" />-->
   <div class="container">
   <div class="row">
   <div class="col-lg-4"><div class="login" align="left"    style="background-position:left; position: absolute; background-repeat:no-repeat; width:100% ; margin:12px auto; ">
<div class="table" style="width:80%;">

<table align="left"    class="table-hover"  border="1"style="margin-top:20px;  color:#fff; margin-left:350px; width: 352px; height: 352px; font-family: Arial; background-color: #C0C0C0;">
<tr class="success">
<td colspan="2" align="center" class="style2"><h1 class="bold">
    <strong style="color: #000000; font-size: 35px; font-weight: bold; font-family:Times New Roman;">LOGIN</strong></h1>
</td>
</tr>
<tr class="success">
<td class="style1" align="center"><b style="color: #000000; font-size: 20px; font-family:Times New Roman;"> MOBILE NUMBER</b></td>
<td>
<center><asp:TextBox ID="Txtuser" runat="server" Height="25px" Width="166px" 
        ForeColor="Black" CssClass="form-control input-lg" 
        Font-Names="Times New Roman" Font-Size="X-Large" ValidationGroup="s"></asp:TextBox></center>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="Txtuser"
        ErrorMessage="Please Enter Mobile Number" ValidationGroup="s" 
        Display="Dynamic" Font-Italic="True" Font-Size="Larger" ForeColor="Red" 
        SetFocusOnError="True">*</asp:RequiredFieldValidator>
</td>
</tr>
<tr class="success">
<td class="style1" align="center" ><b style="color: #000000; font-size: 20px; font-family:Times New Roman;">PASSWORD</b></td>
<td>
    <center><asp:TextBox ID="Txtpassword" runat="server" Width="168px" Height="25px" 
            ForeColor="Black" CssClass="form-control input-lg" 
            Font-Names="Times New Roman" Font-Size="X-Large" TextMode="Password" 
            ValidationGroup="s"></asp:TextBox></center>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ControlToValidate="Txtpassword" ErrorMessage="Please Enter your password" 
        SetFocusOnError="True" ValidationGroup="s" Display="Dynamic" 
        Font-Size="Larger" ForeColor="Red">*</asp:RequiredFieldValidator>
</td>
</tr>
<tr class="success">
<td class="style1" align="center" ><b style="color: #000000; font-size: 20px; font-family:Times New Roman;">CAPTCHA</b></td>
<td align="center">
    <asp:TextBox ID="txtCaptha" runat="server" Width="168px" Height="25px" 
        ForeColor="Black" CssClass="form-control input-lg" 
        Font-Names="Times New Roman" Font-Size="X-Large" ValidationGroup="s"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
        ControlToValidate="txtCaptha" Display="Dynamic" 
        ErrorMessage="Please Enter Captcha" Font-Italic="True" Font-Size="Larger" 
        ForeColor="Red" SetFocusOnError="True" ValidationGroup="s">*</asp:RequiredFieldValidator>
</td>
</tr>
<tr class="success">
<td class="style1" align="center" colspan="2" >
        <cc1:CaptchaControl ID="ccJoin" runat="server" CaptchaBackgroundNoise="None" CaptchaLength="4" CssClass="cptha"
                                                CaptchaHeight="35" CaptchaWidth="310" CaptchaLineNoise="None" CaptchaMinTimeout="5"
                                                CaptchaMaxTimeout="240" FontColor="#529E00"/></td>
</tr>
<tr class="success">
<td colspan="2" align="center" >
<asp:Button CssClass="loginbtn btn-danger btn-block" ID="btnLogin" runat="server" Text="Login" ValidationGroup="s" 
         onclick="btnLogin_Click" BorderStyle="Solid" BorderWidth="2px" 
        ForeColor="Black" BorderColor="Black" Font-Bold="True" Font-Size="21px" />
    &nbsp;
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ValidationGroup="s" Font-Italic="True" 
        Font-Size="Larger" ForeColor="Red" />
    <br />
    <br />
    <asp:Label ID="lblmsg" runat="server" BackColor="Yellow" Font-Bold="True" 
        ForeColor="Red"></asp:Label>
</td>
</tr>
</table>
</div>
  </div></div>
   <div class="col-lg-2"></div>
   <div class="col-lg-6"><img src="https://startup.mp.gov.in/assets/img/login-bg.png" height="400px"  width="400px" style="margin-left:200px;"/>
   </div>
   </div>
   </div>

</asp:Content>

