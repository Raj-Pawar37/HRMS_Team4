<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master"
AutoEventWireup="true" CodeBehind="LeaveSetting.aspx.cs"
Inherits="HRMS_Team4.Admin.LeaveSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h2 class="mb-4">Manage Leave Settings</h2>

<div class="row">

    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>

            <div class="col-xl-4 col-md-6 mb-3">

                <div class="card">
                    <div class="card-body d-flex align-items-center justify-content-between">

                        <div class="d-flex align-items-center">

                            <div class="form-check form-check-md form-switch me-1">

                                <asp:HiddenField ID="hfLeaveTypeId"
                                    runat="server"
                                    Value='<%# Eval("LeaveTypeId") %>' />

                                <asp:CheckBox ID="chkStatus"
                                    runat="server"
                                    CssClass="form-check-input"
                                    Checked="true"
                                    AutoPostBack="true"
                                    OnCheckedChanged="chkStatus_CheckedChanged" />

                            </div>

                            <h6 class="d-flex align-items-center mb-0">
                                <%# Eval("LeaveType") %>
                            </h6>

                        </div>

                        <div class="d-flex align-items-center">

                            <a href="javascript:void(0);"
                               class="text-decoration-underline me-2"
                               data-bs-toggle="modal"
                               data-bs-target="#add_custom_policy">

                                Custom Policy

                            </a>

                            <a href="javascript:void(0);"
                               data-bs-toggle="modal"
                               data-bs-target="#leave_settings">

                                <i class="ti ti-settings"></i>

                            </a>

                        </div>

                    </div>
                </div>

            </div>

        </ItemTemplate>
    </asp:Repeater>

</div>
</asp:Content>