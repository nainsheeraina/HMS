<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="BookAppointment.aspx.cs" Inherits="USR_BookAppointment" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div><center><b><u><h1 style="font-family:Times New Roman; font-size:50px;">Book Appointment</h1></u></b></center></div><br />
    <div align="center">
    <asp:Label ID="lblmsg" runat="server" Text="" style="font-family:Times New Roman; font-size:30px;"></asp:Label>
</div>
<div>
    <asp:GridView ID="GridView1" runat="server" BackColor="White" CssClass=" table-bordered table-condensed"
        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        Width="100%" AutoGenerateColumns="False">
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
       
        <asp:TemplateField HeaderText="DOA">
        <ItemTemplate>
            <asp:TextBox ID="txtDOA" runat="server" CssClass="form-control"></asp:TextBox>
            <rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtDOA"  />
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Doctor Name">
        <ItemTemplate>
            <asp:DropDownList ID="ddldoctor" runat="server" CssClass="form-control">
            
            </asp:DropDownList>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Health Issue">
        <ItemTemplate>
            <asp:TextBox ID="txtHealthissue" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
        </ItemTemplate>
        </asp:TemplateField>
         <asp:TemplateField>
        <ItemTemplate>
            <asp:LinkButton ID="lnkAppointment" runat="server" Font-Overline="false" 
                onclick="lnkAppointment_Click" class="btn btn-block btn-warning">Book Appointment</asp:LinkButton>
        </ItemTemplate>
        </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
<br />
<div>

<asp:GridView ID="GridView2" runat="server" BackColor="White" CssClass=" table-bordered table-condensed"
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

