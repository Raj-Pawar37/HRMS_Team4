<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="GeneratePayslip.aspx.cs" Inherits="HRMS_Team4.Admin.GeneratePayslip" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
   

    <div class="row justify-content-center">
    <div class="col-md-6">

        <div class="card shadow-lg border-0">
            <div class="card-body">

                <asp:Panel ID="pnlPayslip" runat="server">

                    <!-- Employee -->
                    <div class="form-group mb-3">
                        <label>Select Employee</label>

                        <asp:DropDownList
                            ID="ddlEmployee"
                            runat="server"
                            CssClass="form-control">
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator
                            ID="rfvEmp"
                            runat="server"
                            ControlToValidate="ddlEmployee"
                            InitialValue=""
                            ErrorMessage="Select Employee"
                            CssClass="text-danger" />
                    </div>

                    <!-- Month -->
                    <div class="form-group mb-3">
                        <label>Select Month</label>

                        <asp:DropDownList
                            ID="ddlMonth"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem Text="-- Select Month --" Value="" />
                            <asp:ListItem Text="January" Value="January" />
                            <asp:ListItem Text="February" Value="February" />
                            <asp:ListItem Text="March" Value="March" />
                            <asp:ListItem Text="April" Value="April" />
                            <asp:ListItem Text="May" Value="May" />
                            <asp:ListItem Text="June" Value="June" />
                            <asp:ListItem Text="July" Value="July" />
                            <asp:ListItem Text="August" Value="August" />
                            <asp:ListItem Text="September" Value="September" />
                            <asp:ListItem Text="October" Value="October" />
                            <asp:ListItem Text="November" Value="November" />
                            <asp:ListItem Text="December" Value="December" />

                        </asp:DropDownList>

                        <asp:RequiredFieldValidator
                            ID="rfvMonth"
                            runat="server"
                            ControlToValidate="ddlMonth"
                            InitialValue=""
                            ErrorMessage="Select Month"
                            CssClass="text-danger" />
                    </div>

                    <!-- Year -->
                    <div class="form-group mb-3">
                        <label>Enter Year</label>

                        <asp:TextBox
                            ID="txtYear"
                            runat="server"
                            CssClass="form-control"
                            Text="2026"
                            TextMode="Number">
                        </asp:TextBox>

                        <asp:RequiredFieldValidator
                            ID="rfvYear"
                            runat="server"
                            ControlToValidate="txtYear"
                            ErrorMessage="Enter Year"
                            CssClass="text-danger" />
                    </div>

                    <!-- Button -->
                    <div class="d-grid">
                        <asp:Button
                            ID="btnGeneratePayslip"
                            runat="server"
                            Text="Generate Payslips"
                            CssClass="btn btn-primary"
                            OnClick="btnGeneratePayslip_Click" />
                    </div>

                </asp:Panel>

            </div>
        </div>

    </div>
</div>

</asp:Content>
