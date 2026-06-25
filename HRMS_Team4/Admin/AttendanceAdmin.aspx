<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AttendanceAdmin.aspx.cs" Inherits="HRMS_Team4.Admin.Attendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Attendance Page
</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="content">

    <!-- Header -->
    <div class="d-md-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="mb-1 fw-bold">Attendance Admin</h2>

            <nav>
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item">Employee</li>
                    <li class="breadcrumb-item active">Attendance Admin</li>
                </ol>
            </nav>
        </div>

        <div class="d-flex gap-2">

            <div class="dropdown">
                <button class="btn btn-outline-dark dropdown-toggle"
                    data-bs-toggle="dropdown">
                    Export
                </button>

                <ul class="dropdown-menu">
                    <li>
                        <asp:LinkButton ID="lnkExcel"
                            runat="server"
                            CssClass="dropdown-item"
                            OnClick="lnkExcel_Click">
                            Export Excel
                        </asp:LinkButton>
                    </li>

                    <li>
                        <asp:LinkButton ID="lnkPdf"
                            runat="server"
                            CssClass="dropdown-item"
                            OnClick="lnkPdf_Click">
                            Export PDF
                        </asp:LinkButton>
                    </li>
                </ul>
            </div>

            <asp:Button ID="btnReport"
                runat="server"
                Text="Report"
                CssClass="btn btn-warning text-white" />

        </div>
    </div>


    <!-- Summary Card -->
    <div class="card shadow-sm mb-4">

        <div class="card-header">
            <h4 class="mb-0">Attendance Details Today</h4>
            <small>Data from total employees</small>
        </div>

        <div class="card-body">

            <div class="row">

                <div class="col-md-2">
                    <div class="border rounded p-3">
                        <h6>Present</h6>
                        <h3>
                            <asp:Label ID="lblPresent" runat="server" Text="0"></asp:Label>
                        </h3>
                    </div>
                </div>

                <div class="col-md-2">
                    <div class="border rounded p-3">
                        <h6>Late Login</h6>
                        <h3>
                            <asp:Label ID="lblLate" runat="server" Text="0"></asp:Label>
                        </h3>
                    </div>
                </div>

                <div class="col-md-2">
                    <div class="border rounded p-3">
                        <h6>Permission</h6>
                        <h3>
                            <asp:Label ID="lblPermission" runat="server" Text="0"></asp:Label>
                        </h3>
                    </div>
                </div>

                <div class="col-md-2">
                    <div class="border rounded p-3">
                        <h6>Absent</h6>
                        <h3>
                            <asp:Label ID="lblAbsent" runat="server" Text="0"></asp:Label>
                        </h3>
                    </div>
                </div>

            </div>

        </div>

    </div>



    <!-- Main Card -->
    <div class="card shadow-sm">

        <div class="card-header">

            <div class="row align-items-end">

                <div class="col-md-3">
                    <h4 class="mb-0">Admin Attendance</h4>
                </div>

                <div class="col-md-2">
                    <label>Start Date :</label>
                    <asp:TextBox ID="txtStartDate"
                        runat="server"
                        TextMode="Date"
                        CssClass="form-control">
                    </asp:TextBox>
                </div>

                <div class="col-md-2">
                    <label>End Date :</label>
                    <asp:TextBox ID="txtEndDate"
                        runat="server"
                        TextMode="Date"
                        CssClass="form-control">
                    </asp:TextBox>
                </div>

                <div class="col-md-2">
                    &nbsp;<asp:DropDownList ID="ddlDepartment"
                        runat="server"
                        CssClass="form-select">
                    </asp:DropDownList>
                </div>

                <div class="col-md-2">
                    &nbsp;<asp:DropDownList ID="ddlStatus"
                        runat="server"
                        CssClass="form-select">

                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem>Present</asp:ListItem>
                        <asp:ListItem>Absent</asp:ListItem>

                    </asp:DropDownList>
                </div>

                <div class="col-md-1">
                </div>

            </div>

        </div>



        <!-- Grid -->
        <div class="card-body table-responsive">

           <asp:GridView ID="GridView1"
    runat="server"
    AutoGenerateColumns="False"
    CssClass="table table-hover align-middle"
    GridLines="None">
<Columns>

    <asp:BoundField DataField="AttendanceId" HeaderText="ID" />

    <asp:TemplateField HeaderText="Employee">
        <ItemTemplate>

            <div class="d-flex align-items-center">

                <asp:Image ID="imgEmp"
                    runat="server"
                    ImageUrl='<%# "~/" + Eval("ProfilePicture") %>'
                    Width="40px"
                    Height="40px"
                    CssClass="rounded-circle me-2" />

                <div>

                    <h6 class="mb-0">
                        <%# Eval("EmployeeName") %>
                    </h6>

                    <small class="text-muted">
                        <%# Eval("DepartmentName") %>
                    </small>

                </div>

            </div>

        </ItemTemplate>
    </asp:TemplateField>

    <asp:BoundField DataField="Date" HeaderText="Date" />

    <asp:TemplateField HeaderText="Status">
        <ItemTemplate>

            <span class='<%#
                Eval("Status").ToString() == "Present"
                ? "badge bg-success"

                : Eval("Status").ToString() == "Absent"
                ? "badge bg-danger"

                : "badge bg-warning text-dark"
            %>'>

                <%# Eval("Status") %>

            </span>

        </ItemTemplate>
    </asp:TemplateField>

    <asp:BoundField DataField="CheckIn" HeaderText="Check In" />
    <asp:BoundField DataField="LunchOut" HeaderText="Lunch Out" />
    <asp:BoundField DataField="LunchIn" HeaderText="Lunch In" />
    <asp:BoundField DataField="CheckOut" HeaderText="Check Out" />
    <asp:BoundField DataField="WorkingHours" HeaderText="Working Hours" />
    <asp:BoundField DataField="BreakHours" HeaderText="Break Hours" />
    <asp:BoundField DataField="ProductionHours" HeaderText="Production Hours" />
    <asp:BoundField DataField="OvertimeHours" HeaderText="Overtime Hours" />
    <asp:BoundField DataField="Late" HeaderText="Late" />

    <asp:TemplateField HeaderText="Action">
        <ItemTemplate>

            <asp:LinkButton ID="lnkEdit"
                runat="server"
                CssClass="text-primary">

                <i class="ti ti-edit"></i>

            </asp:LinkButton>

        </ItemTemplate>
    </asp:TemplateField>

</Columns>

</asp:GridView>

        </div>

    </div>

</div>

</asp:Content>
