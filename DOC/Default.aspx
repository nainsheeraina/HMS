<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="DOC_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div class="Container">


<div  class="col-lg-6" align="left">

    <asp:Panel ID="Panel1" runat="server" GroupingText="Doctor Profile" Width="400px" class="table-responsive table-hover">
        <asp:DataList ID="DataList1" runat="server" BackColor="White"  Width="100%" 
            BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Horizontal">
            <AlternatingItemStyle BackColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderTemplate>Doctor Profile</HeaderTemplate>
        <ItemTemplate>
        <table class="success" >
        <tr>
        <td colspan="2">Name:  <%#Eval("DoctorName")%></td>
        </tr>
        <tr>
          <td>Specialization:</td><td> <%#Eval("Specialization")%></td>
        </tr>
         <tr>
          <td>Qualification:</td><td> <%#Eval("Qualification")%></td>
        </tr>
        <tr>
        <td>Gender:</td><td> <%#Eval("Gender")%></td></tr>

         <tr>
        <td>Age:</td><td> <%#Eval("Age")%></td></tr>
                <tr>
        <td>Experience:</td><td> <%#Eval("Experience")%></td></tr>
                
           <tr>
        <td>MobileNo:</td><td> <%#Eval("MobileNo")%></td></tr>
                <tr>
        <td>EmailId:</td><td> <%#Eval("EmailId")%></td></tr>
                
        </table>
       
        </ItemTemplate>
        </asp:DataList>
            <asp:LinkButton ID="lnkupdate" runat="server" class="btn btn-block btn-warning"
            onclick="lnkupdate_Click">Update Profile</asp:LinkButton></td>
    </asp:Panel>
    </div>
    <div>
    <asp:Panel ID="pnlprofile" runat="server" GroupingText="Update Profile" Visible="false">
    <table width="100%" class="table-hover table-responsive table-bordered table-condensed success">
    <tr class="success">
    <td class="bold" style="font-family:Times New Roman; font-size:large;">Doctor Code:</td> <td class="bold" style="font-family:Times New Roman; font-size:large;">
        <asp:Label ID="lblregno" runat="server" Text="Label"></asp:Label></td> <td class="bold" style="font-family:Times New Roman; font-size:large;">Name:</td> <td class="bold" style="font-family:Times New Roman; font-size:large;">
            <asp:Label ID="lblname" runat="server" Text="lblname"></asp:Label></td>
    </tr>
        <tr class="success">
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                Age:</td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" 
         Font-Names="Times New Roman" 
                    Font-Size="X-Large" ValidationGroup="s"></asp:TextBox>
            </td>
            
        <tr class="success">
            <td class="bold" style="font-family:Times New Roman; font-size:large;">Specialization
               </td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                <asp:Label ID="lblspecialization" runat="server" Text="lblspecialization"></asp:Label>
            </td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                Qualification</td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control" 
         Font-Names="Times New Roman" 
                    Font-Size="X-Large" ValidationGroup="s" ></asp:TextBox>
            </td>
        </tr>
         <tr class="success">
            <td class="bold" style="font-family:Times New Roman; font-size:large;">Gender
               </td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                <asp:Label ID="lblGender" runat="server" Text="lblGender"></asp:Label>
            </td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                Experience</td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control" 
         Font-Names="Times New Roman" 
                    Font-Size="X-Large" ValidationGroup="s"></asp:TextBox>
            </td>
        </tr>
         <tr class="success">
            <td class="bold" style="font-family:Times New Roman; font-size:large;">Mobile No
               </td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                <asp:Label ID="lblMobileNo" runat="server" Text="lblMobileNo"></asp:Label>
            </td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                Email</td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" 
         Font-Names="Times New Roman" 
                    Font-Size="X-Large" ValidationGroup="s"></asp:TextBox>
            </td>
        </tr>
        <tr class="success">
            <td align="center" colspan="4" class="bold" style="font-family:Times New Roman; font-size:large;">
                <asp:Button ID="btnSubmit" runat="server" Text="Update" CssClass="btn btn-block btn-warning"
                    onclick="btnSubmit_Click" />
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="#990000"></asp:Label>
            </td>
        </tr>
    </table>
    </asp:Panel>
    
    </div>
    <div class="col-lg-6"><img src="https://www.pngarts.com/files/3/Doctor-PNG-Transparent-Image.png"  style="height:400px; width:400px;"/></div>
    </div>
</asp:Content>

