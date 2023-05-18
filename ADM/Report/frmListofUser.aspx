<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="frmListofUser.aspx.cs" Inherits="OPT_frmListofUser" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div><center><b><u><h1 style="font-family:Times New Roman; font-size:50px;">List Of Users</h1></u></b></center></div><br />
<div align="center">
</div>
 <div>
<table width="100%" class="table-hover table-responsive table-bordered table-condensed success">
<tr class="success">
<td class="bold" style="font-family:Times New Roman; font-size:large;">From</td><td>
    <asp:TextBox ID="txtfromdate" runat="server" Font-Size="X-Large" CssClass="form-control"></asp:TextBox>
    <rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtfromdate" 
        Format="dd mmm yyyy" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtfromdate" Display="Dynamic" 
        ErrorMessage="Please Select Date" Font-Italic="True" Font-Size="Larger" 
        ForeColor="Red" SetFocusOnError="True" ValidationGroup="s"></asp:RequiredFieldValidator>
    </td><td class="bold" style="font-family:Times New Roman; font-size:large;">To</td><td>
        <asp:TextBox ID="txttodate" runat="server" Font-Size="X-Large" CssClass="form-control"></asp:TextBox>
        <rjs:PopCalendar ID="PopCalendar2" runat="server" Control="txttodate" 
            Format="dd mmm yyyy" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txttodate" Display="Dynamic" 
            ErrorMessage="Please Select Date" Font-Italic="True" Font-Size="Larger" 
            ForeColor="Red" ValidationGroup="s"></asp:RequiredFieldValidator>
    </td>
    <td class="bold" style="font-family:Times New Roman; font-size:large;"> 
        <asp:LinkButton ID="LinkButton1" runat="server" 
            CssClass="form-control btn btn-block btn-warning" onclick="LinkButton1_Click" 
            ValidationGroup="s">Search</asp:LinkButton></td>
</tr>
</table>
</div>
<br />
<div>
<asp:GridView ID="GridView2" runat="server" BackColor="White"  
        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table table-bordered"
        Width="100%" ShowFooter="True" ShowHeaderWhenEmpty="True">
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
        <Columns>
       
        </Columns>
    </asp:GridView>
</div>
</asp:Content>

