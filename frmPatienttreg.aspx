<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="frmPatienttreg.aspx.cs" Inherits="_frmStudentreg" %>

<%@ Register assembly="RJS.Web.WebControl.PopCalendar" namespace="RJS.Web.WebControl" tagprefix="rjs" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
 <head>
 <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  
</head>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   <div align="center"  style="height:auto; width:1080px;" >
   <div class="container">
   <div class="row">
   <div class="col-lg-4"><asp:Panel ID="Panel1" runat="server" Width="600px">

        <table width="100%"  border="0" class="table-hover table-responsive table-bordered table-condensed success" align="center" >
   <tr class="success">
   <td colspan="2" align="center">
       
       <strong><h1 class="bold">Patient Registration</h1></strong></td></tr>
       <tr class="success">
        <td align="left" colspan="2">
         <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                Font-Italic="True" Font-Size="Larger" ForeColor="Red" ValidationGroup="s" />
           </td>
        </tr>
            <tr class="success">
                <td align="left">
                    <asp:Label ID="NAME" runat="server" CssClass="text-center" Font-Bold="True" 
                        style="font-size:x-large; font-family:Times New Roman;" Text="Name"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtname" Display="Dynamic" ErrorMessage="Enter your name" 
                        Font-Italic="True" Font-Size="Larger" ForeColor="Red" SetFocusOnError="True" 
                        Text="*" ValidationGroup="s"></asp:RequiredFieldValidator>
                </td>
            </tr>
        <tr class="success">
           <td align="left"><asp:Label ID="DOB" runat="server" Text="DOB" Font-Bold="True" CssClass="text-center" style="font-size:x-large; font-family:Times New Roman;"></asp:Label></td>
          <td align="left"> <asp:TextBox ID="txtdob" runat="server"  CssClass="form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="*" 
                  ErrorMessage="Enter your DOB" ValidationGroup="s" ControlToValidate="txtdob" 
                  Display="Dynamic" Font-Italic="True" Font-Size="Larger" ForeColor="Red" 
                  SetFocusOnError="True"></asp:RequiredFieldValidator>
              <rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtdob" 
                  Format="dd mmm yyyy" />
            </td>
        </tr>
          <tr class="success">
            <td align="left"><asp:Label ID="Label1" runat="server" Text="Mobile No." Font-Bold="True" CssClass="text-center" style="font-size:x-large; font-family:Times New Roman;"></asp:Label></td>
         <td align="left">  <asp:TextBox ID="txtmobileno" runat="server" 
                 CssClass="form-control" TextMode="Phone"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  Text="*" 
                 ErrorMessage="Enter your mobile no" ValidationGroup="s" 
                 ControlToValidate="txtmobileno" Display="Dynamic" Font-Italic="True" 
                 Font-Size="Larger" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
          </tr>
          <tr class="success">
            <td align="left"><asp:Label ID="Label6" runat="server" Text="EmailId" Font-Bold="True" CssClass="text-center" style="font-size:x-large; font-family:Times New Roman;"></asp:Label></td>
         <td align="left">  <asp:TextBox ID="TextBox1" runat="server" 
                 CssClass="form-control" TextMode="Email"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"  Text="*" 
                 ErrorMessage="Enter your EmailId" ValidationGroup="s" 
                 ControlToValidate="TextBox1" Display="Dynamic" Font-Italic="True" 
                 Font-Size="Larger" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                 ControlToValidate="TextBox1" Display="Dynamic" 
                 ErrorMessage="ease Enter Valid Email" Font-Italic="True" Font-Size="Larger" 
                 ForeColor="Red" SetFocusOnError="True" 
                 ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                 ValidationGroup="s">*</asp:RegularExpressionValidator>
              </td>
          </tr>
          <tr class="success">
            <td align="left"><asp:Label ID="Label2" runat="server" Text="Adhar Number" 
                    Font-Bold="True" CssClass="text-center" 
                    style="font-size:x-large; font-family:Times New Roman;"></asp:Label>
              </td>
         <td>  
           <asp:TextBox ID="txtuid" runat="server" CssClass="form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                 ErrorMessage="Enter your uid" ValidationGroup="s" ControlToValidate="txtuid" 
                 Display="Dynamic" Font-Italic="True" Font-Size="Larger" ForeColor="Red" 
                 SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
          </tr>
          <tr class="success">
            <td align="left"><asp:Label ID="Label5" runat="server" Text="Gender" Font-Bold="True" CssClass="text-center" style="font-size:x-large; font-family:Times New Roman;"></asp:Label>
              </td>
         <td>  
    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" 
                 Font-Italic="False" ForeColor="Black">
        <asp:ListItem>Select Gender</asp:ListItem>
        <asp:ListItem>Male</asp:ListItem>
        <asp:ListItem>Female</asp:ListItem>
        <asp:ListItem>Others</asp:ListItem>
    </asp:DropDownList>
           
             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                 ControlToValidate="DropDownList1" Display="Dynamic" 
                 ErrorMessage="Please Select Gender" Font-Italic="True" Font-Size="Larger" 
                 ForeColor="Red" SetFocusOnError="True" ValidationGroup="s">*</asp:RequiredFieldValidator>
           
           <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                 ErrorMessage="Enter your uid" ValidationGroup="s" ControlToValidate="txtuid" 
                 InitialValue="0">*</asp:RequiredFieldValidator></td>
          </tr>
          <tr class="success">
            <td align="left"><asp:Label ID="Label3" runat="server" Text="Password" Font-Bold="True" CssClass="text-center" style="font-size:x-large; font-family:Times New Roman;"></asp:Label>
              </td>
         <td>  
           <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="form-control"
                 ></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                 ErrorMessage="Enter your password" ValidationGroup="s" 
                 ControlToValidate="txtpassword" Display="Dynamic" Font-Italic="True" 
                 Font-Size="Larger" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
          </tr>
          <tr class="success">
            <td align="left"><asp:Label ID="Label4" runat="server" Text="Confirm password" Font-Bold="True" CssClass="text-center" style="font-size:x-large; font-family:Times New Roman;"></asp:Label>
              </td>
         <td align="left">  
           <asp:TextBox ID="txtconfirmpassword" runat="server" TextMode="Password" CssClass="form-control"
                 ></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                 ErrorMessage="confirm password" ValidationGroup="s" 
                 ControlToValidate="txtconfirmpassword" SetFocusOnError="True" 
                 Display="Dynamic" Font-Italic="True" Font-Size="Larger" ForeColor="Red">*</asp:RequiredFieldValidator></td>
          </tr>
           <tr class="success"><td colspan="2" align="center">
               <asp:Button ID="btnSubmit" class="btn btn-block btn-danger" runat="server" 
                   Text="Register" ValidationGroup="s" onclick="btnSubmit_Click" Font-Bold="True" 
                   Font-Names="Times New Roman" Font-Size="Larger"
                   /> 
        
              
              
        
              
               </td></tr></table>
    </asp:Panel></div>
    <div class="col-lg-2"></div>
   <div class="col-lg-6"> <div><img src="images/Lovepik_com-402173894-online-registration.png" class="img-responsive" style="width:800px; max-height:500px; margin-top:0px;"/></div></div>
   </div>
   </div>

    
   
    
   </div>      
</asp:Content>