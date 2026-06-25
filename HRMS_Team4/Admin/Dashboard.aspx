<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="HRMS_Team4.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div b-ietxc090g4="" class="content">


        <!-- Breadcrumb -->
        <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
            <div class="my-auto mb-2">
                <h2 class="mb-1">Admin Dashboard</h2>
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item">
                            <a href="index.html"><i class="ti ti-smart-home"></i></a>
                        </li>
                        <li class="breadcrumb-item">Dashboard
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Admin Dashboard</li>
                    </ol>
                </nav>
            </div>
            <div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
                <div class="me-2 mb-2">
                    <div class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                            <i class="ti ti-file-export me-1"></i>Export
                        </a>
                        <ul class="dropdown-menu  dropdown-menu-end p-3">
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-pdf me-1"></i>Export as PDF</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-xls me-1"></i>Export as Excel </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="mb-2">
                    <div class="input-icon w-120 position-relative">
                        <span class="input-icon-addon">
                            <i class="ti ti-calendar text-gray-9"></i>
                        </span>
                        <input type="text" class="form-control yearpicker" value="2025" fdprocessedid="rcfy8">
                    </div>
                </div>
                <div class="ms-2 head-icons">
                    <a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
                        <i class="ti ti-chevrons-up"></i>
                    </a>
                </div>
            </div>
        </div>
        <!-- /Breadcrumb -->
        <!-- Welcome Wrap -->
        <div class="card border-0">
            <div class="card-body d-flex align-items-center justify-content-between flex-wrap pb-1">
                <div class="d-flex align-items-center mb-3">
                    <span class="avatar avatar-xl flex-shrink-0">
                        <img src="/uploads/user/639178005423390129_dog1.jpg" class="rounded-circle" alt="img">
                    </span>
                    <div class="ms-3">
                        <h3 class="mb-2">Welcome Back, admin a </h3>
                    </div>
                </div>
                <div class="d-flex align-items-center flex-wrap mb-1">
                    <a href="#" class="btn btn-secondary btn-md me-2 mb-2" data-bs-toggle="modal" data-bs-target="#add_project"><i class="ti ti-square-rounded-plus me-1"></i>Add Project</a>
                    <a href="#" class="btn btn-primary btn-md mb-2" data-bs-toggle="modal" data-bs-target="#add_leaves"><i class="ti ti-square-rounded-plus me-1"></i>Add Requests</a>
                </div>
            </div>
        </div>
        <!-- /Welcome Wrap -->

        <div class="row">

            <!-- Widget Info -->
            <div class="col-xxl-8 d-flex">
                <div class="row flex-fill">
                    <div class="col-md-3 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <span class="avatar rounded-circle bg-primary mb-2">
                                    <i class="ti ti-calendar-share fs-16"></i>
                                </span>
                                <h6 class="fs-13 fw-medium text-default mb-1">Attendance Overview</h6>
                                <h3 class="mb-3">24/48</h3>
                                <a class="link-default" href="/Auth/Index">View Details</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <span class="avatar rounded-circle bg-secondary mb-2">
                                    <i class="ti ti-browser fs-16"></i>
                                </span>
                                <h6 class="fs-13 fw-medium text-default mb-1">Total No of Project's</h6>
                                <h3 class="mb-3">7/9</h3>
                                <a class="link-default" href="/Auth/Index">View Details</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <span class="avatar rounded-circle bg-info mb-2">
                                    <i class="ti ti-users-group fs-16"></i>
                                </span>
                                <h6 class="fs-13 fw-medium text-default mb-1">Total No of Clients</h6>
                                <h3 class="mb-3">7/9</h3>
                                <a class="link-default" href="/Auth/Index">View Details</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <span class="avatar rounded-circle bg-pink mb-2">
                                    <i class="ti ti-checklist fs-16"></i>
                                </span>
                                <h6 class="fs-13 fw-medium text-default mb-1">Total No of Tasks</h6>
                                <h3 class="mb-3">19</h3>
                                <a class="link-default" href="/Auth/Index">View Details</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <span class="avatar rounded-circle bg-purple mb-2">
                                    <i class="ti ti-moneybag fs-16"></i>
                                </span>
                                <h6 class="fs-13 fw-medium text-default mb-1">Earnings</h6>
                                <h3 class="mb-3">$2,000,200</h3>
                                <a class="link-default" href="/Auth/Index">View Details</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <span class="avatar rounded-circle bg-danger mb-2">
                                    <i class="ti ti-browser fs-16"></i>
                                </span>
                                <h6 class="fs-13 fw-medium text-default mb-1">Profit This Week</h6>
                                <h3 class="mb-3">$5,544</h3>
                                <a class="link-default" href="/Auth/Index">View Details</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <span class="avatar rounded-circle bg-success mb-2">
                                    <i class="ti ti-users-group fs-16"></i>
                                </span>
                                <h6 class="fs-13 fw-medium text-default mb-1">Job Applicants</h6>
                                <h3 class="mb-3">98</h3>
                                <a class="link-default" href="/Auth/Index">View Details</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <span class="avatar rounded-circle bg-dark mb-2">
                                    <i class="ti ti-user-star fs-16"></i>
                                </span>
                                <h6 class="fs-13 fw-medium text-default mb-1">New Hire</h6>
                                <h3 class="mb-3">45/48</h3>
                                <a class="link-default" href="/Auth/Index">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Widget Info -->





            <!-- Employees By Department -->
            <div class="col-xxl-4 d-flex">
                <div class="card flex-fill">
                    <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                        <h5 class="mb-2">Employees By Department</h5>
                    </div>

                    <div class="card-body">
                        <asp:HiddenField ID="hfDeptNames" runat="server" />
                        <asp:HiddenField ID="hfDeptCounts" runat="server" />

                        <div style="height: 320px;">
                            <canvas id="empDeptChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Employees By Department -->


        </div>

        <div class="row">


            <!-- Total Employee -->
            <div class="col-xxl-4 d-flex">
                <asp:ScriptManager ID="ScriptManager1" runat="server" />

                <asp:UpdatePanel ID="updEmployeeStatus" runat="server">
                    <ContentTemplate>



                        <div class="card flex-fill">
                            <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                                <h5 class="mb-2">Employee Status</h5>

                                <asp:DropDownList ID="ddlEmployeeStatusFilter" runat="server"
                                    CssClass="form-select form-select-sm w-auto mb-2"
                                    AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlEmployeeStatusFilter_SelectedIndexChanged">
                                    <asp:ListItem Text="Today" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="This Week" Value="2" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="This Month" Value="3"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="card-body">
                                <div class="d-flex align-items-center justify-content-between mb-1">
                                    <p class="fs-13 mb-3">Total Employee</p>
                                    <h3 class="mb-3">
                                        <asp:Label ID="lblTotalEmployee" runat="server" Text="0"></asp:Label>
                                    </h3>
                                </div>

                                <div class="progress-stacked emp-stack mb-3">
                                    <asp:Repeater ID="rptEmployeeStatusProgress" runat="server">
                                        <ItemTemplate>
                                            <div class="progress"
                                                role="progressbar"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title='<%# Eval("Name") + " : " + Eval("BarPercentage") +"%" %>'
                                                style='width: <%# GetProgressWidth(Eval("BarPercentage")) %>%'>

                                                <div class='progress-bar <%# GetEmployeeStatusBgColor(Eval("Name").ToString()) %>'>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>

                                <div class="border mb-3">
                                    <div class="row gx-0">
                                        <asp:Repeater ID="rptEmployeeStatus" runat="server">
                                            <ItemTemplate>
                                                <div class="col-6">
                                                    <div class='p-2 flex-fill <%# GetEmployeeStatusBoxClass(Container.ItemIndex) %>'>
                                                        <p class="fs-13 mb-2">
                                                            <i class='ti ti-square-filled fs-12 me-2 <%# GetEmployeeStatusTextColor(Eval("Name").ToString()) %>'></i>
                                                            <%# Eval("Name") %>
                                                            <span class="text-gray-9">(<%# Eval("AchievedPercentage") %>%)</span>
                                                        </p>

                                                        <h2 class="display-1">
                                                            <%# Eval("Achieved") %>
                                                        </h2>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>

                                <a href="<%= ResolveUrl("~/Admin/EmployeeList.aspx") %>" class="btn btn-light btn-md w-100">View All Employees
                                </a>
                            </div>
                        </div>


                    </ContentTemplate>

                    <Triggers>
                        <asp:AsyncPostBackTrigger
                            ControlID="ddlEmployeeStatusFilter"
                            EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
            <!-- /Total Employee -->




            <!-- Attendance Overview -->
            <div class="col-xxl-4 col-xl-6 d-flex">
                <div class="card flex-fill">

                    <asp:UpdatePanel ID="updAttendanceOverview" runat="server">
                        <ContentTemplate>

                            <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                                <h5 class="mb-2">Attendance Overview</h5>

                                <asp:DropDownList ID="ddlAttendanceFilter" runat="server"
                                    CssClass="form-select form-select-sm w-auto mb-2"
                                    AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlAttendanceFilter_SelectedIndexChanged">
                                    <asp:ListItem Text="Today" Value="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="This Week" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="This Month" Value="3"></asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="card-body">
                                <div class="chartjs-wrapper-demo position-relative mb-4">
                                    <canvas id="attendanceChart" height="120"></canvas>

                                    <div class="position-absolute text-center attendance-canvas">
                                        <p class="fs-13 mb-1">Total Attendance</p>
                                        <h3>
                                            <asp:Label ID="lblTotalAttendance" runat="server" Text="0"></asp:Label>
                                        </h3>
                                    </div>
                                </div>

                                <h6 class="mb-3">Status</h6>

                                <asp:Repeater ID="rptAttendanceOverview" runat="server">
                                    <ItemTemplate>
                                        <div class="d-flex align-items-center justify-content-between">
                                            <p class="f-13 mb-2">
                                                <i class='ti ti-circle-filled me-1 <%# GetAttendanceColor(Eval("Name").ToString()) %>'></i>
                                                <%# Eval("Name") %>
                                            </p>
                                            <p class="f-13 fw-medium text-gray-9 mb-2">
                                                <%# Eval("Percentage") %>%
                                            </p>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                                <asp:HiddenField ID="hfPresentPercentage" runat="server" />
                                <asp:HiddenField ID="hfHalfDayPercentage" runat="server" />
                                <asp:HiddenField ID="hfAbsentPercentage" runat="server" />

                                <div class="bg-light br-5 box-shadow-xs p-2 pb-0 d-flex align-items-center justify-content-between flex-wrap">
                                    <div class="d-flex align-items-center">
                                        <p class="mb-2 me-2">Total Absenties</p>
                                        <h6 class="mb-2">
                                            <asp:Label ID="lblAbsentCount" runat="server" Text="0"></asp:Label>
                                        </h6>
                                    </div>
                                </div>
                            </div>

                        </ContentTemplate>

                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlAttendanceFilter" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>

                </div>
            </div>
            <!-- Attendance Overview -->




            <!-- Clock-In/Out -->
            <div class="col-xxl-4 col-xl-6 d-flex">
                <div class="card flex-fill">

                    <asp:UpdatePanel ID="updClockInOut" runat="server">
                        <ContentTemplate>

                            <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                                <h5 class="mb-2">Clock-In/Out</h5>

                                <div class="d-flex align-items-center">
                                    <asp:DropDownList ID="ddlClockDepartment" runat="server"
                                        CssClass="form-select form-select-sm w-auto me-2 mb-2"
                                        AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlClockFilter_SelectedIndexChanged">
                                    </asp:DropDownList>

                                    <asp:DropDownList ID="ddlClockFilter" runat="server"
                                        CssClass="form-select form-select-sm w-auto mb-2"
                                        AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlClockFilter_SelectedIndexChanged">
                                        <asp:ListItem Text="Today" Value="1" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="This Week" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="This Month" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="card-body">

                                <asp:Repeater ID="rptClockInOut" runat="server">
                                    <ItemTemplate>

                                        <div class="mb-3 p-2 border br-5">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <div class="d-flex align-items-center">
                                                    <span class="avatar flex-shrink-0">
                                                        <img src='<%# ResolveUrl("~/" + Eval("ProfilePicture")) %>'
                                                            class="rounded-circle border border-2" alt="img" />
                                                    </span>

                                                    <div class="ms-2">
                                                        <h6 class="fs-14 fw-medium text-truncate">
                                                            <%# Eval("EmployeeName") %>
                                                        </h6>
                                                        <p class="fs-13"><%# Eval("DesignationName") %></p>
                                                    </div>
                                                </div>

                                                <div class="d-flex align-items-center">
                                                    <i class="ti ti-clock-share me-2"></i>
                                                    <span class="fs-10 fw-medium d-inline-flex align-items-center badge badge-success">
                                                        <i class="ti ti-circle-filled fs-5 me-1"></i>
                                                        <%# FormatTime(Eval("CheckIn")) %>
                                                    </span>
                                                </div>
                                            </div>

                                            <div class="d-flex align-items-center justify-content-between flex-wrap mt-2 border br-5 p-2 pb-0">
                                                <div>
                                                    <p class="mb-1 d-inline-flex align-items-center">
                                                        <i class="ti ti-circle-filled text-success fs-5 me-1"></i>Clock In
                                                    </p>
                                                    <h6 class="fs-13 fw-normal mb-2"><%# FormatTime(Eval("CheckIn")) %></h6>
                                                </div>

                                                <div>
                                                    <p class="mb-1 d-inline-flex align-items-center">
                                                        <i class="ti ti-circle-filled text-danger fs-5 me-1"></i>Clock Out
                                                    </p>
                                                    <h6 class="fs-13 fw-normal mb-2"><%# FormatTime(Eval("CheckOut")) %></h6>
                                                </div>

                                                <div>
                                                    <p class="mb-1 d-inline-flex align-items-center">
                                                        <i class="ti ti-circle-filled text-warning fs-5 me-1"></i>Production
                                                    </p>
                                                    <h6 class="fs-13 fw-normal mb-2"><%# Eval("ProductionHours") %> Hrs</h6>
                                                </div>
                                            </div>
                                        </div>

                                    </ItemTemplate>
                                </asp:Repeater>

                                <h6 class="mb-2">Late</h6>

                                <asp:Repeater ID="rptLateEmployees" runat="server">
                                    <ItemTemplate>

                                        <div class="d-flex align-items-center justify-content-between mb-3 p-2 border border-dashed br-5">
                                            <div class="d-flex align-items-center">
                                                <span class="avatar flex-shrink-0">
                                                    <img src='<%# ResolveUrl("~/" + Eval("ProfilePicture")) %>'
                                                        class="rounded-circle border border-2" alt="img" />
                                                </span>

                                                <div class="ms-2">
                                                    <h6 class="fs-14 fw-medium text-truncate">
                                                        <%# Eval("EmployeeName") %>
                                                        <span class="fs-10 fw-medium d-inline-flex align-items-center badge badge-success">
                                                            <i class="ti ti-clock-hour-11 me-1"></i>Late
                                                        </span>
                                                    </h6>
                                                    <p class="fs-13"><%# Eval("DesignationName") %></p>
                                                </div>
                                            </div>

                                            <div class="d-flex align-items-center">
                                                <i class="ti ti-clock-share me-2"></i>
                                                <span class="fs-10 fw-medium d-inline-flex align-items-center badge badge-danger">
                                                    <i class="ti ti-circle-filled fs-5 me-1"></i>
                                                    <%# FormatTime(Eval("CheckIn")) %>
                                                </span>
                                            </div>
                                        </div>

                                    </ItemTemplate>
                                </asp:Repeater>

                                <a href="<%= ResolveUrl("~/Admin/AttendanceReport.aspx") %>" class="btn btn-light btn-md w-100">View All Attendance
                                </a>

                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>
            <!-- /Clock-In/Out -->


        </div>




        <div class="row">

            <!-- Jobs Applicants -->
            <div class="col-xxl-4 d-flex">
                <div class="card flex-fill">
                    <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                        <h5 class="mb-2">Jobs Applicants</h5>
                        <a href="job-list.html" class="btn btn-light btn-md mb-2">View All</a>
                    </div>
                    <div class="card-body">
                        <ul class="nav nav-tabs tab-style-1 nav-justified d-sm-flex d-block p-0 mb-4" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link fw-medium" data-bs-toggle="tab" data-bs-target="#openings" aria-current="page" href="#openings" aria-selected="false" role="tab" tabindex="-1">Openings</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link fw-medium active" data-bs-toggle="tab" data-bs-target="#applicants" href="#applicants" aria-selected="true" tabindex="-1" role="tab">Applicants</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade" id="openings" role="tabpanel">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <div class="d-flex align-items-center">
                                        <a href="#" class="avatar overflow-hidden flex-shrink-0 bg-gray-100">
                                            <img src="assets/img/icons/apple.svg" class="img-fluid rounded-circle w-auto h-auto" alt="img">
                                        </a>
                                        <div class="ms-2 overflow-hidden">
                                            <p class="text-dark fw-medium text-truncate mb-0"><a href="javascript:void(0);">Senior IOS Developer</a></p>
                                            <span class="fs-12">No of Openings : 25 </span>
                                        </div>
                                    </div>
                                    <a href="javascript:void(0);" class="btn btn-light btn-sm p-0 btn-icon d-flex align-items-center justify-content-center"><i class="ti ti-edit"></i></a>
                                </div>
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <div class="d-flex align-items-center">
                                        <a href="#" class="avatar overflow-hidden flex-shrink-0 bg-gray-100">
                                            <img src="assets/img/icons/php.svg" class="img-fluid w-auto h-auto" alt="img">
                                        </a>
                                        <div class="ms-2 overflow-hidden">
                                            <p class="text-dark fw-medium text-truncate mb-0"><a href="javascript:void(0);">Junior PHP Developer</a></p>
                                            <span class="fs-12">No of Openings : 20 </span>
                                        </div>
                                    </div>
                                    <a href="javascript:void(0);" class="btn btn-light btn-sm p-0 btn-icon d-flex align-items-center justify-content-center"><i class="ti ti-edit"></i></a>
                                </div>
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <div class="d-flex align-items-center">
                                        <a href="#" class="avatar overflow-hidden flex-shrink-0 bg-gray-100">
                                            <img src="assets/img/icons/react.svg" class="img-fluid w-auto h-auto" alt="img">
                                        </a>
                                        <div class="ms-2 overflow-hidden">
                                            <p class="text-dark fw-medium text-truncate mb-0"><a href="javascript:void(0);">Junior React Developer </a></p>
                                            <span class="fs-12">No of Openings : 30 </span>
                                        </div>
                                    </div>
                                    <a href="javascript:void(0);" class="btn btn-light btn-sm p-0 btn-icon d-flex align-items-center justify-content-center"><i class="ti ti-edit"></i></a>
                                </div>
                                <div class="d-flex align-items-center justify-content-between mb-0">
                                    <div class="d-flex align-items-center">
                                        <a href="#" class="avatar overflow-hidden flex-shrink-0 bg-gray-100">
                                            <img src="assets/img/icons/laravel-icon.svg" class="img-fluid w-auto h-auto" alt="img">
                                        </a>
                                        <div class="ms-2 overflow-hidden">
                                            <p class="text-dark fw-medium text-truncate mb-0"><a href="javascript:void(0);">Senior Laravel Developer</a></p>
                                            <span class="fs-12">No of Openings : 40 </span>
                                        </div>
                                    </div>
                                    <a href="javascript:void(0);" class="btn btn-light btn-sm p-0 btn-icon d-flex align-items-center justify-content-center"><i class="ti ti-edit"></i></a>
                                </div>
                            </div>
                            <div class="tab-pane fade show active" id="applicants" role="tabpanel">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <div class="d-flex align-items-center">
                                        <a href="#" class="avatar overflow-hidden flex-shrink-0">
                                            <img src="assets/img/users/user-09.jpg" class="img-fluid rounded-circle" alt="img">
                                        </a>
                                        <div class="ms-2 overflow-hidden">
                                            <p class="text-dark fw-medium text-truncate mb-0"><a href="#">Brian Villalobos</a></p>
                                            <span class="fs-13 d-inline-flex align-items-center">Exp : 5+ Years<i class="ti ti-circle-filled fs-4 mx-2 text-primary"></i>USA</span>
                                        </div>
                                    </div>
                                    <span class="badge badge-secondary badge-xs">UI/UX Designer</span>
                                </div>
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <div class="d-flex align-items-center">
                                        <a href="#" class="avatar overflow-hidden flex-shrink-0">
                                            <img src="assets/img/users/user-32.jpg" class="img-fluid rounded-circle" alt="img">
                                        </a>
                                        <div class="ms-2 overflow-hidden">
                                            <p class="text-dark fw-medium text-truncate mb-0"><a href="#">Anthony Lewis</a></p>
                                            <span class="fs-13 d-inline-flex align-items-center">Exp : 4+ Years<i class="ti ti-circle-filled fs-4 mx-2 text-primary"></i>USA</span>
                                        </div>
                                    </div>
                                    <span class="badge badge-info badge-xs">Python Developer</span>
                                </div>
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <div class="d-flex align-items-center">
                                        <a href="#" class="avatar overflow-hidden flex-shrink-0">
                                            <img src="assets/img/users/user-32.jpg" class="img-fluid rounded-circle" alt="img">
                                        </a>
                                        <div class="ms-2 overflow-hidden">
                                            <p class="text-dark fw-medium text-truncate mb-0"><a href="#">Stephan Peralt</a></p>
                                            <span class="fs-13 d-inline-flex align-items-center">Exp : 6+ Years<i class="ti ti-circle-filled fs-4 mx-2 text-primary"></i>USA</span>
                                        </div>
                                    </div>
                                    <span class="badge badge-pink badge-xs">Android Developer</span>
                                </div>
                                <div class="d-flex align-items-center justify-content-between mb-0">
                                    <div class="d-flex align-items-center">
                                        <a href="javascript:void(0);" class="avatar overflow-hidden flex-shrink-0">
                                            <img src="assets/img/users/user-34.jpg" class="img-fluid rounded-circle" alt="img">
                                        </a>
                                        <div class="ms-2 overflow-hidden">
                                            <p class="text-dark fw-medium text-truncate mb-0"><a href="javascript:void(0);">Doglas Martini</a></p>
                                            <span class="fs-13 d-inline-flex align-items-center">Exp : 2+ Years<i class="ti ti-circle-filled fs-4 mx-2 text-primary"></i>USA</span>
                                        </div>
                                    </div>
                                    <span class="badge badge-purple badge-xs">React Developer</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Jobs Applicants -->
            <!-- Employees -->
            <div class="col-xxl-4 col-xl-6 d-flex">
                <div class="card flex-fill">
                    <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                        <h5 class="mb-2">Employees</h5>
                        <a href="employees.html" class="btn btn-light btn-md mb-2">View All</a>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-nowrap mb-0">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Department</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="/uploads/user/639178005423390129_dog1.jpg" alt="Profile" class="rounded-circle" width="40" height="40">

                                                <div class="ms-2">
                                                    <strong>admin a</strong>
                                                </div>
                                            </div>
                                        </td>
                                        <td>IT</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="/uploads/user/639178006593410735_cat2.png" alt="Profile" class="rounded-circle" width="40" height="40">

                                                <div class="ms-2">
                                                    <strong>Krish Kheloji</strong>
                                                </div>
                                            </div>
                                        </td>
                                        <td>IT</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="/Content/uploads/user1.jpg" alt="Profile" class="rounded-circle" width="40" height="40">

                                                <div class="ms-2">
                                                    <strong>SurajR K</strong>
                                                </div>
                                            </div>
                                        </td>
                                        <td>IT</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="/Content/uploads/user2.jpg" alt="Profile" class="rounded-circle" width="40" height="40">

                                                <div class="ms-2">
                                                    <strong>Ram Kheloji</strong>
                                                </div>
                                            </div>
                                        </td>
                                        <td>IT</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="/Content/uploads/IMG_20230714_114721.jpg" alt="Profile" class="rounded-circle" width="40" height="40">

                                                <div class="ms-2">
                                                    <strong>Jack J</strong>
                                                </div>
                                            </div>
                                        </td>
                                        <td>IT</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="/Content/uploads/photo.jpeg" alt="Profile" class="rounded-circle" width="40" height="40">

                                                <div class="ms-2">
                                                    <strong>Harish K</strong>
                                                </div>
                                            </div>
                                        </td>
                                        <td>IT</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- /Employees -->
            <!-- Todo -->
            <div class="col-xxl-4 col-xl-6 d-flex">
                <div class="card flex-fill">
                    <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                        <h5 class="mb-2">Todo</h5>
                        <div class="d-flex align-items-center">
                            <div class="dropdown mb-2 me-2">
                                <a href="javascript:void(0);" class="btn btn-white border btn-sm d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                    <i class="ti ti-calendar me-1"></i>Today
                                </a>
                                <ul class="dropdown-menu  dropdown-menu-end p-3">
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">This Month</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">This Week</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">Today</a>
                                    </li>
                                </ul>
                            </div>
                            <a href="#" class="btn btn-primary btn-icon btn-xs rounded-circle d-flex align-items-center justify-content-center p-0 mb-2" data-bs-toggle="modal" data-bs-target="#add_todo"><i class="ti ti-plus fs-16"></i></a>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="d-flex align-items-center todo-item border p-2 br-5 mb-2">
                            <i class="ti ti-grid-dots me-2"></i>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="todo1">
                                <label class="form-check-label fw-medium" for="todo1">Add Holidays</label>
                            </div>
                        </div>
                        <div class="d-flex align-items-center todo-item border p-2 br-5 mb-2">
                            <i class="ti ti-grid-dots me-2"></i>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="todo2">
                                <label class="form-check-label fw-medium" for="todo2">Add Meeting  to Client</label>
                            </div>
                        </div>
                        <div class="d-flex align-items-center todo-item border p-2 br-5 mb-2">
                            <i class="ti ti-grid-dots me-2"></i>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="todo3">
                                <label class="form-check-label fw-medium" for="todo3">Chat with Adrian</label>
                            </div>
                        </div>
                        <div class="d-flex align-items-center todo-item border p-2 br-5 mb-2">
                            <i class="ti ti-grid-dots me-2"></i>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="todo4">
                                <label class="form-check-label fw-medium" for="todo4">Management Call</label>
                            </div>
                        </div>
                        <div class="d-flex align-items-center todo-item border p-2 br-5 mb-2">
                            <i class="ti ti-grid-dots me-2"></i>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="todo5">
                                <label class="form-check-label fw-medium" for="todo5">Add Payroll</label>
                            </div>
                        </div>
                        <div class="d-flex align-items-center todo-item border p-2 br-5 mb-0">
                            <i class="ti ti-grid-dots me-2"></i>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="todo6">
                                <label class="form-check-label fw-medium" for="todo6">Add Policy for Increment </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Todo -->

        </div>



        <div class="row">

            <!-- Projects -->
            <div class="col-xxl-8 col-xl-7 d-flex">
                <div class="card flex-fill">
                    <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                        <h5 class="mb-2">Projects</h5>
                    </div>

                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-nowrap mb-0">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Team</th>
                                        <th>Deadline</th>
                                        <th>Priority</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <asp:Repeater ID="rptDashboardProjects" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("ProjectId") %></td>

                                                <td><%# Eval("ProjectName") %></td>

                                                <td>
                                                    <div class="avatar-list-stacked avatar-group-sm">
                                                        <%# GetTeamImages(Eval("TeamImages")) %>
                                                    </div>
                                                </td>

                                                <td><%# Eval("Deadline") %></td>

                                                <td>
                                                    <span class='<%# GetPriorityBadge(Eval("Priority").ToString()) %>'>
                                                        <i class="ti ti-point-filled me-1"></i>
                                                        <%# Eval("Priority") %>
                                                    </span>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Projects -->











            <!-- Tasks Statistics -->
            <div class="col-xxl-4 col-xl-5 d-flex">
                <div class="card flex-fill">
                    <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                        <h5 class="mb-2">Tasks Statistics</h5>
                        <div class="d-flex align-items-center">
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="chartjs-wrapper-demo position-relative mb-4">
                            <canvas id="mySemiDonutChart" height="213" width="909" style="display: block; box-sizing: border-box; height: 190px; width: 808.4px;"></canvas>
                            <div class="position-absolute text-center attendance-canvas">
                                <p class="fs-13 mb-1">Total Tasks</p>
                                <h3>6 / 19</h3>
                            </div>
                        </div>
                        <div class="d-flex align-items-center flex-wrap">
                            <div class="border-end text-center me-2 pe-2 mb-3">
                                <p class="fs-13 d-inline-flex align-items-center mb-1"><i class="ti ti-circle-filled fs-10 me-1 text-warning"></i>Completed</p>
                                <h5>31%</h5>
                            </div>
                            <div class="border-end text-center me-2 pe-2 mb-3">
                                <p class="fs-13 d-inline-flex align-items-center mb-1"><i class="ti ti-circle-filled fs-10 me-1 text-info"></i>Onhold</p>
                                <h5>15%</h5>
                            </div>
                            <div class="border-end text-center me-2 pe-2 mb-3">
                                <p class="fs-13 d-inline-flex align-items-center mb-1"><i class="ti ti-circle-filled fs-10 me-1 text-danger"></i>Inprogress</p>
                                <h5>26%</h5>
                            </div>
                            <div class="text-center me-2 pe-2 mb-3">
                                <p class="fs-13 d-inline-flex align-items-center mb-1"><i class="ti ti-circle-filled fs-10 me-1 text-success"></i>Pending</p>
                                <h5>26%</h5>
                            </div>
                        </div>
                        <div class="bg-dark br-5 p-3 pb-0 d-flex align-items-center justify-content-between">
                            <div class="mb-2">
                                <h4 class="text-success">389/689 hrs</h4>
                                <p class="fs-13 mb-0">Spent on Overall Tasks This Week</p>
                            </div>
                            <a href="tasks.html" class="btn btn-sm btn-light mb-2 text-nowrap">View All</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Tasks Statistics -->

        </div>

        <div class="row">

            <!-- Schedules -->
            <div class="col-xxl-4 d-flex">
                <div class="card flex-fill">
                    <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                        <h5 class="mb-2">Schedules</h5>
                        <a href="candidates.html" class="btn btn-light btn-md mb-2">View All</a>
                    </div>
                    <div class="card-body">
                        <div class="bg-light p-3 br-5 mb-4">
                            <span class="badge badge-secondary badge-xs mb-1">UI/ UX Designer</span>
                            <h6 class="mb-2 text-truncate">Interview Candidates - UI/UX Designer</h6>
                            <div class="d-flex align-items-center flex-wrap">
                                <p class="fs-13 mb-1 me-2"><i class="ti ti-calendar-event me-2"></i>Thu, 15 Feb 2025</p>
                                <p class="fs-13 mb-1"><i class="ti ti-clock-hour-11 me-2"></i>01:00 PM - 02:20 PM</p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between border-top mt-2 pt-3">
                                <div class="avatar-list-stacked avatar-group-sm">
                                    <span class="avatar avatar-rounded">
                                        <img class="border border-white" src="assets/img/users/user-49.jpg" alt="img">
                                    </span>
                                    <span class="avatar avatar-rounded">
                                        <img class="border border-white" src="assets/img/users/user-13.jpg" alt="img">
                                    </span>
                                    <span class="avatar avatar-rounded">
                                        <img class="border border-white" src="assets/img/users/user-11.jpg" alt="img">
                                    </span>
                                    <span class="avatar avatar-rounded">
                                        <img class="border border-white" src="assets/img/users/user-22.jpg" alt="img">
                                    </span>
                                    <span class="avatar avatar-rounded">
                                        <img class="border border-white" src="assets/img/users/user-58.jpg" alt="img">
                                    </span>
                                    <a class="avatar bg-primary avatar-rounded text-fixed-white fs-10 fw-medium" href="javascript:void(0);">+3
                                    </a>
                                </div>
                                <a href="#" class="btn btn-primary btn-xs">Join Meeting</a>
                            </div>
                        </div>
                        <div class="bg-light p-3 br-5 mb-0">
                            <span class="badge badge-dark badge-xs mb-1">IOS Developer</span>
                            <h6 class="mb-2 text-truncate">Interview Candidates - IOS Developer</h6>
                            <div class="d-flex align-items-center flex-wrap">
                                <p class="fs-13 mb-1 me-2"><i class="ti ti-calendar-event me-2"></i>Thu, 15 Feb 2025</p>
                                <p class="fs-13 mb-1"><i class="ti ti-clock-hour-11 me-2"></i>02:00 PM - 04:20 PM</p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between border-top mt-2 pt-3">
                                <div class="avatar-list-stacked avatar-group-sm">
                                    <span class="avatar avatar-rounded">
                                        <img class="border border-white" src="assets/img/users/user-49.jpg" alt="img">
                                    </span>
                                    <span class="avatar avatar-rounded">
                                        <img class="border border-white" src="assets/img/users/user-13.jpg" alt="img">
                                    </span>
                                    <span class="avatar avatar-rounded">
                                        <img class="border border-white" src="assets/img/users/user-11.jpg" alt="img">
                                    </span>
                                    <span class="avatar avatar-rounded">
                                        <img class="border border-white" src="assets/img/users/user-22.jpg" alt="img">
                                    </span>
                                    <span class="avatar avatar-rounded">
                                        <img class="border border-white" src="assets/img/users/user-58.jpg" alt="img">
                                    </span>
                                    <a class="avatar bg-primary avatar-rounded text-fixed-white fs-10 fw-medium" href="javascript:void(0);">+3
                                    </a>
                                </div>
                                <a href="#" class="btn btn-primary btn-xs">Join Meeting</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Schedules -->
            <!-- Recent Activities -->
            <div class="col-xxl-4 col-xl-6 d-flex">
                <div class="card flex-fill">
                    <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                        <h5 class="mb-2">Recent Activities</h5>
                        <a href="activity.html" class="btn btn-light btn-md mb-2">View All</a>
                    </div>
                    <div class="card-body">
                        <div class="recent-item">
                            <div class="d-flex justify-content-between">
                                <div class="d-flex align-items-center w-100">
                                    <a href="javscript:void(0);" class="avatar  flex-shrink-0">
                                        <img src="assets/img/users/user-38.jpg" class="rounded-circle" alt="img">
                                    </a>
                                    <div class="ms-2 flex-fill">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <h6 class="fs-medium text-truncate"><a href="javscript:void(0);">Matt Morgan</a></h6>
                                            <p class="fs-13">05:30 PM</p>
                                        </div>
                                        <p class="fs-13">Added New Project <span class="text-primary">HRMS Dashboard</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="recent-item">
                            <div class="d-flex justify-content-between">
                                <div class="d-flex align-items-center w-100">
                                    <a href="javscript:void(0);" class="avatar  flex-shrink-0">
                                        <img src="assets/img/users/user-01.jpg" class="rounded-circle" alt="img">
                                    </a>
                                    <div class="ms-2 flex-fill">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <h6 class="fs-medium text-truncate"><a href="javscript:void(0);">Jay Ze</a></h6>
                                            <p class="fs-13">05:00 PM</p>
                                        </div>
                                        <p class="fs-13">Commented on Uploaded Document</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="recent-item">
                            <div class="d-flex justify-content-between">
                                <div class="d-flex align-items-center w-100">
                                    <a href="javscript:void(0);" class="avatar  flex-shrink-0">
                                        <img src="assets/img/users/user-19.jpg" class="rounded-circle" alt="img">
                                    </a>
                                    <div class="ms-2 flex-fill">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <h6 class="fs-medium text-truncate"><a href="javscript:void(0);">Mary Donald</a></h6>
                                            <p class="fs-13">05:30 PM</p>
                                        </div>
                                        <p class="fs-13">Approved Task Projects</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="recent-item">
                            <div class="d-flex justify-content-between">
                                <div class="d-flex align-items-center w-100">
                                    <a href="javscript:void(0);" class="avatar  flex-shrink-0">
                                        <img src="assets/img/users/user-11.jpg" class="rounded-circle" alt="img">
                                    </a>
                                    <div class="ms-2 flex-fill">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <h6 class="fs-medium text-truncate"><a href="javscript:void(0);">George David</a></h6>
                                            <p class="fs-13">06:00 PM</p>
                                        </div>
                                        <p class="fs-13">Requesting Access to Module Tickets</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="recent-item">
                            <div class="d-flex justify-content-between">
                                <div class="d-flex align-items-center w-100">
                                    <a href="javscript:void(0);" class="avatar  flex-shrink-0">
                                        <img src="assets/img/users/user-20.jpg" class="rounded-circle" alt="img">
                                    </a>
                                    <div class="ms-2 flex-fill">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <h6 class="fs-medium text-truncate"><a href="javscript:void(0);">Aaron Zeen</a></h6>
                                            <p class="fs-13">06:30 PM</p>
                                        </div>
                                        <p class="fs-13">Downloaded App Reportss</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="recent-item">
                            <div class="d-flex justify-content-between">
                                <div class="d-flex align-items-center w-100">
                                    <a href="javscript:void(0);" class="avatar  flex-shrink-0">
                                        <img src="assets/img/users/user-08.jpg" class="rounded-circle" alt="img">
                                    </a>
                                    <div class="ms-2 flex-fill">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <h6 class="fs-medium text-truncate"><a href="javscript:void(0);">Hendry Daniel</a></h6>
                                            <p class="fs-13">05:30 PM</p>
                                        </div>
                                        <p class="fs-13">Completed New Project <span>HMS</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Recent Activities -->
            <!-- Birthdays -->
            <div class="col-xxl-4 col-xl-6 d-flex">
                <div class="card flex-fill">
                    <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                        <h5 class="mb-2">Birthdays</h5>
                        <a href="javascript:void(0);" class="btn btn-light btn-md mb-2">View All</a>
                    </div>
                    <div class="card-body pb-1">
                        <h6 class="mb-2">Today</h6>
                        <div class="bg-light p-2 border border-dashed rounded-top mb-3">
                            <p class="fs-13">No birthdays today.</p>
                        </div>
                        <h6 class="mb-2">Tomorrow</h6>
                        <div class="bg-light p-2 border border-dashed rounded-top mb-3">
                            <p class="fs-13">No birthdays tomorrow.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- /Birthdays -->

        </div>
        <!--REprot Scetion scripts-->


    </div>





















    <script>
        var attendanceChartInstance = null;

        function loadAttendanceChart() {
            var ctx = document.getElementById('attendanceChart');

            if (!ctx) return;

            var present = parseFloat(document.getElementById('<%= hfPresentPercentage.ClientID %>').value || 0);
            var halfDay = parseFloat(document.getElementById('<%= hfHalfDayPercentage.ClientID %>').value || 0);
            var absent = parseFloat(document.getElementById('<%= hfAbsentPercentage.ClientID %>').value || 0);

            if (attendanceChartInstance != null) {
                attendanceChartInstance.destroy();
            }

            attendanceChartInstance = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: ['Present', 'Half Day', 'Absent'],
                    datasets: [{
                        data: [present, halfDay, absent],
                        backgroundColor: ['#03C95A', '#3B7080', '#E70D0D'],
                        borderWidth: 5,
                        borderColor: '#fff'
                    }]
                },
                options: {
                    cutout: '70%',
                    rotation: -90,
                    circumference: 180,
                    plugins: {
                        legend: {
                            display: false
                        }
                    }
                }
            });
        }

        document.addEventListener("DOMContentLoaded", function () {
            loadAttendanceChart();
        });
    </script>


    <script>
        var empDeptChartInstance = null;

        function loadEmpDeptChart() {
            if (typeof Chart === "undefined") {
                console.log("ChartJS not loaded");
                return;
            }

            var ctx = document.getElementById('empDeptChart');
            if (!ctx) return;

            var deptNames = document.getElementById('<%= hfDeptNames.ClientID %>').value.split(',');
        var deptCounts = document.getElementById('<%= hfDeptCounts.ClientID %>').value.split(',').map(Number);

            if (empDeptChartInstance != null) {
                empDeptChartInstance.destroy();
            }

            empDeptChartInstance = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: deptNames,
                    datasets: [{
                        data: deptCounts,
                        borderWidth: 1,
                        borderRadius: 15,
                        barThickness: 40
                    }]
                },
                options: {
                    indexAxis: 'y',
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        x: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }

        document.addEventListener("DOMContentLoaded", function () {
            loadEmpDeptChart();
        });
    </script>






</asp:Content>
