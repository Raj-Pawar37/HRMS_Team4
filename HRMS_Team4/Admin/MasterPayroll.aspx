<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="MasterPayroll.aspx.cs" Inherits="HRMS_Team4.Admin.MasterPayroll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <div class="content">

        <style>
            .payroll-btns {
                display: flex;
                gap: 15px;
            }

            .dropdown {
                position: relative;
            }

            .dropdown-menu {
                position: absolute !important;
                z-index: 1050;
                top: 100%;
            }
        </style>

        <div class="d-flex justify-content-start my-4">

            <div class="payroll-btns">

                <!-- EARNING -->
                <div class="dropdown">
                    <a class="dropdown-toggle btn btn-white border"
                        data-bs-toggle="dropdown">
                        Earning
                    </a>

                    <ul class="dropdown-menu">

                        <li>
                            <asp:HyperLink
                                runat="server"
                                NavigateUrl="~/Admin/MasterPayrollEarningType.aspx"
                                CssClass="dropdown-item">
                                Earning Type
                            </asp:HyperLink>
                        </li>

                        <li>
                            <asp:HyperLink
                                runat="server"
                                NavigateUrl="~/Admin/MasterPayrollEarning.aspx"
                                CssClass="dropdown-item">
                                Earning
                            </asp:HyperLink>
                        </li>

                    </ul>
                </div>

                <!-- DEDUCTION -->
                <div class="dropdown">
                    <a class="dropdown-toggle btn btn-white border"
                        data-bs-toggle="dropdown">
                        Deduction
                    </a>

                    <ul class="dropdown-menu">

                        <li>
                            <asp:HyperLink
                                runat="server"
                                NavigateUrl="~/Admin/MasterPayrollDeductionType.aspx"
                                CssClass="dropdown-item">
                                Deduction Type
                            </asp:HyperLink>
                        </li>

                        <li>
                            <asp:HyperLink
                                runat="server"
                                NavigateUrl="~/Admin/MasterPayrollDeduction.aspx"
                                CssClass="dropdown-item">
                                Deduction
                            </asp:HyperLink>
                        </li>

                    </ul>
                </div>

            </div>

        </div>

    </div>

</asp:Content>