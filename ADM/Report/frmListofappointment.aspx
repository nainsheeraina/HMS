<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="frmListofappointment.aspx.cs" Inherits="OPT_frmListofappointment" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   <div><center><b><u><h1 style="font-family:Times New Roman; font-size:50px;">Appointment List</h1></u></b></center></div><br />
    <div>
<table width="100%" style="margin-bottom:10px;" class="table-hover table-responsive table-bordered table-condensed success">
<tr class="success">
<td class="bold" style="font-family:Times New Roman; font-size:large;">From</td><td>
    <asp:TextBox ID="txtfromdate" runat="server" Font-Names="Times New Roman" CssClass="form-control" 
        Font-Size="X-Large" ValidationGroup="s"></asp:TextBox>
    <rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtfromdate" 
        Format="dd mmm yyyy" Font-Size="X-Large" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtfromdate" Display="Dynamic" 
        ErrorMessage="Please Select date" Font-Italic="True" Font-Size="Larger" 
        ForeColor="Red" SetFocusOnError="True" ValidationGroup="s"></asp:RequiredFieldValidator>
    </td><td>To</td><td>
        <asp:TextBox ID="txttodate" runat="server" Font-Names="Times New Roman" CssClass="form-control"
            Font-Size="X-Large"></asp:TextBox>
        <rjs:PopCalendar ID="PopCalendar2" runat="server" Control="txttodate" 
            Format="dd mmm yyyy" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txttodate" Display="Dynamic" 
            ErrorMessage="Please Select Date" Font-Italic="True" Font-Size="Larger" 
            ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
    </td>
 
<td >
    <asp:LinkButton ID="LinkButton1" runat="server" 
        CssClass="btn btn-warning form-control btn-block " onclick="LinkButton1_Click" 
        ValidationGroup="s">Search</asp:LinkButton>
    </td>
</tr>
</table>
</div>
<br />
<div>
<asp:GridView ID="GridView2" runat="server" BackColor="White"  DataKeyNames="appointment_no" CssClass="table table-bordered"
        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        Width="100%" ShowHeaderWhenEmpty="True">
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
       
    </asp:GridView>
</div>
</asp:Content>

