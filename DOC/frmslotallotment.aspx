<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="frmslotallotment.aspx.cs" Inherits="OPT_frmListofappointment" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <%--    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 456px;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   <div><center><b><u><h1 style="font-family:Times New Roman; font-size:50px;">Patient Details</h1></u></b></center></div><br />
    <div>
    <asp:Panel ID="pnlmain" runat="server">
     <div align="center">
    <asp:LinkButton ID="lnkSubmit" runat="server" onclick="lnkSubmit_Click" class=" btn form-control btn-block btn-warning table-hover">Submit</asp:LinkButton>

    <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
</div>
<br />
<div>
<asp:GridView ID="GridView2" runat="server" BackColor="White"  DataKeyNames="appointment_no,regno" CssClass="table table-bordered"
        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
        Width="100%" onselectedindexchanged="GridView2_SelectedIndexChanged" 
        ShowFooter="True" ShowHeaderWhenEmpty="True" >
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
            <asp:LinkButton ID="lnkSelect" runat="server" OnClick="lnkSelect_CLick">Select</asp:LinkButton>
        </ItemTemplate>
        </asp:TemplateField>
             <asp:TemplateField HeaderText="SL.">
        <ItemTemplate>
        <%#Container.DataItemIndex+1 %>
        </ItemTemplate>
        </asp:TemplateField>

        
        
        </Columns>
    </asp:GridView>
    </div>
    </asp:Panel>

</div>
<div>
<div>
    <asp:Panel ID="pnlPrescriptionDetails" runat="server" style="height: 56px">
    <table width="100%" class="table-hover table-responsive table-bordered table-condensed success">
    <tr class="success">
    <td class="bold" style="font-family:Times New Roman; font-size:large;">Appointment No.</td><td class="bold" style="font-family:Times New Roman; font-size:large;">
        <asp:Label ID="lblappointmentno" runat="server" Text=""></asp:Label></td><td class="bold" style="font-family:Times New Roman; font-size:large;">Registration No.</td><td class="bold" style="font-family:Times New Roman; font-size:large;">
        <asp:Label ID="lblregno" runat="server" Text=""></asp:Label>
        &nbsp;</td>
    </tr>
        <tr class="success">
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                Remarks</td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                <asp:TextBox ID="txtRemarks" runat="server" class="form-control" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                Medicine</td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;" >
                <asp:TextBox ID="txtMedicine" runat="server" CssClass="form-control" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr class="success">
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                Date Of Check Up</td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;"">
                <asp:TextBox ID="ddlDateOfCheckup" runat="server" CssClass="form-control"></asp:TextBox>
                <rjs:PopCalendar ID="PopCalendar1" runat="server" Control="ddlDateOfCheckup" 
                    Format="dd mmm yyyy" />
            </td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                Test Details</td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
                <asp:TextBox ID="txtMedicineDetails" runat="server" CssClass="form-control" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr class="success">
            <td align="center" class="style1" colspan="4">
                <asp:Button ID="btnsubmit" runat="server" onclick="btnsubmit_Click" class="btn btn-block btn-danger"
                    Text="Submit" />
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Close" class="btn btn-block btn-warning" />
            </td>
        </tr>
    </table>
    </asp:Panel>
</div>
</div>
</asp:Content>

