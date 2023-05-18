<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="USR_Default" %>

<%@ Register assembly="RJS.Web.WebControl.PopCalendar" namespace="RJS.Web.WebControl" tagprefix="rjs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <div align="left" class="col-lg-6">
     <asp:Panel ID="Panel1" runat="server" GroupingText="" Width="400px" class="table-responsive table-hover">
        <asp:DataList ID="DataList1" runat="server" BackColor="White"  Width="100%"
            BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Horizontal">
            <AlternatingItemStyle BackColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderTemplate>Patient Profile</HeaderTemplate>
        <ItemTemplate>
        <table class="success">
        <tr>
        <td colspan="2">Name:  <%#Eval("Name")%></td>
        </tr>
        <tr>
        <td colspan="2">DOB:  <%#Eval("DOB")%></td>
        </tr>
         <tr>
        <td>Mobile No:</td><td> <%#Eval("MobileNo")%></td></tr>
                    <tr>
        <td>UID</td><td> <%#Eval("UID")%></td></tr>
         <tr>
        <td>Gender:</td><td> <%#Eval("Gender")%></td></tr>
                    <tr>
        <tr>
        <td>Email:</td><td> <%#Eval("EmailId")%></td></tr>
                    <tr>
        </table>
       
        </ItemTemplate>
        </asp:DataList>
      
                 <asp:LinkButton ID="lnkupdate" runat="server" 
            onclick="lnkupdate_Click" class="btn btn-block btn-warning">Update Profile</asp:LinkButton></td>
          
    </asp:Panel>

</div>
<div>
    <asp:Panel ID="pnlprofile" runat="server" GroupingText="Update Profile" Visible="false">
    <table width="100%" class="table-hover table-responsive table-bordered table-condensed success">
    <tr class="success">
    <td class="bold" style="font-family:Times New Roman; font-size:large;">Reg No</td> <td class="bold" style="font-family:Times New Roman; font-size:large;">
        <asp:Label ID="lblregno" runat="server" Text="Label"></asp:Label></td> <td class="bold" style="font-family:Times New Roman; font-size:large;">Name</td> <td class="bold" style="font-family:Times New Roman; font-size:large;">
            <asp:Label ID="lblname" runat="server" Text="lblname"></asp:Label></td>
    </tr>
        <tr class="success">
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                DOB</td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control"></asp:TextBox>
                <rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtDOB" 
                    ControlFocusOnError="True" Format="dd mmm yyyy" RequiredDate="True" 
                    ValidationGroup="s" />
            </td>
             <td class="bold" style="font-family:Times New Roman; font-size:large;">
                UID</td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                <asp:TextBox ID="txtuid" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
            
        <tr class="success">
            <td class="bold" style="font-family:Times New Roman; font-size:large;">Gender
               </td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
            <asp:Label ID="Label1" runat="server" Text="lblgender"></asp:Label></td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                EmailId</td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
           
        </tr>
            
        <tr class="success">
            <td align="center" colspan="4" class="bold" style="font-family:Times New Roman; font-size:large;">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-block btn-warning"
                    onclick="btnSubmit_Click" />
                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="#990000"></asp:Label>
            </td>
        </tr>
    </table>
    </asp:Panel>
</div>  
 <div class="col-lg-6"> <img src="https://www.improvediagnosis.org/wp-content/uploads/2020/11/patient-transparent.png" /></div>
</asp:Content>

