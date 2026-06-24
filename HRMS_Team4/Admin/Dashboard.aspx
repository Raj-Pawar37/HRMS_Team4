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
            <!-- Employees By Department -->
            <div class="col-xxl-4 d-flex">
                <div class="card flex-fill">
                    <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                        <h5 class="mb-2">Employees By Department</h5>
                        <div class="dropdown mb-2">
                            <a href="javascript:void(0);" class="btn btn-white border btn-sm d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                <i class="ti ti-calendar me-1"></i>This Week
                            </a>
                        </div>
                    </div>
                    <div class="card-body">
                        <canvas id="empDeptChart" width="909" height="682" style="display: block; box-sizing: border-box; height: 606.3px; width: 808px;"></canvas>
                    </div>
                </div>
            </div>
            <!-- /Employees By Department -->
            <!-- /Employees By Department -->

        </div>

        <div class="row">

            <!-- Total Employee -->
            <div class="col-xxl-4 d-flex">
                <div class="card flex-fill">
                    <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                        <h5 class="mb-2">Employee Status</h5>
                        <div class="dropdown mb-2">
                            <a href="javascript:void(0);" class="btn btn-white border btn-sm d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                <i class="ti ti-calendar me-1"></i>This Week
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
                    </div>
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between mb-1">
                            <p class="fs-13 mb-3">Total Employee</p>
                            <h3 class="mb-3">48</h3>
                        </div>
                        <div class="progress-stacked emp-stack mb-3">
                            <div class="progress" role="progressbar" aria-label="Segment one" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                <div class="progress-bar bg-warning"></div>
                            </div>
                            <div class="progress" role="progressbar" aria-label="Segment two" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                <div class="progress-bar bg-secondary"></div>
                            </div>
                            <div class="progress" role="progressbar" aria-label="Segment three" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 10%">
                                <div class="progress-bar bg-danger"></div>
                            </div>
                            <div class="progress" role="progressbar" aria-label="Segment four" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 30%">
                                <div class="progress-bar bg-pink"></div>
                            </div>
                        </div>
                        <div class="border mb-3">
                            <div class="row gx-0">
                                <div class="col-6">
                                    <div class="p-2 flex-fill border-end border-bottom">
                                        <p class="fs-13 mb-2"><i class="ti ti-square-filled text-primary fs-12 me-2"></i>Production Hours <span class="text-gray-9">(701%)</span></p>
                                        <h2 class="display-1">175,25</h2>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="p-2 flex-fill border-bottom text-end">
                                        <p class="fs-13 mb-2"><i class="ti ti-square-filled me-2 text-secondary fs-12"></i>Working Hours <span class="text-gray-9">(13%)</span></p>
                                        <h2 class="display-1">3,25</h2>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="p-2 flex-fill border-end">
                                        <p class="fs-13 mb-2"><i class="ti ti-square-filled me-2 text-danger fs-12"></i>Break Hours <span class="text-gray-9">(92%)</span></p>
                                        <h2 class="display-1">23</h2>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="p-2 flex-fill text-end">
                                        <p class="fs-13 mb-2"><i class="ti ti-square-filled text-pink me-2 fs-12"></i>Working Hours <span class="text-gray-9">(745,32%)</span></p>
                                        <h2 class="display-1">186,33</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a href="#" class="btn btn-light btn-md w-100">View All Employees</a>
                    </div>
                </div>
            </div>
            <!-- /Total Employee -->
            <!-- Attendance Overview -->
            <div class="col-xxl-4 col-xl-6 d-flex">
                <div class="card flex-fill">
                    <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                        <h5 class="mb-2">Attendance Overview</h5>
                        <div class="dropdown mb-2">
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
                    </div>
                    <div class="card-body">
                        <div class="chartjs-wrapper-demo position-relative mb-4">
                            <canvas id="attendance" height="225" width="909" style="display: block; box-sizing: border-box; height: 200px; width: 808.4px;"></canvas>
                            <div class="position-absolute text-center attendance-canvas">
                                <p class="fs-13 mb-1">Total Attendance</p>
                                <h3>25</h3>
                            </div>
                        </div>
                        <h6 class="mb-3">Status</h6>
                        <div class="d-flex align-items-center justify-content-between">
                            <p class="f-13 mb-2"><i class="ti ti-circle-filled text-success me-1"></i>Present</p>
                            <p class="f-13 fw-medium text-gray-9 mb-2">96%</p>
                        </div>
                        <div class="d-flex align-items-center justify-content-between">
                            <p class="f-13 mb-2"><i class="ti ti-circle-filled text-secondary me-1"></i>Half Day</p>
                            <p class="f-13 fw-medium text-gray-9 mb-2">0%</p>
                        </div>
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <p class="f-13 mb-2"><i class="ti ti-circle-filled text-danger me-1"></i>Absent</p>
                            <p class="f-13 fw-medium text-gray-9 mb-2">4%</p>
                        </div>
                        <div class="bg-light br-5 box-shadow-xs p-2 pb-0 d-flex align-items-center justify-content-between flex-wrap">
                            <div class="d-flex align-items-center">
                                <p class="mb-2 me-2">Total Absenties</p>
                                <div class="avatar-list-stacked avatar-group-sm mb-2">
                                    <span class="avatar avatar-rounded">
                                        <img class="border border-white" src="assets/img/profiles/avatar-27.jpg" alt="img">
                                    </span>
                                    <span class="avatar avatar-rounded">
                                        <img class="border border-white" src="assets/img/profiles/avatar-30.jpg" alt="img">
                                    </span>
                                    <span class="avatar avatar-rounded">
                                        <img src="assets/img/profiles/avatar-14.jpg" alt="img">
                                    </span>
                                    <span class="avatar avatar-rounded">
                                        <img src="assets/img/profiles/avatar-29.jpg" alt="img">
                                    </span>
                                    <a class="avatar bg-primary avatar-rounded text-fixed-white fs-10" href="javascript:void(0);">+1
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Attendance Overview -->
            <!-- /Attendance Overview -->
            <!-- Clock-In/Out -->
            <div class="col-xxl-4 col-xl-6 d-flex">
                <div class="card flex-fill">
                    <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                        <h5 class="mb-2">Clock-In/Out</h5>
                        <div class="d-flex align-items-center">
                            <div class="dropdown mb-2">
                                <a href="javascript:void(0);" class="dropdown-toggle btn btn-white btn-sm d-inline-flex align-items-center border-0 fs-13 me-2" data-bs-toggle="dropdown">All Departments
                                </a>
                                <ul class="dropdown-menu  dropdown-menu-end p-3">
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">Finance</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">Development</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">Marketing</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="dropdown mb-2">
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
                        </div>
                    </div>
                    <div class="card-body">
                        <div>
                            <div class="d-flex align-items-center justify-content-between mb-3 p-2 border border-dashed br-5">
                                <div class="d-flex align-items-center">
                                    <a href="javascript:void(0);" class="avatar flex-shrink-0">
                                        <img src="assets/img/profiles/avatar-24.jpg" class="rounded-circle border border-2" alt="img">
                                    </a>
                                    <div class="ms-2">
                                        <h6 class="fs-14 fw-medium text-truncate">Daniel Esbella</h6>
                                        <p class="fs-13">UI/UX Designer</p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                    <a href="javascript:void(0);" class="link-default me-2"><i class="ti ti-clock-share"></i></a>
                                    <span class="fs-10 fw-medium d-inline-flex align-items-center badge badge-success"><i class="ti ti-circle-filled fs-5 me-1"></i>09:15</span>
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-3 p-2 border br-5">
                                <div class="d-flex align-items-center">
                                    <a href="javascript:void(0);" class="avatar flex-shrink-0">
                                        <img src="assets/img/profiles/avatar-23.jpg" class="rounded-circle border border-2" alt="img">
                                    </a>
                                    <div class="ms-2">
                                        <h6 class="fs-14 fw-medium">Doglas Martini</h6>
                                        <p class="fs-13">Project Manager</p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                    <a href="javascript:void(0);" class="link-default me-2"><i class="ti ti-clock-share"></i></a>
                                    <span class="fs-10 fw-medium d-inline-flex align-items-center badge badge-success"><i class="ti ti-circle-filled fs-5 me-1"></i>09:36</span>
                                </div>
                            </div>
                            <div class="mb-3 p-2 border br-5">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div class="d-flex align-items-center">
                                        <a href="javascript:void(0);" class="avatar flex-shrink-0">
                                            <img src="assets/img/profiles/avatar-27.jpg" class="rounded-circle border border-2" alt="img">
                                        </a>
                                        <div class="ms-2">
                                            <h6 class="fs-14 fw-medium text-truncate">Brian Villalobos</h6>
                                            <p class="fs-13">PHP Developer</p>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <a href="javascript:void(0);" class="link-default me-2"><i class="ti ti-clock-share"></i></a>
                                        <span class="fs-10 fw-medium d-inline-flex align-items-center badge badge-success"><i class="ti ti-circle-filled fs-5 me-1"></i>09:15</span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center justify-content-between flex-wrap mt-2 border br-5 p-2 pb-0">
                                    <div>
                                        <p class="mb-1 d-inline-flex align-items-center"><i class="ti ti-circle-filled text-success fs-5 me-1"></i>Clock In</p>
                                        <h6 class="fs-13 fw-normal mb-2">10:30 AM</h6>
                                    </div>
                                    <div>
                                        <p class="mb-1 d-inline-flex align-items-center"><i class="ti ti-circle-filled text-danger fs-5 me-1"></i>Clock Out</p>
                                        <h6 class="fs-13 fw-normal mb-2">09:45 AM</h6>
                                    </div>
                                    <div>
                                        <p class="mb-1 d-inline-flex align-items-center"><i class="ti ti-circle-filled text-warning fs-5 me-1"></i>Production</p>
                                        <h6 class="fs-13 fw-normal mb-2">09:21 Hrs</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h6 class="mb-2">Late</h6>
                        <div class="d-flex align-items-center justify-content-between mb-3 p-2 border border-dashed br-5">
                            <div class="d-flex align-items-center">
                                <span class="avatar flex-shrink-0">
                                    <img src="assets/img/profiles/avatar-29.jpg" class="rounded-circle border border-2" alt="img">
                                </span>
                                <div class="ms-2">
                                    <h6 class="fs-14 fw-medium text-truncate">Anthony Lewis <span class="fs-10 fw-medium d-inline-flex align-items-center badge badge-success"><i class="ti ti-clock-hour-11 me-1"></i>30 Min</span></h6>
                                    <p class="fs-13">Marketing Head</p>
                                </div>
                            </div>
                            <div class="d-flex align-items-center">
                                <a href="javascript:void(0);" class="link-default me-2"><i class="ti ti-clock-share"></i></a>
                                <span class="fs-10 fw-medium d-inline-flex align-items-center badge badge-danger"><i class="ti ti-circle-filled fs-5 me-1"></i>08:35</span>
                            </div>
                        </div>
                        <a href="attendance-report.html" class="btn btn-light btn-md w-100">View All Attendance</a>
                    </div>
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

            <!-- Sales Overview -->
            <div class="col-xl-7 d-flex">
                <div class="card flex-fill">
                    <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                        <h5 class="mb-2">Sales Overview</h5>
                        <div class="d-flex align-items-center">
                            <div class="dropdown mb-2">
                                <a href="javascript:void(0);" class="dropdown-toggle btn btn-white border-0 btn-sm d-inline-flex align-items-center fs-13 me-2" data-bs-toggle="dropdown">All Departments
                                </a>
                                <ul class="dropdown-menu  dropdown-menu-end p-3">
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">UI/UX Designer</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">HR Manager</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">Junior Tester</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="card-body pb-0">
                        <div class="d-flex align-items-center justify-content-between flex-wrap">
                            <div class="d-flex align-items-center mb-1">
                                <p class="fs-13 text-gray-9 me-3 mb-0"><i class="ti ti-square-filled me-2 text-primary"></i>Income</p>
                                <p class="fs-13 text-gray-9 mb-0"><i class="ti ti-square-filled me-2 text-gray-2"></i>Expenses</p>
                            </div>
                            <p class="fs-13 mb-1">Last Updated at 11:30PM</p>
                        </div>
                        <div id="sales-income" style="min-height: 305px;">
                            <div id="apexchartsy9rviavhg" class="apexcharts-canvas apexchartsy9rviavhg apexcharts-theme-" style="width: 808px; height: 290px;">
                                <svg id="SvgjsSvg1001" width="808" height="290" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)">
                                    <foreignObject x="0" y="0" width="808" height="290">
                                        <div class="apexcharts-legend" xmlns="http://www.w3.org/1999/xhtml" style="max-height: 145px;"></div>
                                        <style type="text/css">
                                            .apexcharts-flip-y {
                                                transform: scaleY(-1) translateY(-100%);
                                                transform-origin: top;
                                                transform-box: fill-box;
                                            }

                                            .apexcharts-flip-x {
                                                transform: scaleX(-1);
                                                transform-origin: center;
                                                transform-box: fill-box;
                                            }

                                            .apexcharts-legend {
                                                display: flex;
                                                overflow: auto;
                                                padding: 0 10px;
                                            }

                                                .apexcharts-legend.apx-legend-position-bottom, .apexcharts-legend.apx-legend-position-top {
                                                    flex-wrap: wrap
                                                }

                                                .apexcharts-legend.apx-legend-position-right, .apexcharts-legend.apx-legend-position-left {
                                                    flex-direction: column;
                                                    bottom: 0;
                                                }

                                                .apexcharts-legend.apx-legend-position-bottom.apexcharts-align-left, .apexcharts-legend.apx-legend-position-top.apexcharts-align-left, .apexcharts-legend.apx-legend-position-right, .apexcharts-legend.apx-legend-position-left {
                                                    justify-content: flex-start;
                                                }

                                                .apexcharts-legend.apx-legend-position-bottom.apexcharts-align-center, .apexcharts-legend.apx-legend-position-top.apexcharts-align-center {
                                                    justify-content: center;
                                                }

                                                .apexcharts-legend.apx-legend-position-bottom.apexcharts-align-right, .apexcharts-legend.apx-legend-position-top.apexcharts-align-right {
                                                    justify-content: flex-end;
                                                }

                                            .apexcharts-legend-series {
                                                cursor: pointer;
                                                line-height: normal;
                                                display: flex;
                                                align-items: center;
                                            }

                                            .apexcharts-legend-text {
                                                position: relative;
                                                font-size: 14px;
                                            }

                                                .apexcharts-legend-text *, .apexcharts-legend-marker * {
                                                    pointer-events: none;
                                                }

                                            .apexcharts-legend-marker {
                                                position: relative;
                                                display: flex;
                                                align-items: center;
                                                justify-content: center;
                                                cursor: pointer;
                                                margin-right: 1px;
                                            }

                                            .apexcharts-legend-series.apexcharts-no-click {
                                                cursor: auto;
                                            }

                                            .apexcharts-legend .apexcharts-hidden-zero-series, .apexcharts-legend .apexcharts-hidden-null-series {
                                                display: none !important;
                                            }

                                            .apexcharts-inactive-legend {
                                                opacity: 0.45;
                                            }
                                        </style>
                                    </foreignObject><g id="SvgjsG1014" class="apexcharts-datalabels-group" transform="translate(0, 0) scale(1)"></g><g id="SvgjsG1015" class="apexcharts-datalabels-group" transform="translate(0, 0) scale(1)"></g><g id="SvgjsG1138" class="apexcharts-yaxis" rel="0" transform="translate(3.6944446563720703, 0)"><g id="SvgjsG1139" class="apexcharts-yaxis-texts-g"><text id="SvgjsText1141" font-family="Helvetica, Arial, sans-serif" x="20" y="34.333333333333336" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;"><tspan id="SvgjsTspan1142">120</tspan>
                                        <title>120</title></text>
                                        <text id="SvgjsText1144" font-family="Helvetica, Arial, sans-serif" x="20" y="71.33140737883251" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                            <tspan id="SvgjsTspan1145">100</tspan>
                                            <title>100</title></text>
                                        <text id="SvgjsText1147" font-family="Helvetica, Arial, sans-serif" x="20" y="108.32948142433168" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                            <tspan id="SvgjsTspan1148">80</tspan>
                                            <title>80</title></text>
                                        <text id="SvgjsText1150" font-family="Helvetica, Arial, sans-serif" x="20" y="145.32755546983086" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                            <tspan id="SvgjsTspan1151">60</tspan>
                                            <title>60</title></text>
                                        <text id="SvgjsText1153" font-family="Helvetica, Arial, sans-serif" x="20" y="182.32562951533004" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                            <tspan id="SvgjsTspan1154">40</tspan>
                                            <title>40</title></text>
                                        <text id="SvgjsText1156" font-family="Helvetica, Arial, sans-serif" x="20" y="219.32370356082922" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                            <tspan id="SvgjsTspan1157">20</tspan>
                                            <title>20</title></text>
                                        <text id="SvgjsText1159" font-family="Helvetica, Arial, sans-serif" x="20" y="256.3217776063284" text-anchor="end" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                            <tspan id="SvgjsTspan1160">0</tspan>
                                            <title>0</title></text>
                                    </g>
                                    </g><g id="SvgjsG1003" class="apexcharts-inner apexcharts-graphical" transform="translate(28.69444465637207, 30)"><defs id="SvgjsDefs1002"><linearGradient id="SvgjsLinearGradient1006" x1="0" y1="0" x2="0" y2="1"><stop id="SvgjsStop1007" stop-opacity="0.4" stop-color="rgba(216,227,240,0.4)" offset="0"></stop>
                                        <stop id="SvgjsStop1008" stop-opacity="0.5" stop-color="rgba(190,209,230,0.5)" offset="1"></stop>
                                        <stop id="SvgjsStop1009" stop-opacity="0.5" stop-color="rgba(190,209,230,0.5)" offset="1"></stop>
                                    </linearGradient>
                                        <clipPath id="gridRectMasky9rviavhg">
                                            <rect id="SvgjsRect1011" width="756.4437656402588" height="221.98844427299503" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect>
                                        </clipPath>
                                        <clipPath id="gridRectBarMasky9rviavhg">
                                            <rect id="SvgjsRect1012" width="760.4437656402588" height="225.98844427299503" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect>
                                        </clipPath>
                                        <clipPath id="gridRectMarkerMasky9rviavhg">
                                            <rect id="SvgjsRect1013" width="756.4437656402588" height="221.98844427299503" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect>
                                        </clipPath>
                                        <clipPath id="forecastMasky9rviavhg"></clipPath>
                                        <clipPath id="nonForecastMasky9rviavhg"></clipPath>
                                    </defs>
                                        <rect id="SvgjsRect1010" width="44.125886329015096" height="221.98844427299503" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke-dasharray="3" fill="url(#SvgjsLinearGradient1006)" class="apexcharts-xcrosshairs" y2="221.98844427299503" filter="none" fill-opacity="0.9"></rect>
                                        <line id="SvgjsLine1075" x1="0" y1="221.98844427299503" x2="0" y2="227.98844427299503" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1076" x1="63.03698047002157" y1="221.98844427299503" x2="63.03698047002157" y2="227.98844427299503" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1077" x1="126.07396094004314" y1="221.98844427299503" x2="126.07396094004314" y2="227.98844427299503" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1078" x1="189.1109414100647" y1="221.98844427299503" x2="189.1109414100647" y2="227.98844427299503" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1079" x1="252.14792188008627" y1="221.98844427299503" x2="252.14792188008627" y2="227.98844427299503" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1080" x1="315.18490235010785" y1="221.98844427299503" x2="315.18490235010785" y2="227.98844427299503" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1081" x1="378.2218828201294" y1="221.98844427299503" x2="378.2218828201294" y2="227.98844427299503" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1082" x1="441.25886329015094" y1="221.98844427299503" x2="441.25886329015094" y2="227.98844427299503" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1083" x1="504.2958437601725" y1="221.98844427299503" x2="504.2958437601725" y2="227.98844427299503" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1084" x1="567.3328242301941" y1="221.98844427299503" x2="567.3328242301941" y2="227.98844427299503" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1085" x1="630.3698047002157" y1="221.98844427299503" x2="630.3698047002157" y2="227.98844427299503" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1086" x1="693.4067851702373" y1="221.98844427299503" x2="693.4067851702373" y2="227.98844427299503" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <line id="SvgjsLine1087" x1="756.4437656402589" y1="221.98844427299503" x2="756.4437656402589" y2="227.98844427299503" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                        <g id="SvgjsG1071" class="apexcharts-grid">
                                            <g id="SvgjsG1072" class="apexcharts-gridlines-horizontal">
                                                <line id="SvgjsLine1089" x1="0" y1="36.99807404549917" x2="756.4437656402588" y2="36.99807404549917" stroke="#e5e7eb" stroke-dasharray="5" stroke-linecap="butt" class="apexcharts-gridline"></line>
                                                <line id="SvgjsLine1090" x1="0" y1="73.99614809099835" x2="756.4437656402588" y2="73.99614809099835" stroke="#e5e7eb" stroke-dasharray="5" stroke-linecap="butt" class="apexcharts-gridline"></line>
                                                <line id="SvgjsLine1091" x1="0" y1="110.99422213649751" x2="756.4437656402588" y2="110.99422213649751" stroke="#e5e7eb" stroke-dasharray="5" stroke-linecap="butt" class="apexcharts-gridline"></line>
                                                <line id="SvgjsLine1092" x1="0" y1="147.9922961819967" x2="756.4437656402588" y2="147.9922961819967" stroke="#e5e7eb" stroke-dasharray="5" stroke-linecap="butt" class="apexcharts-gridline"></line>
                                                <line id="SvgjsLine1093" x1="0" y1="184.99037022749587" x2="756.4437656402588" y2="184.99037022749587" stroke="#e5e7eb" stroke-dasharray="5" stroke-linecap="butt" class="apexcharts-gridline"></line>
                                                <line id="SvgjsLine1094" x1="0" y1="221.98844427299505" x2="756.4437656402588" y2="221.98844427299505" stroke="#e5e7eb" stroke-dasharray="5" stroke-linecap="butt" class="apexcharts-gridline"></line>
                                            </g>
                                            <g id="SvgjsG1073" class="apexcharts-gridlines-vertical"></g>
                                            <line id="SvgjsLine1096" x1="0" y1="221.98844427299503" x2="756.4437656402588" y2="221.98844427299503" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line>
                                            <line id="SvgjsLine1095" x1="0" y1="1" x2="0" y2="221.98844427299503" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line>
                                        </g>
                                        <g id="SvgjsG1074" class="apexcharts-grid-borders">
                                            <line id="SvgjsLine1088" x1="0" y1="0" x2="756.4437656402588" y2="0" stroke="#e5e7eb" stroke-dasharray="5" stroke-linecap="butt" class="apexcharts-gridline"></line>
                                            <line id="SvgjsLine1137" x1="0" y1="221.98844427299503" x2="756.4437656402588" y2="221.98844427299503" stroke="#e0e0e0" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt"></line>
                                        </g>
                                        <g id="SvgjsG1016" class="apexcharts-bar-series apexcharts-plot-series">
                                            <g id="SvgjsG1017" class="apexcharts-series" seriesName="Income" rel="1" data:realIndex="0">
                                                <path id="SvgjsPath1021" d="M9.455547070503236 221.98944427299503L9.455547070503236 152.99329618199667C9.455547070503236 150.49329618199667 11.955547070503236 147.99329618199667 14.455547070503236 147.99329618199667L48.58143339951833 147.99329618199667C51.08143339951833 147.99329618199667 53.58143339951833 150.49329618199667 53.58143339951833 152.99329618199667L53.58143339951833 221.98944427299503L9.455547070503236 221.98944427299503C9.455547070503236 221.98944427299503 9.455547070503236 221.98944427299503 9.455547070503236 221.98944427299503C9.455547070503236 221.98944427299503 9.455547070503236 221.98944427299503 9.455547070503236 221.98944427299503 " fill="rgba(255,111,40,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="0" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 9.455547070503236 221.98944427299503 L 9.455547070503236 152.99329618199667 C 9.455547070503236 150.49329618199667 11.955547070503236 147.99329618199667 14.455547070503236 147.99329618199667 L 48.58143339951833 147.99329618199667 C 51.08143339951833 147.99329618199667 53.58143339951833 150.49329618199667 53.58143339951833 152.99329618199667 L 53.58143339951833 221.98944427299503 z " pathFrom="M 9.455547070503236 221.98944427299503 L 9.455547070503236 221.98944427299503 L 53.58143339951833 221.98944427299503 L 53.58143339951833 221.98944427299503 L 53.58143339951833 221.98944427299503 L 53.58143339951833 221.98944427299503 L 53.58143339951833 221.98944427299503 L 9.455547070503236 221.98944427299503 z" cy="147.99229618199666" cx="72.4925275405248" j="0" val="40" barHeight="73.99614809099835" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1023" d="M72.4925275405248 221.98944427299503L72.4925275405248 171.49233320474627C72.4925275405248 168.99233320474627 74.9925275405248 166.49233320474627 77.4925275405248 166.49233320474627L111.61841386953989 166.49233320474627C114.11841386953989 166.49233320474627 116.61841386953989 168.99233320474627 116.61841386953989 171.49233320474627L116.61841386953989 221.98944427299503L72.4925275405248 221.98944427299503C72.4925275405248 221.98944427299503 72.4925275405248 221.98944427299503 72.4925275405248 221.98944427299503C72.4925275405248 221.98944427299503 72.4925275405248 221.98944427299503 72.4925275405248 221.98944427299503 " fill="rgba(255,111,40,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="0" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 72.4925275405248 221.98944427299503 L 72.4925275405248 171.49233320474627 C 72.4925275405248 168.99233320474627 74.9925275405248 166.49233320474627 77.4925275405248 166.49233320474627 L 111.61841386953989 166.49233320474627 C 114.11841386953989 166.49233320474627 116.61841386953989 168.99233320474627 116.61841386953989 171.49233320474627 L 116.61841386953989 221.98944427299503 z " pathFrom="M 72.4925275405248 221.98944427299503 L 72.4925275405248 221.98944427299503 L 116.61841386953989 221.98944427299503 L 116.61841386953989 221.98944427299503 L 116.61841386953989 221.98944427299503 L 116.61841386953989 221.98944427299503 L 116.61841386953989 221.98944427299503 L 72.4925275405248 221.98944427299503 z" cy="166.49133320474627" cx="135.52950801054638" j="1" val="30" barHeight="55.497111068248756" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1025" d="M135.52950801054638 221.98944427299503L135.52950801054638 143.74377767062188C135.52950801054638 141.24377767062188 138.02950801054638 138.74377767062188 140.52950801054638 138.74377767062188L174.65539433956147 138.74377767062188C177.15539433956147 138.74377767062188 179.65539433956147 141.24377767062188 179.65539433956147 143.74377767062188L179.65539433956147 221.98944427299503L135.52950801054638 221.98944427299503C135.52950801054638 221.98944427299503 135.52950801054638 221.98944427299503 135.52950801054638 221.98944427299503C135.52950801054638 221.98944427299503 135.52950801054638 221.98944427299503 135.52950801054638 221.98944427299503 " fill="rgba(255,111,40,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="0" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 135.52950801054638 221.98944427299503 L 135.52950801054638 143.74377767062188 C 135.52950801054638 141.24377767062188 138.02950801054638 138.74377767062188 140.52950801054638 138.74377767062188 L 174.65539433956147 138.74377767062188 C 177.15539433956147 138.74377767062188 179.65539433956147 141.24377767062188 179.65539433956147 143.74377767062188 L 179.65539433956147 221.98944427299503 z " pathFrom="M 135.52950801054638 221.98944427299503 L 135.52950801054638 221.98944427299503 L 179.65539433956147 221.98944427299503 L 179.65539433956147 221.98944427299503 L 179.65539433956147 221.98944427299503 L 179.65539433956147 221.98944427299503 L 179.65539433956147 221.98944427299503 L 135.52950801054638 221.98944427299503 z" cy="138.74277767062188" cx="198.56648848056795" j="2" val="45" barHeight="83.24566660237313" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1027" d="M198.56648848056795 221.98944427299503L198.56648848056795 78.99714809099834C198.56648848056795 76.49714809099834 201.06648848056795 73.99714809099834 203.56648848056795 73.99714809099834L237.69237480958304 73.99714809099834C240.19237480958304 73.99714809099834 242.69237480958304 76.49714809099834 242.69237480958304 78.99714809099834L242.69237480958304 221.98944427299503L198.56648848056795 221.98944427299503C198.56648848056795 221.98944427299503 198.56648848056795 221.98944427299503 198.56648848056795 221.98944427299503C198.56648848056795 221.98944427299503 198.56648848056795 221.98944427299503 198.56648848056795 221.98944427299503 " fill="rgba(255,111,40,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="0" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 198.56648848056795 221.98944427299503 L 198.56648848056795 78.99714809099834 C 198.56648848056795 76.49714809099834 201.06648848056795 73.99714809099834 203.56648848056795 73.99714809099834 L 237.69237480958304 73.99714809099834 C 240.19237480958304 73.99714809099834 242.69237480958304 76.49714809099834 242.69237480958304 78.99714809099834 L 242.69237480958304 221.98944427299503 z " pathFrom="M 198.56648848056795 221.98944427299503 L 198.56648848056795 221.98944427299503 L 242.69237480958304 221.98944427299503 L 242.69237480958304 221.98944427299503 L 242.69237480958304 221.98944427299503 L 242.69237480958304 221.98944427299503 L 242.69237480958304 221.98944427299503 L 198.56648848056795 221.98944427299503 z" cy="73.99614809099833" cx="261.6034689505895" j="3" val="80" barHeight="147.9922961819967" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1029" d="M261.6034689505895 221.98944427299503L261.6034689505895 69.74762957962355C261.6034689505895 67.24762957962355 264.1034689505895 64.74762957962355 266.6034689505895 64.74762957962355L300.7293552796046 64.74762957962355C303.2293552796046 64.74762957962355 305.7293552796046 67.24762957962355 305.7293552796046 69.74762957962355L305.7293552796046 221.98944427299503L261.6034689505895 221.98944427299503C261.6034689505895 221.98944427299503 261.6034689505895 221.98944427299503 261.6034689505895 221.98944427299503C261.6034689505895 221.98944427299503 261.6034689505895 221.98944427299503 261.6034689505895 221.98944427299503 " fill="rgba(255,111,40,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="0" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 261.6034689505895 221.98944427299503 L 261.6034689505895 69.74762957962355 C 261.6034689505895 67.24762957962355 264.1034689505895 64.74762957962355 266.6034689505895 64.74762957962355 L 300.7293552796046 64.74762957962355 C 303.2293552796046 64.74762957962355 305.7293552796046 67.24762957962355 305.7293552796046 69.74762957962355 L 305.7293552796046 221.98944427299503 z " pathFrom="M 261.6034689505895 221.98944427299503 L 261.6034689505895 221.98944427299503 L 305.7293552796046 221.98944427299503 L 305.7293552796046 221.98944427299503 L 305.7293552796046 221.98944427299503 L 305.7293552796046 221.98944427299503 L 305.7293552796046 221.98944427299503 L 261.6034689505895 221.98944427299503 z" cy="64.74662957962354" cx="324.64044942061105" j="4" val="85" barHeight="157.24181469337148" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1031" d="M324.64044942061105 221.98944427299503L324.64044942061105 60.49811106824876C324.64044942061105 57.99811106824876 327.14044942061105 55.49811106824876 329.64044942061105 55.49811106824876L363.76633574962614 55.49811106824876C366.26633574962614 55.49811106824876 368.76633574962614 57.99811106824876 368.76633574962614 60.49811106824876L368.76633574962614 221.98944427299503L324.64044942061105 221.98944427299503C324.64044942061105 221.98944427299503 324.64044942061105 221.98944427299503 324.64044942061105 221.98944427299503C324.64044942061105 221.98944427299503 324.64044942061105 221.98944427299503 324.64044942061105 221.98944427299503 " fill="rgba(255,111,40,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="0" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 324.64044942061105 221.98944427299503 L 324.64044942061105 60.498111068248754 C 324.64044942061105 57.998111068248754 327.14044942061105 55.498111068248754 329.64044942061105 55.498111068248754 L 363.76633574962614 55.498111068248754 C 366.26633574962614 55.498111068248754 368.76633574962614 57.998111068248754 368.76633574962614 60.498111068248754 L 368.76633574962614 221.98944427299503 z " pathFrom="M 324.64044942061105 221.98944427299503 L 324.64044942061105 221.98944427299503 L 368.76633574962614 221.98944427299503 L 368.76633574962614 221.98944427299503 L 368.76633574962614 221.98944427299503 L 368.76633574962614 221.98944427299503 L 368.76633574962614 221.98944427299503 L 324.64044942061105 221.98944427299503 z" cy="55.497111068248756" cx="387.6774298906326" j="5" val="90" barHeight="166.49133320474627" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1033" d="M387.6774298906326 221.98944427299503L387.6774298906326 78.99714809099834C387.6774298906326 76.49714809099834 390.1774298906326 73.99714809099834 392.6774298906326 73.99714809099834L426.8033162196477 73.99714809099834C429.3033162196477 73.99714809099834 431.8033162196477 76.49714809099834 431.8033162196477 78.99714809099834L431.8033162196477 221.98944427299503L387.6774298906326 221.98944427299503C387.6774298906326 221.98944427299503 387.6774298906326 221.98944427299503 387.6774298906326 221.98944427299503C387.6774298906326 221.98944427299503 387.6774298906326 221.98944427299503 387.6774298906326 221.98944427299503 " fill="rgba(255,111,40,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="0" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 387.6774298906326 221.98944427299503 L 387.6774298906326 78.99714809099834 C 387.6774298906326 76.49714809099834 390.1774298906326 73.99714809099834 392.6774298906326 73.99714809099834 L 426.8033162196477 73.99714809099834 C 429.3033162196477 73.99714809099834 431.8033162196477 76.49714809099834 431.8033162196477 78.99714809099834 L 431.8033162196477 221.98944427299503 z " pathFrom="M 387.6774298906326 221.98944427299503 L 387.6774298906326 221.98944427299503 L 431.8033162196477 221.98944427299503 L 431.8033162196477 221.98944427299503 L 431.8033162196477 221.98944427299503 L 431.8033162196477 221.98944427299503 L 431.8033162196477 221.98944427299503 L 387.6774298906326 221.98944427299503 z" cy="73.99614809099833" cx="450.71441036065414" j="6" val="80" barHeight="147.9922961819967" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1035" d="M450.71441036065414 221.98944427299503L450.71441036065414 78.99714809099834C450.71441036065414 76.49714809099834 453.21441036065414 73.99714809099834 455.71441036065414 73.99714809099834L489.84029668966923 73.99714809099834C492.34029668966923 73.99714809099834 494.84029668966923 76.49714809099834 494.84029668966923 78.99714809099834L494.84029668966923 221.98944427299503L450.71441036065414 221.98944427299503C450.71441036065414 221.98944427299503 450.71441036065414 221.98944427299503 450.71441036065414 221.98944427299503C450.71441036065414 221.98944427299503 450.71441036065414 221.98944427299503 450.71441036065414 221.98944427299503 " fill="rgba(255,111,40,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="0" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 450.71441036065414 221.98944427299503 L 450.71441036065414 78.99714809099834 C 450.71441036065414 76.49714809099834 453.21441036065414 73.99714809099834 455.71441036065414 73.99714809099834 L 489.84029668966923 73.99714809099834 C 492.34029668966923 73.99714809099834 494.84029668966923 76.49714809099834 494.84029668966923 78.99714809099834 L 494.84029668966923 221.98944427299503 z " pathFrom="M 450.71441036065414 221.98944427299503 L 450.71441036065414 221.98944427299503 L 494.84029668966923 221.98944427299503 L 494.84029668966923 221.98944427299503 L 494.84029668966923 221.98944427299503 L 494.84029668966923 221.98944427299503 L 494.84029668966923 221.98944427299503 L 450.71441036065414 221.98944427299503 z" cy="73.99614809099833" cx="513.7513908306757" j="7" val="80" barHeight="147.9922961819967" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1037" d="M513.7513908306757 221.98944427299503L513.7513908306757 78.99714809099834C513.7513908306757 76.49714809099834 516.2513908306757 73.99714809099834 518.7513908306757 73.99714809099834L552.8772771596908 73.99714809099834C555.3772771596908 73.99714809099834 557.8772771596908 76.49714809099834 557.8772771596908 78.99714809099834L557.8772771596908 221.98944427299503L513.7513908306757 221.98944427299503C513.7513908306757 221.98944427299503 513.7513908306757 221.98944427299503 513.7513908306757 221.98944427299503C513.7513908306757 221.98944427299503 513.7513908306757 221.98944427299503 513.7513908306757 221.98944427299503 " fill="rgba(255,111,40,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="0" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 513.7513908306757 221.98944427299503 L 513.7513908306757 78.99714809099834 C 513.7513908306757 76.49714809099834 516.2513908306757 73.99714809099834 518.7513908306757 73.99714809099834 L 552.8772771596908 73.99714809099834 C 555.3772771596908 73.99714809099834 557.8772771596908 76.49714809099834 557.8772771596908 78.99714809099834 L 557.8772771596908 221.98944427299503 z " pathFrom="M 513.7513908306757 221.98944427299503 L 513.7513908306757 221.98944427299503 L 557.8772771596908 221.98944427299503 L 557.8772771596908 221.98944427299503 L 557.8772771596908 221.98944427299503 L 557.8772771596908 221.98944427299503 L 557.8772771596908 221.98944427299503 L 513.7513908306757 221.98944427299503 z" cy="73.99614809099833" cx="576.7883713006973" j="8" val="80" barHeight="147.9922961819967" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1039" d="M576.7883713006973 221.98944427299503L576.7883713006973 69.74762957962355C576.7883713006973 67.24762957962355 579.2883713006973 64.74762957962355 581.7883713006973 64.74762957962355L615.9142576297124 64.74762957962355C618.4142576297124 64.74762957962355 620.9142576297124 67.24762957962355 620.9142576297124 69.74762957962355L620.9142576297124 221.98944427299503L576.7883713006973 221.98944427299503C576.7883713006973 221.98944427299503 576.7883713006973 221.98944427299503 576.7883713006973 221.98944427299503C576.7883713006973 221.98944427299503 576.7883713006973 221.98944427299503 576.7883713006973 221.98944427299503 " fill="rgba(255,111,40,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="0" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 576.7883713006973 221.98944427299503 L 576.7883713006973 69.74762957962355 C 576.7883713006973 67.24762957962355 579.2883713006973 64.74762957962355 581.7883713006973 64.74762957962355 L 615.9142576297124 64.74762957962355 C 618.4142576297124 64.74762957962355 620.9142576297124 67.24762957962355 620.9142576297124 69.74762957962355 L 620.9142576297124 221.98944427299503 z " pathFrom="M 576.7883713006973 221.98944427299503 L 576.7883713006973 221.98944427299503 L 620.9142576297124 221.98944427299503 L 620.9142576297124 221.98944427299503 L 620.9142576297124 221.98944427299503 L 620.9142576297124 221.98944427299503 L 620.9142576297124 221.98944427299503 L 576.7883713006973 221.98944427299503 z" cy="64.74662957962354" cx="639.825351770719" j="9" val="85" barHeight="157.24181469337148" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1041" d="M639.825351770719 221.98944427299503L639.825351770719 189.99137022749585C639.825351770719 187.49137022749585 642.325351770719 184.99137022749585 644.825351770719 184.99137022749585L678.951238099734 184.99137022749585C681.451238099734 184.99137022749585 683.951238099734 187.49137022749585 683.951238099734 189.99137022749585L683.951238099734 221.98944427299503L639.825351770719 221.98944427299503C639.825351770719 221.98944427299503 639.825351770719 221.98944427299503 639.825351770719 221.98944427299503C639.825351770719 221.98944427299503 639.825351770719 221.98944427299503 639.825351770719 221.98944427299503 " fill="rgba(255,111,40,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="0" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 639.825351770719 221.98944427299503 L 639.825351770719 189.99137022749585 C 639.825351770719 187.49137022749585 642.325351770719 184.99137022749585 644.825351770719 184.99137022749585 L 678.951238099734 184.99137022749585 C 681.451238099734 184.99137022749585 683.951238099734 187.49137022749585 683.951238099734 189.99137022749585 L 683.951238099734 221.98944427299503 z " pathFrom="M 639.825351770719 221.98944427299503 L 639.825351770719 221.98944427299503 L 683.951238099734 221.98944427299503 L 683.951238099734 221.98944427299503 L 683.951238099734 221.98944427299503 L 683.951238099734 221.98944427299503 L 683.951238099734 221.98944427299503 L 639.825351770719 221.98944427299503 z" cy="184.99037022749584" cx="702.8623322407406" j="10" val="20" barHeight="36.99807404549917" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1043" d="M702.8623322407406 221.98944427299503L702.8623322407406 78.99714809099834C702.8623322407406 76.49714809099834 705.3623322407406 73.99714809099834 707.8623322407406 73.99714809099834L741.9882185697556 73.99714809099834C744.4882185697556 73.99714809099834 746.9882185697556 76.49714809099834 746.9882185697556 78.99714809099834L746.9882185697556 221.98944427299503L702.8623322407406 221.98944427299503C702.8623322407406 221.98944427299503 702.8623322407406 221.98944427299503 702.8623322407406 221.98944427299503C702.8623322407406 221.98944427299503 702.8623322407406 221.98944427299503 702.8623322407406 221.98944427299503 " fill="rgba(255,111,40,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="0" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 702.8623322407406 221.98944427299503 L 702.8623322407406 78.99714809099834 C 702.8623322407406 76.49714809099834 705.3623322407406 73.99714809099834 707.8623322407406 73.99714809099834 L 741.9882185697556 73.99714809099834 C 744.4882185697556 73.99714809099834 746.9882185697556 76.49714809099834 746.9882185697556 78.99714809099834 L 746.9882185697556 221.98944427299503 z " pathFrom="M 702.8623322407406 221.98944427299503 L 702.8623322407406 221.98944427299503 L 746.9882185697556 221.98944427299503 L 746.9882185697556 221.98944427299503 L 746.9882185697556 221.98944427299503 L 746.9882185697556 221.98944427299503 L 746.9882185697556 221.98944427299503 L 702.8623322407406 221.98944427299503 z" cy="73.99614809099833" cx="765.8993127107622" j="11" val="80" barHeight="147.9922961819967" barWidth="44.125886329015096"></path>
                                                <g id="SvgjsG1019" class="apexcharts-bar-goals-markers">
                                                    <g id="SvgjsG1020" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1022" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1024" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1026" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1028" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1030" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1032" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1034" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1036" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1038" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1040" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1042" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                </g>
                                            </g>
                                            <g id="SvgjsG1044" class="apexcharts-series" seriesName="Expenses" rel="2" data:realIndex="1">
                                                <path id="SvgjsPath1048" d="M9.455547070503236 147.99429618199667L9.455547070503236 42.00007404549916C9.455547070503236 39.50007404549916 11.955547070503236 37.00007404549916 14.455547070503236 37.00007404549916L48.58143339951833 37.00007404549916C51.08143339951833 37.00007404549916 53.58143339951833 39.50007404549916 53.58143339951833 42.00007404549916L53.58143339951833 147.99429618199667L9.455547070503236 147.99429618199667C9.455547070503236 147.99429618199667 9.455547070503236 147.99429618199667 9.455547070503236 147.99429618199667C9.455547070503236 147.99429618199667 9.455547070503236 147.99429618199667 9.455547070503236 147.99429618199667 " fill="rgba(248,249,250,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="1" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 9.455547070503236 147.99429618199667 L 9.455547070503236 42.000074045499154 C 9.455547070503236 39.500074045499154 11.955547070503236 37.000074045499154 14.455547070503236 37.000074045499154 L 48.58143339951833 37.000074045499154 C 51.08143339951833 37.000074045499154 53.58143339951833 39.500074045499154 53.58143339951833 42.000074045499154 L 53.58143339951833 147.99429618199667 z " pathFrom="M 9.455547070503236 147.99429618199667 L 9.455547070503236 147.99429618199667 L 53.58143339951833 147.99429618199667 L 53.58143339951833 147.99429618199667 L 53.58143339951833 147.99429618199667 L 53.58143339951833 147.99429618199667 L 53.58143339951833 147.99429618199667 L 9.455547070503236 147.99429618199667 z" cy="36.99907404549916" cx="72.4925275405248" j="0" val="60" barHeight="110.99422213649751" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1050" d="M72.4925275405248 166.49333320474628L72.4925275405248 42.00007404549916C72.4925275405248 39.50007404549916 74.9925275405248 37.00007404549916 77.4925275405248 37.00007404549916L111.61841386953989 37.00007404549916C114.11841386953989 37.00007404549916 116.61841386953989 39.50007404549916 116.61841386953989 42.00007404549916L116.61841386953989 166.49333320474628L72.4925275405248 166.49333320474628C72.4925275405248 166.49333320474628 72.4925275405248 166.49333320474628 72.4925275405248 166.49333320474628C72.4925275405248 166.49333320474628 72.4925275405248 166.49333320474628 72.4925275405248 166.49333320474628 " fill="rgba(248,249,250,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="1" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 72.4925275405248 166.49333320474628 L 72.4925275405248 42.000074045499154 C 72.4925275405248 39.500074045499154 74.9925275405248 37.000074045499154 77.4925275405248 37.000074045499154 L 111.61841386953989 37.000074045499154 C 114.11841386953989 37.000074045499154 116.61841386953989 39.500074045499154 116.61841386953989 42.000074045499154 L 116.61841386953989 166.49333320474628 z " pathFrom="M 72.4925275405248 166.49333320474628 L 72.4925275405248 166.49333320474628 L 116.61841386953989 166.49333320474628 L 116.61841386953989 166.49333320474628 L 116.61841386953989 166.49333320474628 L 116.61841386953989 166.49333320474628 L 116.61841386953989 166.49333320474628 L 72.4925275405248 166.49333320474628 z" cy="36.99907404549916" cx="135.52950801054638" j="1" val="70" barHeight="129.49325915924712" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1052" d="M135.52950801054638 138.7447776706219L135.52950801054638 42.00007404549916C135.52950801054638 39.50007404549916 138.02950801054638 37.00007404549916 140.52950801054638 37.00007404549916L174.65539433956147 37.00007404549916C177.15539433956147 37.00007404549916 179.65539433956147 39.50007404549916 179.65539433956147 42.00007404549916L179.65539433956147 138.7447776706219L135.52950801054638 138.7447776706219C135.52950801054638 138.7447776706219 135.52950801054638 138.7447776706219 135.52950801054638 138.7447776706219C135.52950801054638 138.7447776706219 135.52950801054638 138.7447776706219 135.52950801054638 138.7447776706219 " fill="rgba(248,249,250,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="1" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 135.52950801054638 138.7447776706219 L 135.52950801054638 42.000074045499154 C 135.52950801054638 39.500074045499154 138.02950801054638 37.000074045499154 140.52950801054638 37.000074045499154 L 174.65539433956147 37.000074045499154 C 177.15539433956147 37.000074045499154 179.65539433956147 39.500074045499154 179.65539433956147 42.000074045499154 L 179.65539433956147 138.7447776706219 z " pathFrom="M 135.52950801054638 138.7447776706219 L 135.52950801054638 138.7447776706219 L 179.65539433956147 138.7447776706219 L 179.65539433956147 138.7447776706219 L 179.65539433956147 138.7447776706219 L 179.65539433956147 138.7447776706219 L 179.65539433956147 138.7447776706219 L 135.52950801054638 138.7447776706219 z" cy="36.99907404549916" cx="198.56648848056795" j="2" val="55" barHeight="101.74470362512272" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1054" d="M198.56648848056795 73.99814809099834L198.56648848056795 42.00007404549916C198.56648848056795 39.50007404549916 201.06648848056795 37.00007404549916 203.56648848056795 37.00007404549916L237.69237480958304 37.00007404549916C240.19237480958304 37.00007404549916 242.69237480958304 39.50007404549916 242.69237480958304 42.00007404549916L242.69237480958304 73.99814809099834L198.56648848056795 73.99814809099834C198.56648848056795 73.99814809099834 198.56648848056795 73.99814809099834 198.56648848056795 73.99814809099834C198.56648848056795 73.99814809099834 198.56648848056795 73.99814809099834 198.56648848056795 73.99814809099834 " fill="rgba(248,249,250,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="1" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 198.56648848056795 73.99814809099834 L 198.56648848056795 42.00007404549916 C 198.56648848056795 39.50007404549916 201.06648848056795 37.00007404549916 203.56648848056795 37.00007404549916 L 237.69237480958304 37.00007404549916 C 240.19237480958304 37.00007404549916 242.69237480958304 39.50007404549916 242.69237480958304 42.00007404549916 L 242.69237480958304 73.99814809099834 z " pathFrom="M 198.56648848056795 73.99814809099834 L 198.56648848056795 73.99814809099834 L 242.69237480958304 73.99814809099834 L 242.69237480958304 73.99814809099834 L 242.69237480958304 73.99814809099834 L 242.69237480958304 73.99814809099834 L 242.69237480958304 73.99814809099834 L 198.56648848056795 73.99814809099834 z" cy="36.999074045499164" cx="261.6034689505895" j="3" val="20" barHeight="36.99807404549917" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1056" d="M261.6034689505895 64.74862957962355L261.6034689505895 42.00007404549917C261.6034689505895 39.50007404549917 264.1034689505895 37.00007404549917 266.6034689505895 37.00007404549917L300.7293552796046 37.00007404549917C303.2293552796046 37.00007404549917 305.7293552796046 39.50007404549917 305.7293552796046 42.00007404549917L305.7293552796046 64.74862957962355L261.6034689505895 64.74862957962355C261.6034689505895 64.74862957962355 261.6034689505895 64.74862957962355 261.6034689505895 64.74862957962355C261.6034689505895 64.74862957962355 261.6034689505895 64.74862957962355 261.6034689505895 64.74862957962355 " fill="rgba(248,249,250,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="1" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 261.6034689505895 64.74862957962355 L 261.6034689505895 42.00007404549917 C 261.6034689505895 39.50007404549917 264.1034689505895 37.00007404549917 266.6034689505895 37.00007404549917 L 300.7293552796046 37.00007404549917 C 303.2293552796046 37.00007404549917 305.7293552796046 39.50007404549917 305.7293552796046 42.00007404549917 L 305.7293552796046 64.74862957962355 z " pathFrom="M 261.6034689505895 64.74862957962355 L 261.6034689505895 64.74862957962355 L 305.7293552796046 64.74862957962355 L 305.7293552796046 64.74862957962355 L 305.7293552796046 64.74862957962355 L 305.7293552796046 64.74862957962355 L 305.7293552796046 64.74862957962355 L 261.6034689505895 64.74862957962355 z" cy="36.99907404549917" cx="324.64044942061105" j="4" val="15" barHeight="27.748555534124378" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1058" d="M324.64044942061105 55.49911106824875L324.64044942061105 42.00007404549917C324.64044942061105 39.50007404549917 327.14044942061105 37.00007404549917 329.64044942061105 37.00007404549917L363.76633574962614 37.00007404549917C366.26633574962614 37.00007404549917 368.76633574962614 39.50007404549917 368.76633574962614 42.00007404549917L368.76633574962614 55.49911106824875L324.64044942061105 55.49911106824875C324.64044942061105 55.49911106824875 324.64044942061105 55.49911106824875 324.64044942061105 55.49911106824875C324.64044942061105 55.49911106824875 324.64044942061105 55.49911106824875 324.64044942061105 55.49911106824875 " fill="rgba(248,249,250,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="1" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 324.64044942061105 55.49911106824875 L 324.64044942061105 42.00007404549917 C 324.64044942061105 39.50007404549917 327.14044942061105 37.00007404549917 329.64044942061105 37.00007404549917 L 363.76633574962614 37.00007404549917 C 366.26633574962614 37.00007404549917 368.76633574962614 39.50007404549917 368.76633574962614 42.00007404549917 L 368.76633574962614 55.49911106824875 z " pathFrom="M 324.64044942061105 55.49911106824875 L 324.64044942061105 55.49911106824875 L 368.76633574962614 55.49911106824875 L 368.76633574962614 55.49911106824875 L 368.76633574962614 55.49911106824875 L 368.76633574962614 55.49911106824875 L 368.76633574962614 55.49911106824875 L 324.64044942061105 55.49911106824875 z" cy="36.99907404549917" cx="387.6774298906326" j="5" val="10" barHeight="18.499037022749587" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1060" d="M387.6774298906326 73.99814809099834L387.6774298906326 42.00007404549916C387.6774298906326 39.50007404549916 390.1774298906326 37.00007404549916 392.6774298906326 37.00007404549916L426.8033162196477 37.00007404549916C429.3033162196477 37.00007404549916 431.8033162196477 39.50007404549916 431.8033162196477 42.00007404549916L431.8033162196477 73.99814809099834L387.6774298906326 73.99814809099834C387.6774298906326 73.99814809099834 387.6774298906326 73.99814809099834 387.6774298906326 73.99814809099834C387.6774298906326 73.99814809099834 387.6774298906326 73.99814809099834 387.6774298906326 73.99814809099834 " fill="rgba(248,249,250,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="1" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 387.6774298906326 73.99814809099834 L 387.6774298906326 42.00007404549916 C 387.6774298906326 39.50007404549916 390.1774298906326 37.00007404549916 392.6774298906326 37.00007404549916 L 426.8033162196477 37.00007404549916 C 429.3033162196477 37.00007404549916 431.8033162196477 39.50007404549916 431.8033162196477 42.00007404549916 L 431.8033162196477 73.99814809099834 z " pathFrom="M 387.6774298906326 73.99814809099834 L 387.6774298906326 73.99814809099834 L 431.8033162196477 73.99814809099834 L 431.8033162196477 73.99814809099834 L 431.8033162196477 73.99814809099834 L 431.8033162196477 73.99814809099834 L 431.8033162196477 73.99814809099834 L 387.6774298906326 73.99814809099834 z" cy="36.999074045499164" cx="450.71441036065414" j="6" val="20" barHeight="36.99807404549917" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1062" d="M450.71441036065414 73.99814809099834L450.71441036065414 42.00007404549916C450.71441036065414 39.50007404549916 453.21441036065414 37.00007404549916 455.71441036065414 37.00007404549916L489.84029668966923 37.00007404549916C492.34029668966923 37.00007404549916 494.84029668966923 39.50007404549916 494.84029668966923 42.00007404549916L494.84029668966923 73.99814809099834L450.71441036065414 73.99814809099834C450.71441036065414 73.99814809099834 450.71441036065414 73.99814809099834 450.71441036065414 73.99814809099834C450.71441036065414 73.99814809099834 450.71441036065414 73.99814809099834 450.71441036065414 73.99814809099834 " fill="rgba(248,249,250,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="1" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 450.71441036065414 73.99814809099834 L 450.71441036065414 42.00007404549916 C 450.71441036065414 39.50007404549916 453.21441036065414 37.00007404549916 455.71441036065414 37.00007404549916 L 489.84029668966923 37.00007404549916 C 492.34029668966923 37.00007404549916 494.84029668966923 39.50007404549916 494.84029668966923 42.00007404549916 L 494.84029668966923 73.99814809099834 z " pathFrom="M 450.71441036065414 73.99814809099834 L 450.71441036065414 73.99814809099834 L 494.84029668966923 73.99814809099834 L 494.84029668966923 73.99814809099834 L 494.84029668966923 73.99814809099834 L 494.84029668966923 73.99814809099834 L 494.84029668966923 73.99814809099834 L 450.71441036065414 73.99814809099834 z" cy="36.999074045499164" cx="513.7513908306757" j="7" val="20" barHeight="36.99807404549917" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1064" d="M513.7513908306757 73.99814809099834L513.7513908306757 42.00007404549916C513.7513908306757 39.50007404549916 516.2513908306757 37.00007404549916 518.7513908306757 37.00007404549916L552.8772771596908 37.00007404549916C555.3772771596908 37.00007404549916 557.8772771596908 39.50007404549916 557.8772771596908 42.00007404549916L557.8772771596908 73.99814809099834L513.7513908306757 73.99814809099834C513.7513908306757 73.99814809099834 513.7513908306757 73.99814809099834 513.7513908306757 73.99814809099834C513.7513908306757 73.99814809099834 513.7513908306757 73.99814809099834 513.7513908306757 73.99814809099834 " fill="rgba(248,249,250,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="1" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 513.7513908306757 73.99814809099834 L 513.7513908306757 42.00007404549916 C 513.7513908306757 39.50007404549916 516.2513908306757 37.00007404549916 518.7513908306757 37.00007404549916 L 552.8772771596908 37.00007404549916 C 555.3772771596908 37.00007404549916 557.8772771596908 39.50007404549916 557.8772771596908 42.00007404549916 L 557.8772771596908 73.99814809099834 z " pathFrom="M 513.7513908306757 73.99814809099834 L 513.7513908306757 73.99814809099834 L 557.8772771596908 73.99814809099834 L 557.8772771596908 73.99814809099834 L 557.8772771596908 73.99814809099834 L 557.8772771596908 73.99814809099834 L 557.8772771596908 73.99814809099834 L 513.7513908306757 73.99814809099834 z" cy="36.999074045499164" cx="576.7883713006973" j="8" val="20" barHeight="36.99807404549917" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1066" d="M576.7883713006973 64.74862957962355L576.7883713006973 42.00007404549917C576.7883713006973 39.50007404549917 579.2883713006973 37.00007404549917 581.7883713006973 37.00007404549917L615.9142576297124 37.00007404549917C618.4142576297124 37.00007404549917 620.9142576297124 39.50007404549917 620.9142576297124 42.00007404549917L620.9142576297124 64.74862957962355L576.7883713006973 64.74862957962355C576.7883713006973 64.74862957962355 576.7883713006973 64.74862957962355 576.7883713006973 64.74862957962355C576.7883713006973 64.74862957962355 576.7883713006973 64.74862957962355 576.7883713006973 64.74862957962355 " fill="rgba(248,249,250,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="1" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 576.7883713006973 64.74862957962355 L 576.7883713006973 42.00007404549917 C 576.7883713006973 39.50007404549917 579.2883713006973 37.00007404549917 581.7883713006973 37.00007404549917 L 615.9142576297124 37.00007404549917 C 618.4142576297124 37.00007404549917 620.9142576297124 39.50007404549917 620.9142576297124 42.00007404549917 L 620.9142576297124 64.74862957962355 z " pathFrom="M 576.7883713006973 64.74862957962355 L 576.7883713006973 64.74862957962355 L 620.9142576297124 64.74862957962355 L 620.9142576297124 64.74862957962355 L 620.9142576297124 64.74862957962355 L 620.9142576297124 64.74862957962355 L 620.9142576297124 64.74862957962355 L 576.7883713006973 64.74862957962355 z" cy="36.99907404549917" cx="639.825351770719" j="9" val="15" barHeight="27.748555534124378" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1068" d="M639.825351770719 184.99237022749585L639.825351770719 42.00007404549916C639.825351770719 39.50007404549916 642.325351770719 37.00007404549916 644.825351770719 37.00007404549916L678.951238099734 37.00007404549916C681.451238099734 37.00007404549916 683.951238099734 39.50007404549916 683.951238099734 42.00007404549916L683.951238099734 184.99237022749585L639.825351770719 184.99237022749585C639.825351770719 184.99237022749585 639.825351770719 184.99237022749585 639.825351770719 184.99237022749585C639.825351770719 184.99237022749585 639.825351770719 184.99237022749585 639.825351770719 184.99237022749585 " fill="rgba(248,249,250,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="1" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 639.825351770719 184.99237022749585 L 639.825351770719 42.000074045499154 C 639.825351770719 39.500074045499154 642.325351770719 37.000074045499154 644.825351770719 37.000074045499154 L 678.951238099734 37.000074045499154 C 681.451238099734 37.000074045499154 683.951238099734 39.500074045499154 683.951238099734 42.000074045499154 L 683.951238099734 184.99237022749585 z " pathFrom="M 639.825351770719 184.99237022749585 L 639.825351770719 184.99237022749585 L 683.951238099734 184.99237022749585 L 683.951238099734 184.99237022749585 L 683.951238099734 184.99237022749585 L 683.951238099734 184.99237022749585 L 683.951238099734 184.99237022749585 L 639.825351770719 184.99237022749585 z" cy="36.99907404549916" cx="702.8623322407406" j="10" val="80" barHeight="147.9922961819967" barWidth="44.125886329015096"></path>
                                                <path id="SvgjsPath1070" d="M702.8623322407406 73.99814809099834L702.8623322407406 42.00007404549916C702.8623322407406 39.50007404549916 705.3623322407406 37.00007404549916 707.8623322407406 37.00007404549916L741.9882185697556 37.00007404549916C744.4882185697556 37.00007404549916 746.9882185697556 39.50007404549916 746.9882185697556 42.00007404549916L746.9882185697556 73.99814809099834L702.8623322407406 73.99814809099834C702.8623322407406 73.99814809099834 702.8623322407406 73.99814809099834 702.8623322407406 73.99814809099834C702.8623322407406 73.99814809099834 702.8623322407406 73.99814809099834 702.8623322407406 73.99814809099834 " fill="rgba(248,249,250,1)" fill-opacity="1" stroke-opacity="1" stroke-linecap="round" stroke-width="0" stroke-dasharray="0" class="apexcharts-bar-area " index="1" clip-path="url(#gridRectBarMasky9rviavhg)" pathTo="M 702.8623322407406 73.99814809099834 L 702.8623322407406 42.00007404549916 C 702.8623322407406 39.50007404549916 705.3623322407406 37.00007404549916 707.8623322407406 37.00007404549916 L 741.9882185697556 37.00007404549916 C 744.4882185697556 37.00007404549916 746.9882185697556 39.50007404549916 746.9882185697556 42.00007404549916 L 746.9882185697556 73.99814809099834 z " pathFrom="M 702.8623322407406 73.99814809099834 L 702.8623322407406 73.99814809099834 L 746.9882185697556 73.99814809099834 L 746.9882185697556 73.99814809099834 L 746.9882185697556 73.99814809099834 L 746.9882185697556 73.99814809099834 L 746.9882185697556 73.99814809099834 L 702.8623322407406 73.99814809099834 z" cy="36.999074045499164" cx="765.8993127107622" j="11" val="20" barHeight="36.99807404549917" barWidth="44.125886329015096"></path>
                                                <g id="SvgjsG1046" class="apexcharts-bar-goals-markers">
                                                    <g id="SvgjsG1047" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1049" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1051" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1053" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1055" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1057" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1059" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1061" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1063" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1065" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1067" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                    <g id="SvgjsG1069" className="apexcharts-bar-goals-groups" class="apexcharts-hidden-element-shown" clip-path="url(#gridRectMarkerMasky9rviavhg)"></g>
                                                </g>
                                            </g>
                                            <g id="SvgjsG1018" class="apexcharts-datalabels" data:realIndex="0"></g>
                                            <g id="SvgjsG1045" class="apexcharts-datalabels" data:realIndex="1"></g>
                                        </g>
                                        <line id="SvgjsLine1097" x1="0" y1="0" x2="756.4437656402588" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line>
                                        <line id="SvgjsLine1098" x1="0" y1="0" x2="756.4437656402588" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line>
                                        <g id="SvgjsG1099" class="apexcharts-xaxis" transform="translate(0, 0)">
                                            <g id="SvgjsG1100" class="apexcharts-xaxis-texts-g" transform="translate(0, -4)">
                                                <text id="SvgjsText1102" font-family="Helvetica, Arial, sans-serif" x="31.518490235010784" y="249.98844427299503" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1103">Jan</tspan>
                                                    <title>Jan</title></text>
                                                <text id="SvgjsText1105" font-family="Helvetica, Arial, sans-serif" x="94.55547070503235" y="249.98844427299503" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1106">Feb</tspan>
                                                    <title>Feb</title></text>
                                                <text id="SvgjsText1108" font-family="Helvetica, Arial, sans-serif" x="157.59245117505392" y="249.98844427299503" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1109">Mar</tspan>
                                                    <title>Mar</title></text>
                                                <text id="SvgjsText1111" font-family="Helvetica, Arial, sans-serif" x="220.6294316450755" y="249.98844427299503" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1112">Apr</tspan>
                                                    <title>Apr</title></text>
                                                <text id="SvgjsText1114" font-family="Helvetica, Arial, sans-serif" x="283.66641211509705" y="249.98844427299503" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1115">May</tspan>
                                                    <title>May</title></text>
                                                <text id="SvgjsText1117" font-family="Helvetica, Arial, sans-serif" x="346.7033925851186" y="249.98844427299503" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1118">Jun</tspan>
                                                    <title>Jun</title></text>
                                                <text id="SvgjsText1120" font-family="Helvetica, Arial, sans-serif" x="409.74037305514014" y="249.98844427299503" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1121">Jul</tspan>
                                                    <title>Jul</title></text>
                                                <text id="SvgjsText1123" font-family="Helvetica, Arial, sans-serif" x="472.7773535251617" y="249.98844427299503" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1124">Aug</tspan>
                                                    <title>Aug</title></text>
                                                <text id="SvgjsText1126" font-family="Helvetica, Arial, sans-serif" x="535.8143339951833" y="249.98844427299503" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1127">Sep</tspan>
                                                    <title>Sep</title></text>
                                                <text id="SvgjsText1129" font-family="Helvetica, Arial, sans-serif" x="598.851314465205" y="249.98844427299503" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1130">Oct</tspan>
                                                    <title>Oct</title></text>
                                                <text id="SvgjsText1132" font-family="Helvetica, Arial, sans-serif" x="661.8882949352266" y="249.98844427299503" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1133">Nov</tspan>
                                                    <title>Nov</title></text>
                                                <text id="SvgjsText1135" font-family="Helvetica, Arial, sans-serif" x="724.9252754052482" y="249.98844427299503" text-anchor="middle" dominant-baseline="auto" font-size="13px" font-weight="400" fill="#6b7280" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                    <tspan id="SvgjsTspan1136">Dec</tspan>
                                                    <title>Dec</title></text>
                                            </g>
                                        </g>
                                        <g id="SvgjsG1161" class="apexcharts-yaxis-annotations apexcharts-hidden-element-shown"></g>
                                        <g id="SvgjsG1162" class="apexcharts-xaxis-annotations apexcharts-hidden-element-shown"></g>
                                        <g id="SvgjsG1163" class="apexcharts-point-annotations apexcharts-hidden-element-shown"></g>
                                    </g></svg><div class="apexcharts-tooltip apexcharts-theme-light">
                                        <div class="apexcharts-tooltip-title" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div>
                                        <div class="apexcharts-tooltip-series-group apexcharts-tooltip-series-group-0" style="order: 1;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(255, 111, 40);"></span>
                                            <div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
                                                <div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div>
                                                <div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div>
                                                <div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div>
                                            </div>
                                        </div>
                                        <div class="apexcharts-tooltip-series-group apexcharts-tooltip-series-group-1" style="order: 2;"><span class="apexcharts-tooltip-marker" style="background-color: rgb(248, 249, 250);"></span>
                                            <div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
                                                <div class="apexcharts-tooltip-y-group"><span class="apexcharts-tooltip-text-y-label"></span><span class="apexcharts-tooltip-text-y-value"></span></div>
                                                <div class="apexcharts-tooltip-goals-group"><span class="apexcharts-tooltip-text-goals-label"></span><span class="apexcharts-tooltip-text-goals-value"></span></div>
                                                <div class="apexcharts-tooltip-z-group"><span class="apexcharts-tooltip-text-z-label"></span><span class="apexcharts-tooltip-text-z-value"></span></div>
                                            </div>
                                        </div>
                                    </div>
                                <div class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light">
                                    <div class="apexcharts-yaxistooltip-text"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Sales Overview -->
            <!-- Invoices -->
            <div class="col-xl-5 d-flex">
                <div class="card flex-fill">
                    <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                        <h5 class="mb-2">Invoices</h5>
                        <div class="d-flex align-items-center">
                            <div class="dropdown mb-2">
                                <a href="javascript:void(0);" class="dropdown-toggle btn btn-white btn-sm d-inline-flex align-items-center fs-13 me-2 border-0" data-bs-toggle="dropdown">Invoices
                                </a>
                                <ul class="dropdown-menu  dropdown-menu-end p-3">
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">Invoices</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">Paid</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">Unpaid</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="dropdown mb-2">
                                <a href="javascript:void(0);" class="btn btn-white border btn-sm d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                    <i class="ti ti-calendar me-1"></i>This Week
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
                        </div>
                    </div>
                    <div class="card-body pt-2">
                        <div class="table-responsive pt-1">
                            <table class="table table-nowrap table-borderless mb-0">
                                <tbody>
                                    <tr>
                                        <td class="px-0">
                                            <div class="d-flex align-items-center">
                                                <a href="invoice-details.html" class="avatar">
                                                    <img src="assets/img/users/user-39.jpg" class="img-fluid rounded-circle" alt="img">
                                                </a>
                                                <div class="ms-2">
                                                    <h6 class="fw-medium"><a href="invoice-details.html">Redesign Website</a></h6>
                                                    <span class="fs-13 d-inline-flex align-items-center">#INVOO2<i class="ti ti-circle-filled fs-4 mx-1 text-primary"></i>Logistics</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="fs-13 mb-1">Payment</p>
                                            <h6 class="fw-medium">$3560</h6>
                                        </td>
                                        <td class="px-0 text-end">
                                            <span class="badge badge-danger-transparent badge-xs d-inline-flex align-items-center"><i class="ti ti-circle-filled fs-5 me-1"></i>Unpaid</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="px-0">
                                            <div class="d-flex align-items-center">
                                                <a href="invoice-details.html" class="avatar">
                                                    <img src="assets/img/users/user-40.jpg" class="img-fluid rounded-circle" alt="img">
                                                </a>
                                                <div class="ms-2">
                                                    <h6 class="fw-medium"><a href="invoice-details.html">Module Completion</a></h6>
                                                    <span class="fs-13 d-inline-flex align-items-center">#INVOO5<i class="ti ti-circle-filled fs-4 mx-1 text-primary"></i>Yip Corp</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="fs-13 mb-1">Payment</p>
                                            <h6 class="fw-medium">$4175</h6>
                                        </td>
                                        <td class="px-0 text-end">
                                            <span class="badge badge-danger-transparent badge-xs d-inline-flex align-items-center"><i class="ti ti-circle-filled fs-5 me-1"></i>Unpaid</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="px-0">
                                            <div class="d-flex align-items-center">
                                                <a href="invoice-details.html" class="avatar">
                                                    <img src="assets/img/users/user-55.jpg" class="img-fluid rounded-circle" alt="img">
                                                </a>
                                                <div class="ms-2">
                                                    <h6 class="fw-medium"><a href="invoice-details.html">Change on Emp Module</a></h6>
                                                    <span class="fs-13 d-inline-flex align-items-center">#INVOO3<i class="ti ti-circle-filled fs-4 mx-1 text-primary"></i>Ignis LLP</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="fs-13 mb-1">Payment</p>
                                            <h6 class="fw-medium">$6985</h6>
                                        </td>
                                        <td class="px-0 text-end">
                                            <span class="badge badge-danger-transparent badge-xs d-inline-flex align-items-center"><i class="ti ti-circle-filled fs-5 me-1"></i>Unpaid</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="px-0">
                                            <div class="d-flex align-items-center">
                                                <a href="invoice-details.html" class="avatar">
                                                    <img src="assets/img/users/user-42.jpg" class="img-fluid rounded-circle" alt="img">
                                                </a>
                                                <div class="ms-2">
                                                    <h6 class="fw-medium"><a href="invoice-details.html">Changes on the Board</a></h6>
                                                    <span class="fs-13 d-inline-flex align-items-center">#INVOO2<i class="ti ti-circle-filled fs-4 mx-1 text-primary"></i>Ignis LLP</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="fs-13 mb-1">Payment</p>
                                            <h6 class="fw-medium">$1457</h6>
                                        </td>
                                        <td class="px-0 text-end">
                                            <span class="badge badge-danger-transparent badge-xs d-inline-flex align-items-center"><i class="ti ti-circle-filled fs-5 me-1"></i>Unpaid</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="px-0">
                                            <div class="d-flex align-items-center">
                                                <a href="invoice-details.html" class="avatar">
                                                    <img src="assets/img/users/user-44.jpg" class="img-fluid rounded-circle" alt="img">
                                                </a>
                                                <div class="ms-2">
                                                    <h6 class="fw-medium"><a href="invoice-details.html">Hospital Management</a></h6>
                                                    <span class="fs-13 d-inline-flex align-items-center">#INVOO6<i class="ti ti-circle-filled fs-4 mx-1 text-primary"></i>HCL Corp</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="fs-13 mb-1">Payment</p>
                                            <h6 class="fw-medium">$6458</h6>
                                        </td>
                                        <td class="px-0 text-end">
                                            <span class="badge badge-success-transparent badge-xs d-inline-flex align-items-center"><i class="ti ti-circle-filled fs-5 me-1"></i>Paid</span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <a href="invoice.html" class="btn btn-light btn-md w-100 mt-2">View All</a>
                    </div>
                </div>
            </div>
            <!-- /Invoices -->

        </div>

        <div class="row">

            <!-- Projects -->
            <div class="col-xxl-8 col-xl-7 d-flex">
                <div class="card flex-fill">
                    <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                        <h5 class="mb-2">Projects</h5>
                        <div class="d-flex align-items-center">
                        </div>
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
                                    <tr>
                                        <td>26</td>
                                        <td>School Management</td>
                                        <td>
                                            <div class="avatar-list-stacked avatar-group-sm">
                                            </div>
                                        </td>
                                        <td>31/12/2026</td>
                                        <td>
                                            <span class="badge badge-success-transparent">
                                                <i class="ti ti-point-filled me-1"></i>Low
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>22</td>
                                        <td>HRMS System</td>
                                        <td>
                                            <div class="avatar-list-stacked avatar-group-sm">
                                            </div>
                                        </td>
                                        <td>31/12/2025</td>
                                        <td>
                                            <span class="badge badge-danger-transparent">
                                                <i class="ti ti-point-filled me-1"></i>High
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>24</td>
                                        <td>CRM System</td>
                                        <td>
                                            <div class="avatar-list-stacked avatar-group-sm">
                                            </div>
                                        </td>
                                        <td>30/06/2025</td>
                                        <td>
                                            <span class="badge badge-warning-transparent">
                                                <i class="ti ti-point-filled me-1"></i>Medium
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>23</td>
                                        <td>ERP System</td>
                                        <td>
                                            <div class="avatar-list-stacked avatar-group-sm">
                                            </div>
                                        </td>
                                        <td>31/05/2025</td>
                                        <td>
                                            <span class="badge badge-danger-transparent">
                                                <i class="ti ti-point-filled me-1"></i>High
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>25</td>
                                        <td>Inventory System</td>
                                        <td>
                                            <div class="avatar-list-stacked avatar-group-sm">
                                            </div>
                                        </td>
                                        <td>31/03/2025</td>
                                        <td>
                                            <span class="badge badge-warning-transparent">
                                                <i class="ti ti-point-filled me-1"></i>Medium
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>19</td>
                                        <td>EduWave</td>
                                        <td>
                                            <div class="avatar-list-stacked avatar-group-sm">

                                                <span class="avatar border-0">
                                                    <img src="/Content/uploads/IMG_20230714_114721.jpg" alt="Profile Picture" width="40" height="40" style="border-radius: 50%;">
                                                </span>
                                                <span class="avatar border-0">
                                                    <img src="/Content/uploads/photo.jpeg" alt="Profile Picture" width="40" height="40" style="border-radius: 50%;">
                                                </span>
                                                <span class="avatar border-0">
                                                    <img src="/Content/uploads/stamp.jpg" alt="Profile Picture" width="40" height="40" style="border-radius: 50%;">
                                                </span>
                                            </div>
                                        </td>
                                        <td>20/03/2025</td>
                                        <td>
                                            <span class="badge badge-danger-transparent">
                                                <i class="ti ti-point-filled me-1"></i>High
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>18</td>
                                        <td>Estate</td>
                                        <td>
                                            <div class="avatar-list-stacked avatar-group-sm">

                                                <span class="avatar border-0">
                                                    <img src="/Content/uploads/photo.jpeg" alt="Profile Picture" width="40" height="40" style="border-radius: 50%;">
                                                </span>
                                                <span class="avatar border-0">
                                                    <img src="/Content/uploads/stamp.jpg" alt="Profile Picture" width="40" height="40" style="border-radius: 50%;">
                                                </span>
                                            </div>
                                        </td>
                                        <td>13/03/2025</td>
                                        <td>
                                            <span class="badge badge-danger-transparent">
                                                <i class="ti ti-point-filled me-1"></i>High
                                            </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>16</td>
                                        <td>Restaurant</td>
                                        <td>
                                            <div class="avatar-list-stacked avatar-group-sm">

                                                <span class="avatar border-0">
                                                    <img src="/uploads/user/639178006593410735_cat2.png" alt="Profile Picture" width="40" height="40" style="border-radius: 50%;">
                                                </span>
                                                <span class="avatar border-0">
                                                    <img src="/Content/uploads/IMG_20230714_114721.jpg" alt="Profile Picture" width="40" height="40" style="border-radius: 50%;">
                                                </span>
                                            </div>
                                        </td>
                                        <td>27/02/2025</td>
                                        <td>
                                            <span class="badge badge-warning-transparent">
                                                <i class="ti ti-point-filled me-1"></i>Medium
                                            </span>
                                        </td>
                                    </tr>

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




</asp:Content>
