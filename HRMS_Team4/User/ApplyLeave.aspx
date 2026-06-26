<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="ApplyLeave.aspx.cs" Inherits="HRMS_Team4.User.ApplyLeave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="content">

    <!-- Breadcrumb -->
    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
        <div class="my-auto mb-2">
            <h2 class="mb-1">Leaves</h2>
            <nav>
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item">
                        <a href="index.aspx"><i class="ti ti-smart-home"></i></a>
                    </li>
                    <li class="breadcrumb-item">Employee</li>
                    <li class="breadcrumb-item active">Apply Leave</li>
                </ol>
            </nav>
        </div>
    </div>

    <!-- Card -->
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Apply Leave</h3>
        </div>

        <div class="card-body">

            <asp:Label ID="lblMsg" runat="server" CssClass="text-danger"></asp:Label>

            <div class="row">

                <!-- Left -->
                <div class="col-md-6">

                    <!-- Leave Type -->
                    <div class="form-group mb-3">
                        <label>Leave Type</label>
                        <asp:DropDownList ID="ddlLeaveType" runat="server"
                            CssClass="form-control">
                        </asp:DropDownList>
                    </div>

                    <!-- Start Date -->
                    <div class="form-group mb-3">
                        <label>Start Date</label>
                        <asp:TextBox ID="txtStartDate" runat="server"
                            CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>

                </div>

                <!-- Right -->
                <div class="col-md-6">

                    <!-- End Date -->
                    <div class="form-group mb-3">
                        <label>End Date</label>
                        <asp:TextBox ID="txtEndDate" runat="server"
                            CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>

                    <!-- Reason -->
                    <div class="form-group mb-3">
                        <label>Reason</label>
                        <asp:TextBox ID="txtReason" runat="server"
                            CssClass="form-control"
                            TextMode="MultiLine" Rows="3"></asp:TextBox>
                    </div>

                </div>

            </div>

            <!-- Buttons -->
            <div class="mt-3">
                <asp:Button ID="btnApply" runat="server"
                    Text="Apply"
                    CssClass="btn btn-primary"

                    OnClick="btnApply_Click" />

                <a href="Leave.aspx" class="btn btn-secondary">
                    Back to List
                </a>
            </div>

        </div>
    </div>

</div>

</asp:Content>
