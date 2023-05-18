<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="frmslotallotment.aspx.cs" Inherits="OPT_frmListofappointment" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div><center><b><u><h1 style="font-family:Times New Roman; font-size:50px;">Slot Alotment</h1></u></b></center></div><br />
    <div align="center">
    <asp:LinkButton ID="lnkSubmit" runat="server" onclick="lnkSubmit_Click" class=" btn form-control btn-block btn-warning table-hover">Submit</asp:LinkButton>
    <asp:Label ID="lblmsg" runat="server" Text="" style="font-family:Times New Roman; font-size:30px;"></asp:Label>
</div>
<br />
<div>
<asp:GridView ID="GridView2" runat="server" BackColor="White"  DataKeyNames="appointment_no" CssClass=" table-bordered table-condensed"
        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        Width="100%">
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
        <asp:TemplateField HeaderText="Select">
        <ItemTemplate>
            <asp:CheckBox ID="CheckBox1" runat="server" />
        </ItemTemplate>
        </asp:TemplateField>
             <asp:TemplateField HeaderText="SL.">
        <ItemTemplate>
        <%#Container.DataItemIndex+1 %>
        </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Status">
        <ItemTemplate>
            <asp:DropDownList ID="ddlpaymentstatus" runat="server">
            <asp:ListItem Text="Select" Value="0" Selected="True"></asp:ListItem>
            <asp:ListItem Text="Paid" Value="P"></asp:ListItem>
           

            </asp:DropDownList>
        </ItemTemplate>
        </asp:TemplateField>
        
        
        </Columns>
    </asp:GridView>
</div>
<div>
<asp:GridView ID="gvslotalloteddata" runat="server" BackColor="White"  DataKeyNames="appointment_no"
        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        Width="100%">
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
        
             <asp:TemplateField HeaderText="SL.">
        <ItemTemplate>
        <%#Container.DataItemIndex+1 %>
        </ItemTemplate>
        </asp:TemplateField>

        
        
        
        </Columns>
    </asp:GridView>
</div>
</asp:Content>


