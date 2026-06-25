<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="HRMS_Team4.User.Attendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content">

        <!-- Breadcrumb -->
        <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
            <div class="my-auto mb-2">
                <h2 class="mb-1">Employee Attendance</h2>
            </div>
            <div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">

                <div class="me-2 mb-2">
                    <div class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                            <i class="ti ti-file-export me-1"></i>Export
                        </a>
                        <ul class="dropdown-menu  dropdown-menu-end p-3">
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1" onclick="exportToPDF()"><i class="ti ti-file-type-pdf me-1"></i>Export as PDF</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1" onclick="exportToExcel()"><i class="ti ti-file-type-xls me-1"></i>Export as Excel </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="mb-2">
                    <a href="#" class="btn btn-primary d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#attendance_report"><i class="ti ti-file-analytics me-2"></i>Report</a>
                </div>
                <div class="ms-2 head-icons">
                    <a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
                        <i class="ti ti-chevrons-up"></i>
                    </a>
                </div>
            </div>
        </div>
        <!-- /Breadcrumb -->

        <div class="row">
            <div class="col-xl-3 col-lg-4 d-flex">
                <div class="card flex-fill">
                    <div class="card-body">
                        <div class="mb-3 text-center">
                            <h6 class="fw-medium text-gray-5 mb-2">Good Morning, testReport</h6>
                            <h4>10:03 pm, 25 Jun 2026</h4>
                        </div>
                        <div class="attendance-circle-progress mx-auto mb-3" data-value="65">
                            <span class="progress-left">
                                <span class="progress-bar border-success"></span>
                            </span>
                            <span class="progress-right">
                                <span class="progress-bar border-success"></span>
                            </span>
                            <div class="avatar avatar-xxl avatar-rounded">
                                <asp:Image ID="imgProfile"
                                    runat="server"
                                    CssClass="avatar-img rounded-circle"
                                    AlternateText="User Image" />
                            </div>
                        </div>
                        <div class="text-center">
                            <div class="badge badge-md badge-primary mb-3">
                                Production : 
                            <p>
                                <asp:Label ID="lblLeftProduction" runat="server" Text="0h 0m"></asp:Label>
                            </p>
                            </div>
                            <h6 class="fw-medium d-flex align-items-center justify-content-center mb-3">
                                <i class="ti ti-fingerprint text-primary me-1"></i>
                                Punch In at&nbsp;<strong>
                                    <asp:Label ID="lblPunchInTime" runat="server" Text="Not Checked In"></asp:Label>
                                </strong>
                            </h6>

                            <div class="text-center mt-4">
                                <asp:Button ID="btnAttendance" runat="server"
                                    Text="Check-In"
                                    CssClass="btn btn-primary"
                                    OnClick="btnAttendance_Click" />

                                <asp:Button ID="btnLunch" runat="server"
                                    Text="Lunch-In"
                                    CssClass="btn btn-warning"
                                    OnClick="btnLunch_Click" />

                            </div>

                        </div>

                    </div>
                </div>
            </div>




            <%--Right Side Card Desgin--%>


            <div class="col-xl-9 col-lg-8 d-flex">
                <div class="row flex-fill">
                    <div class="col-xl-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="border-bottom mb-2 pb-2">
                                    <span class="avatar avatar-sm bg-primary mb-2"><i class="ti ti-clock-stop"></i></span>
                                    <h2 class="mb-2">
                                        <span class="fs-20 text-gray-5">
                                            <asp:Label ID="lblTotalHoursToday" runat="server" Text="0"></asp:Label>

                                        </span>
                                    </h2>
                                    <p class="fw-medium text-truncate">Total Hours Today</p>
                                </div>
                                <div>
                                    <p class="d-flex align-items-center fs-13">
                                        <span class="avatar avatar-xs rounded-circle bg-success flex-shrink-0 me-2">
                                            <i class="ti ti-arrow-up fs-12"></i>
                                        </span>
                                        <span>Today</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="border-bottom mb-2 pb-2">
                                    <span class="avatar avatar-sm bg-dark mb-2"><i class="ti ti-clock-up"></i></span>
                                    <h2 class="mb-2">
                                        <span class="fs-20 text-gray-5">
                                            <asp:Label ID="lblTotalHoursWeek" runat="server" Text="0"></asp:Label>
                                        </span>

                                    </h2>
                                    <p class="fw-medium text-truncate">Total Hours Week</p>
                                </div>
                                <div>
                                    <p class="d-flex align-items-center fs-13">
                                        <span class="avatar avatar-xs rounded-circle bg-success flex-shrink-0 me-2">
                                            <i class="ti ti-arrow-up fs-12"></i>
                                        </span>
                                        <span>Last Week</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="border-bottom mb-2 pb-2">
                                    <span class="avatar avatar-sm bg-info mb-2"><i class="ti ti-calendar-up"></i></span>
                                    <h2 class="mb-2">
                                        <span class="fs-20 text-gray-5">
                                            <asp:Label ID="lblTotalHoursMonth" runat="server" Text="0"></asp:Label>
                                        </span>

                                    </h2>
                                    <p class="fw-medium text-truncate">Total Hours Month</p>
                                </div>
                                <div>
                                    <p class="d-flex align-items-center fs-13 text-truncate">
                                        <span class="avatar avatar-xs rounded-circle bg-danger flex-shrink-0 me-2">
                                            <i class="ti ti-arrow-down fs-12"></i>
                                        </span>
                                        <span>Last Month</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="border-bottom mb-2 pb-2">
                                    <span class="avatar avatar-sm bg-pink mb-2"><i class="ti ti-calendar-star"></i></span>
                                    <h2 class="mb-2">
                                        <span class="fs-20 text-gray-5">
                                            <asp:Label ID="lblOvertimeThisMonth" runat="server" Text="0"></asp:Label>
                                        </span>

                                    </h2>
                                    <p class="fw-medium text-truncate">Overtime this Month</p>
                                </div>
                                <div>
                                    <p class="d-flex align-items-center fs-13 text-truncate">
                                        <span class="avatar avatar-xs rounded-circle bg-danger flex-shrink-0 me-2">
                                            <i class="ti ti-arrow-down fs-12"></i>
                                        </span>
                                        <span>Last Month</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-xl-3">
                                        <div class="mb-3">
                                            <p class="d-flex align-items-center mb-1"><i class="ti ti-point-filled text-dark-transparent me-1"></i>Total Working hours</p>
                                            <asp:Label ID="lblTodayWorkingHours" runat="server" Text="0h 0m"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-xl-3">
                                        <div class="mb-3">
                                            <p class="d-flex align-items-center mb-1"><i class="ti ti-point-filled text-success me-1"></i>Productive Hours</p>
                                            <asp:Label ID="lblTodayProductionHours" runat="server" Text="0h 0m"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-xl-3">
                                        <div class="mb-3">
                                            <p class="d-flex align-items-center mb-1"><i class="ti ti-point-filled text-warning me-1"></i>Break hours</p>
                                            <asp:Label ID="lblTodayBreakHours" runat="server" Text="0h 0m"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-xl-3">
                                        <div class="mb-3">
                                            <p class="d-flex align-items-center mb-1"><i class="ti ti-point-filled text-info me-1"></i>Overtime</p>
                                            <asp:Label ID="lblTodayOvertimeHours" runat="server" Text="0h 0m"></asp:Label>
                                        </div>
                                    </div>
                                </div>









                                <%--Below Chart--%>


                                <div class="row">
                                    <div class="col-md-12">
                                        <%--<div class="progress bg-transparent-dark mb-3" style="height: 24px;">
                                            <div class="progress-bar bg-white rounded" role="progressbar" style="width: 18%;"></div>
                                            <div class="progress-bar bg-success rounded me-2" role="progressbar" style="width: 18%;"></div>
                                            <div class="progress-bar bg-warning rounded me-2" role="progressbar" style="width: 5%;"></div>
                                            <div class="progress-bar bg-success rounded me-2" role="progressbar" style="width: 28%;"></div>
                                            <div class="progress-bar bg-warning rounded me-2" role="progressbar" style="width: 17%;"></div>
                                            <div class="progress-bar bg-success rounded me-2" role="progressbar" style="width: 22%;"></div>
                                            <div class="progress-bar bg-warning rounded me-2" role="progressbar" style="width: 5%;"></div>
                                            <div class="progress-bar bg-info rounded me-2" role="progressbar" style="width: 3%;"></div>
                                            <div class="progress-bar bg-info rounded" role="progressbar" style="width: 2%;"></div>
                                            <div class="progress-bar bg-white rounded" role="progressbar" style="width: 18%;"></div>
                                        </div>--%>

                                        <div class="progress bg-transparent-dark mb-3" style="height: 24px;">
                                            <asp:Literal ID="ltTodayProgress" runat="server"></asp:Literal>
                                        </div>


                                    </div>
                                    <div class="col-md-12">
                                        <div class="d-flex align-items-center justify-content-between flex-wrap row-gap-2">
                                            <span class="fs-10">06:00</span>
                                            <span class="fs-10">07:00</span>
                                            <span class="fs-10">08:00</span>
                                            <span class="fs-10">09:00</span>
                                            <span class="fs-10">10:00</span>
                                            <span class="fs-10">11:00</span>
                                            <span class="fs-10">12:00</span>
                                            <span class="fs-10">01:00</span>
                                            <span class="fs-10">02:00</span>
                                            <span class="fs-10">03:00</span>
                                            <span class="fs-10">04:00</span>
                                            <span class="fs-10">05:00</span>
                                            <span class="fs-10">06:00</span>
                                            <span class="fs-10">07:00</span>
                                            <span class="fs-10">08:00</span>
                                            <span class="fs-10">09:00</span>
                                            <span class="fs-10">10:00</span>
                                            <span class="fs-10">11:00</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>




        </div>







        <%--Below table--%>



        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                <h5 class="mb-0">Employee Attendance</h5>

                <div class="d-flex align-items-center flex-wrap gap-2">

                    <label>Start:</label>
                    <asp:TextBox ID="txtStartDate" runat="server"
                        CssClass="form-control"
                        TextMode="Date"
                        AutoPostBack="true"
                        OnTextChanged="Filter_Changed"
                        Style="width: 165px;">
                    </asp:TextBox>

                    <label>End:</label>
                    <asp:TextBox ID="txtEndDate" runat="server"
                        CssClass="form-control"
                        TextMode="Date"
                        AutoPostBack="true"
                        OnTextChanged="Filter_Changed"
                        Style="width: 165px;">
                    </asp:TextBox>

                    <asp:DropDownList ID="ddlStatus" runat="server"
                        CssClass="form-select"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="Filter_Changed"
                        Style="width: 150px;">
                        <asp:ListItem Text="All" Value="All"></asp:ListItem>
                        <asp:ListItem Text="Present" Value="Present"></asp:ListItem>
                        <asp:ListItem Text="Absent" Value="Absent"></asp:ListItem>
                        <asp:ListItem Text="Half Day" Value="Half Day"></asp:ListItem>
                    </asp:DropDownList>

                    <asp:DropDownList ID="ddlFilter" runat="server"
                        CssClass="form-select"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="Filter_Changed"
                        Style="width: 170px;">
                        <asp:ListItem Text="Recently Added" Value="All"></asp:ListItem>
                        <asp:ListItem Text="Last 7 Days" Value="Last7Days"></asp:ListItem>
                        <asp:ListItem Text="Last Month" Value="LastMonth"></asp:ListItem>
                    </asp:DropDownList>

                </div>
            </div>

            <asp:UpdatePanel ID="upAttendance" runat="server" UpdateMode="Conditional">
                <contenttemplate>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-nowrap" id="attendanceTable">
                                <thead class="thead-light">
                                    <tr>
                                        <th>Date</th>
                                        <th>Check In</th>
                                        <th>Status</th>
                                        <th>Check Out</th>
                                        <th>Break</th>
                                        <th>Late</th>
                                        <th>Overtime</th>
                                        <th>Production Hours</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <asp:Repeater ID="rptAttendance" runat="server">
                                        <itemtemplate>
                                            <tr>
                                                <td><%# Eval("Date", "{0:yyyy/MM/dd}") %></td>
                                                <td><%# Eval("CheckIn") %></td>
                                                <td>
                                                    <span class='<%# GetStatusBadge(Eval("Status").ToString()) %>'>
                                                        <i class="ti ti-point-filled me-1"></i>
                                                        <%# Eval("Status") %>
                                                    </span>
                                                </td>
                                                <td><%# Eval("CheckOut") %></td>
                                                <td><%# Eval("BreakHours") %> hrs</td>
                                                <td><%# Eval("Late") %> min</td>
                                                <td><%# Eval("OvertimeHours") %> hrs</td>
                                                <td>
                                                    <span class="badge badge-success d-inline-flex align-items-center badge-xs">
                                                        <i class="ti ti-point-filled me-1"></i>
                                                        <%# Eval("ProductionHours") %> hrs
                                                    </span>
                                                </td>
                                            </tr>
                                        </itemtemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </contenttemplate>

                <triggers>
                    <asp:AsyncPostBackTrigger ControlID="txtStartDate" EventName="TextChanged" />
                    <asp:AsyncPostBackTrigger ControlID="txtEndDate" EventName="TextChanged" />
                    <asp:AsyncPostBackTrigger ControlID="ddlStatus" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="ddlFilter" EventName="SelectedIndexChanged" />
                </triggers>
            </asp:UpdatePanel>
        </div>







    </div>




    <script>
        $(document).ready(function () {
            $('#attendanceTable').DataTable({
                pageLength: 5,
                lengthMenu: [5, 10, 25, 50, 100]
            });
        });


        document.addEventListener("DOMContentLoaded", function () {
            var tooltipList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            tooltipList.map(function (el) {
                return new bootstrap.Tooltip(el);
            });
        });



    </script>






</asp:Content>
