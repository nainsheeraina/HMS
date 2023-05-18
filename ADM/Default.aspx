<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="ADM_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script src="../FusionCharts/FusionCharts.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  <div>
    <table width="100%" border="1" class=" table-condensed table-responsive table-hover table">
   <%-- <tr><td>Company</td><td>
        <asp:DropDownList ID="ddlpost" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ddlpost_SelectedIndexChanged">
        </asp:DropDownList>
    </td>
    </tr>--%>
    <tr class="success">
    <td>Chart Type </td>

    <td><asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
            RepeatColumns="5">
        <asp:ListItem Selected="True" Value="1" Text="Column 3D"></asp:ListItem>
        <asp:ListItem Value="2" Text="Column 2D"></asp:ListItem>
        <asp:ListItem Value="3" Text="Line"></asp:ListItem>
           <asp:ListItem Value="4" Text="Pie 3d"></asp:ListItem>
        </asp:RadioButtonList></td>
    </tr>
    <tr class="danger">
    <td>Type</td>

    <td>
        <asp:DropDownList ID="ddltype" runat="server" AutoPostBack="True" onselectedindexchanged="ddltype_SelectedIndexChanged" 
            >
           <%-- <asp:ListItem Selected="True" Value="R" Text="Registration Wise"></asp:ListItem>--%>
            
              <asp:ListItem  Value="G" Text="Gender Wise"></asp:ListItem>
        </asp:DropDownList>
        </td>
    </tr>
    </table>

        </div>
<div align="center">

  <asp:Literal ID="Literal1" runat="server"></asp:Literal>
</div>

</asp:Content>

