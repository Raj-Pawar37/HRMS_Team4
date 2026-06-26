<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Payslip.aspx.cs" Inherits="HRMS_Team4.User.Payslip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        $(function () {
            $('#<%= gvPayslips.ClientID %>').DataTable({
        pageLength: 5,
        lengthMenu: [[5, 10, 25, -1], [5, 10, 25, "All"]]
    });
});
    </script>
    <!-- Breadcrumb -->
    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
        <div class="my-auto mb-2">
            <h2 class="mb-1">Select Payslips Month</h2>
            <nav>
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item">
                        <a href="index.aspx"><i class="ti ti-smart-home"></i></a>
                    </li>
                    <li class="breadcrumb-item">Hr</li>
                    <li class="breadcrumb-item active">Employee salary </li>
                </ol>
            </nav>
        </div>
    </div>



    <!-- Card -->
    <div class="card">

        <div class="card-header">
            <h5 class="mb-0">Leaves</h5>
        </div>

        <div class="card-body table-responsive">

            <!-- GridView -->
            <asp:GridView ID="gvPayslips" runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-bordered table-striped"
                OnRowCommand="gvPayslips_RowCommand"
                EmptyDataText="No payslips available.">

                <Columns>

                    <asp:TemplateField HeaderText="Month/Year">
                        <ItemTemplate>
                            <%# Eval("Month") %>/<%# Eval("Year") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="View Payslip">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkView"
                                runat="server"
                                CommandName="ViewPayslip"
                                CommandArgument='<%# Eval("PayslipId") %>'
                                CausesValidation="false"
                                ToolTip="View Payslip">
                    <i class="fa fa-eye"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Download Payslip">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDownload"
                                runat="server"
                                CommandName="DownloadPayslip"
                                CommandArgument='<%# Eval("PayslipId") %>'
                                CausesValidation="false"
                                ToolTip="Download Payslip">
                    <i class="fa fa-download"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>
    </div>




</asp:Content>
