<%@ Page Title="" Language="C#" MasterPageFile="~/MainSite.master" AutoEventWireup="true" CodeFile="frmDoctor.aspx.cs" Inherits="ADM_frmDoctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style2
        {
        }
        .style3
        {
            width: 200px;
        }
        .style4
        {
            margin-top:2px;
            width: 351px;
        }
        .tbl
        {
            margin-top:2px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
<center><b><u><h1 style="font-family:Times New Roman; font-size:50px;">Add Doctor</h1></u></b></center>
</div>
<div><center><asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        Font-Bold="True" Font-Italic="True" Font-Names="Times New Roman" 
        Font-Size="Larger" ForeColor="Red" ValidationGroup="s" /></center>
    </div>
<div align=center>
    <table class="table-hover table-responsive table-bordered table-condensed success">
        <tr class="success">
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
             Doctor Name :
                &nbsp;</td>
            <td class="style4">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" 
         Font-Names="Times New Roman" 
                    Font-Size="X-Large" ValidationGroup="s" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtName" ErrorMessage="Please Enter Doctor Name" 
                    Display="Dynamic" Font-Italic="True" Font-Size="Larger" ForeColor="Red" 
                    SetFocusOnError="True" ValidationGroup="s">*</asp:RequiredFieldValidator>
                &nbsp;</td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
             Specialization:
                &nbsp;</td>
            <td class="style4">
            &nbsp;
             <asp:TextBox ID="txtSpecialization" runat="server" CssClass="form-control" 
                   Font-Names="Times New Roman" 
                    Font-Size="X-Large" ValidationGroup="s"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtSpecialization" Display="Dynamic" 
                    ErrorMessage="Please Enter Specialization" Font-Italic="True" 
                    Font-Size="Larger" ForeColor="Red" SetFocusOnError="True" ValidationGroup="s">*</asp:RequiredFieldValidator>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
             Qualification :
                &nbsp;</td>
            <td class="style4">
            <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control"  Font-Names="Times New Roman"
                    Font-Size="X-Large" ValidationGroup="s"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtQualification" Display="Dynamic" 
                    ErrorMessage="Please Enter Qualification" Font-Italic="True" Font-Size="Larger" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="s">*</asp:RequiredFieldValidator>
                &nbsp;</td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
            Gender:
                &nbsp;</td>
            <td class="style4">
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    Font-Names="Times New Roman" Font-Size="X-Large" ValidationGroup="s" CssClass="form-control">
                    <asp:ListItem>Select Gender</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="DropDownList1" Display="Dynamic" 
                    ErrorMessage="Please Select Gender" Font-Italic="True" Font-Size="Larger" 
                    ForeColor="Red" InitialValue="0" SetFocusOnError="True" ValidationGroup="s">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
             Age :
                &nbsp;</td>
            <td class="style4">
            <asp:TextBox ID="txtAge" runat="server" CssClass="form-control"
                    Font-Names="Times New Roman" Font-Size="X-Large" TextMode="SingleLine" 
                    ValidationGroup="s"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtAge" Display="Dynamic" ErrorMessage="Please Enter Age" 
                    Font-Italic="True" Font-Size="Larger" ForeColor="Red" SetFocusOnError="True" 
                    ValidationGroup="s">*</asp:RequiredFieldValidator>
               
            </td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
            Experience:
                &nbsp;</td>
            <td class="style4">
             <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control" Font-Bold="False" 
                    Font-Italic="False" Font-Names="Times New Roman" Font-Size="X-Large" 
                    TextMode="Number" ValidationGroup="s"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtExperience" Display="Dynamic" 
                    ErrorMessage="Please Enter Experience" Font-Italic="True" Font-Size="Larger" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="s">*</asp:RequiredFieldValidator>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
            Mobile No :
                &nbsp;</td>
            <td class="style4">
             <asp:TextBox ID="txtMoNo" runat="server" CssClass="form-control"
                    Font-Names="Times New Roman" Font-Size="X-Large" TextMode="Phone" 
                    ValidationGroup="s"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtMoNo" Display="Dynamic" 
                    ErrorMessage="Enter Mobile Number" Font-Italic="True" Font-Size="Larger" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="s">*</asp:RequiredFieldValidator>
                &nbsp;</td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
             Email Id :
                &nbsp;</td>
            <td class="style4">
            <asp:TextBox ID="txtEmailId" runat="server" CssClass="form-control" Font-Bold="False"
                    Font-Italic="False" Font-Names="Times New Roman" Font-Size="X-Large" 
                    TextMode="Email" ValidationGroup="s"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtEmailId" Display="Dynamic" 
                    ErrorMessage="Please Enter Email Id" Font-Italic="True" Font-Size="Larger" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="s">*</asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                    runat="server" ControlToValidate="txtEmailId" Display="Dynamic" 
                    ErrorMessage="Email Id is not valid" Font-Italic="True" Font-Size="Larger" 
                    ForeColor="Red" SetFocusOnError="True" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="s">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
             Password :
                &nbsp;</td>
            <td class="style4">
            <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password" 
                    Font-Names="Times New Roman" Font-Size="X-Large" ValidationGroup="s"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtPass" Display="Dynamic" 
                    ErrorMessage="Please Enter Password" Font-Italic="True" Font-Size="Larger" 
                    ForeColor="Red" SetFocusOnError="True" ValidationGroup="s">*</asp:RequiredFieldValidator>
                &nbsp;</td>
            <td class="bold" style="font-family:Times New Roman; font-size:large;">
            Confirm Password :
                &nbsp;</td>
            <td class="style4">
            <asp:TextBox ID="txtConfpass" runat="server" CssClass="form-control"
                            TextMode="Password" Font-Bold="False" Font-Names="Times New Roman" 
                    Font-Size="X-Large" ValidationGroup="s"></asp:TextBox>
                        <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="txtConfpass" Display="Dynamic" 
                    ErrorMessage="Please Confirm Your Password" Font-Italic="True" 
                    Font-Size="Larger" ForeColor="Red" SetFocusOnError="True" ValidationGroup="s">*</asp:RequiredFieldValidator>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
            <asp:Button ID="btnSubmit" runat="server" Text="ADD" class="btn btn-block btn-danger"
                            onclick="btnSubmit_Click" ValidationGroup="s" />
                &nbsp;</td>
            <td class="style2" colspan="2">
             <asp:Button ID="btnCreset" runat="server" CausesValidation="False" class=" btn form-control btn-block btn-warning table-hover"
                              Text="Reset" Width="73px" onclick="btnCreset_Click" />
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="4">
             <asp:Label ID="lblcmsg" runat="server"></asp:Label>
                &nbsp;</td>
        </tr>
    </table>
</div>
<div>
<asp:GridView ID="GridView1" runat="server" BackColor="White" 
                            BorderColor="#3366CC" BorderStyle="None" CssClass="table table-bordered"
        BorderWidth="1px" CellPadding="4" 
                            Width="100%" ShowFooter="True" 
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

