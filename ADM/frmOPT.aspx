<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="frmOPT.aspx.cs" Inherits="ADM_frmOPT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 80%;
            border-style: solid;
            border-width: 4px;
            border-color:Black;
        }
        .heading
        {
            color:Black;
        }
        .style3
        {
        }
        .style4
        {
            width: 231px;
        }
        .style5
        {
            width: 276px;
        }
        .style6
        {
            width: 330px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div align=center>
     <center><h1 style="font-family:Times New Roman; font-size:50px;"><b><u>Register Operator</u></b></h1></center>
        <table class="table-hover table-responsive table-bordered table-condensed success">
            <tr class="success">
                <td class="style3" colspan="4">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="True" 
                        Font-Italic="True" Font-Names="Times New Roman" Font-Size="Larger" 
                        ForeColor="Red" ValidationGroup="s" />
                </td>
            </tr>
            <tr class="success">
                <td class="bold" style="font-family:Times New Roman; font-size:large;">
                Operator Name :
                    &nbsp;</td>
                <td class="style5">
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"
                         Font-Bold="False" Font-Italic="False" 
                        Font-Names="Times New Roman" Font-Size="X-Large" ValidationGroup="s"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RFCname" runat="server" 
                            ControlToValidate="txtName" ErrorMessage="Enter operator Name" 
                        Display="Dynamic" Font-Bold="True" Font-Italic="True" 
                        Font-Names="Times New Roman" Font-Size="Larger" ForeColor="Red" 
                        SetFocusOnError="True" ValidationGroup="s">*</asp:RequiredFieldValidator>
                    &nbsp;</td>
                <td class="bold" style="font-family:Times New Roman; font-size:large;">
                Gender:
                    &nbsp;</td>
                <td class="style6" >
                    &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Font-Bold="False" 
                        Font-Italic="False" Font-Names="Times New Roman" Font-Size="X-Large" CssClass="form-control"
                        ValidationGroup="s">
                        <asp:ListItem>Select Gender</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RFCState" runat="server" 
                            ControlToValidate="DropDownList1" ErrorMessage="Please Select Gender" 
                        Display="Dynamic" Font-Bold="True" Font-Italic="True" 
                        Font-Names="Times New Roman" Font-Size="Larger" ForeColor="Red" 
                        SetFocusOnError="True" ValidationGroup="s">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="success">
                <td class="bold" style="font-family:Times New Roman; font-size:large;"">
                 Age :
                    &nbsp;</td>
                <td class="style5">
                <asp:TextBox ID="txtAge" runat="server" CssClass="form-control"  
                        Font-Bold="False" Font-Names="Times New Roman" Font-Size="X-Large" 
                        TextMode="Number" ValidationGroup="s"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        Display="Dynamic" ErrorMessage="Enter Age" Font-Bold="True" Font-Italic="True" 
                        Font-Names="Times New Roman" Font-Size="Larger" ForeColor="Red" 
                        ControlToValidate="txtAge" SetFocusOnError="True" ValidationGroup="s">*</asp:RequiredFieldValidator>
                </td>
                <td class="bold" style="font-family:Times New Roman; font-size:large;">
                 Mobile No :
                    &nbsp;</td>
                <td class="style6">
                <asp:TextBox ID="txtMoNo" runat="server" CssClass="form-control"
                        Font-Names="Times New Roman" Font-Size="X-Large" TextMode="Phone" 
                        ValidationGroup="s"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RFCMoNo" runat="server" 
                            ControlToValidate="txtMoNo" ErrorMessage="Enter Mobile Number" 
                        Display="Dynamic" Font-Bold="True" Font-Italic="True" 
                        Font-Names="Times New Roman" Font-Size="Larger" ForeColor="Red" 
                        SetFocusOnError="True" ValidationGroup="s">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator3" runat="server" 
                            ControlToValidate="txtMoNo" ErrorMessage="Invalid Mobile Number" 
                            MaximumValue="9999999999" MinimumValue="1111111111" 
                        SetFocusOnError="True" Display="Dynamic" Font-Bold="True" Font-Italic="True" 
                        Font-Names="Times New Roman" Font-Size="Larger" ForeColor="Red" 
                        ValidationGroup="s">*</asp:RangeValidator>
                    &nbsp;</td>
            </tr>
            <tr class="success">
                <td class="bold" style="font-family:Times New Roman; font-size:large;">
                 Email Id :
                    &nbsp;</td>
                <td class="style5">
                <asp:TextBox ID="txtEmailId" runat="server" CssClass="form-control" 
                        Font-Names="Times New Roman" Font-Size="X-Large" TextMode="Email" 
                        ValidationGroup="s"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFCcontNO" runat="server" 
                            ControlToValidate="txtEmailId" ErrorMessage="Enter EmailId" 
                        Display="Dynamic" Font-Bold="True" Font-Italic="True" 
                        Font-Names="Times New Roman" Font-Size="Larger" ForeColor="Red" 
                        SetFocusOnError="True" ValidationGroup="s">*</asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtEmailId" ErrorMessage="InValid EmailID" 
                            SetFocusOnError="True" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        Display="Dynamic" Font-Bold="True" Font-Italic="True" 
                        Font-Names="Times New Roman" Font-Size="Larger" ForeColor="Red" 
                        ValidationGroup="s">*</asp:RegularExpressionValidator>
                    &nbsp;</td>
                <td class="bold" style="font-family:Times New Roman; font-size:large;">
                 Password :
                    &nbsp;</td>
                <td class="style6">
                <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password" 
                        Font-Names="Times New Roman" Font-Size="X-Large" ValidationGroup="s"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFCPass" runat="server" 
                            ControlToValidate="txtPass" ErrorMessage="Enter Password" 
                        Display="Dynamic" Font-Bold="True" Font-Italic="True" 
                        Font-Names="Times New Roman" Font-Size="Larger" ForeColor="Red" 
                        SetFocusOnError="True" ValidationGroup="s">*</asp:RequiredFieldValidator>
                    &nbsp;</td>
            </tr>
            <tr class="success">
                <td class="bold" style="font-family:Times New Roman; font-size:large;">
                 Confirm Password :
                    &nbsp;</td>
                <td class="style5">
                <asp:TextBox ID="txtConfpass" runat="server" CssClass="form-control"
                            TextMode="Password" Font-Names="Times New Roman" Font-Size="X-Large" 
                        ValidationGroup="s"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="ConfirmPassword" runat="server" 
                            ControlToValidate="txtPass" ErrorMessage="Please Confirm Your Password" 
                            SetFocusOnError="True" Display="Dynamic" Font-Bold="True" 
                        Font-Italic="True" Font-Names="Times New Roman" Font-Size="Larger" 
                        ForeColor="Red" ValidationGroup="s">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="ConfirmPasswordcmp" runat="server" 
                            ControlToCompare="txtPass" ControlToValidate="txtConfpass" 
                            ErrorMessage="Password Does Not Match" Display="Dynamic" 
                        Font-Bold="True" Font-Italic="True" Font-Names="Times New Roman" 
                        Font-Size="Larger" ForeColor="Red" SetFocusOnError="True" ValidationGroup="s">*</asp:CompareValidator>
                        <br />
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
         
            <tr class="success">
               
                <td class="style5">
                
                     <td class="style3">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass=" btn form-control btn-block btn-danger table-hover"
                            onclick="btnSubmit_Click" ValidationGroup="s" />
                    &nbsp;</td>
                <td class="style4">
                 <asp:Button ID="btnCreset" runat="server" CausesValidation="False" 
                            CssClass="btn form-control btn-block btn-warning table-hover"  Text="Reset" onclick="btnCreset_Click" />
            
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr class="success">
                <td class="style3">
                    &nbsp;</td>
                <td class="style5">
                <asp:Label ID="lblcmsg" runat="server"></asp:Label>
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
        </table>

    </div>
    <br />
<asp:GridView ID="GridView1" runat="server" BackColor="White" 
                            BorderColor="#3366CC" BorderStyle="None" 
        BorderWidth="1px" CellPadding="4" 
                            Width="100%" class="success table-hover" CssClass="table table-bordered"
        onselectedindexchanged="GridView1_SelectedIndexChanged" ShowFooter="True" 
        ShowHeaderWhenEmpty="True">
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
                            <asp:TemplateField>
                            <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                            </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
</div>
</asp:Content>

