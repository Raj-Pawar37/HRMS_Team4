<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EmployeeReport.aspx.cs" Inherits="HRMS_Team4.Admin.EmployeeReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">

        <!-- Breadcrumb -->
        <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
            <div class="my-auto mb-2">
                <h2 class="mb-1">Employee Report</h2>
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item">
                            <a href="index.html"><i class="ti ti-smart-home"></i></a>
                        </li>
                        <li class="breadcrumb-item">HR
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Employee Report</li>
                    </ol>
                </nav>
            </div>
            <div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
                <div class="mb-2">
                    <div class="dropdown">
                        <a href="javascript:void(0);"
                            class="dropdown-toggle btn btn-orange"
                            data-bs-toggle="dropdown">

                            <i class="ti ti-file-export me-1"></i>
                            Export
                        </a>

                        <ul class="dropdown-menu dropdown-menu-end">

                            <li>
                                <asp:LinkButton
                                    ID="btnExportPdf"
                                    runat="server"
                                    CssClass="dropdown-item"
                                    OnClick="btnExportPdf_Click">

                <i class="ti ti-file-type-pdf me-2"></i>
                Export as PDF

                                </asp:LinkButton>
                            </li>

                            <li>
                                <asp:LinkButton
                                    ID="btnExportExcel"
                                    runat="server"
                                    CssClass="dropdown-item"
                                    OnClick="btnExportExcel_Click">

                <i class="ti ti-file-type-xls me-2"></i>
                Export as Excel

                                </asp:LinkButton>
                            </li>

                        </ul>
                    </div>
                </div>
                <div class="head-icons ms-2">
                    <a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
                        <i class="ti ti-chevrons-up"></i>
                    </a>
                </div>
            </div>
        </div>
        <!-- /Breadcrumb -->
        <div class="row">
            <div class="col-xl-6 d-flex">
                <div class="row flex-fill">

                    <!-- Total Companies -->
                    <div class="col-lg-6 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <div class="overflow-hidden d-flex mb-2 align-items-center">
                                    <span class="me-2">
                                        <img src="assets/img/reports-img/employee-report-icon.svg" alt="Img" class="img-fluid"></span>
                                    <div>
                                        <p class="fs-14 fw-normal mb-1 text-truncate">Total Employee</p>
                                        <asp:Label ID="lblTotalEmployees" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div>
                                    <p class="fs-12 fw-normal d-flex align-items-center text-truncate "><span class="text-success fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i>+20.01%</span>from last week</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Total Companies -->

                    <!-- Total Companies -->
                    <div class="col-lg-6 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <div class="overflow-hidden d-flex mb-2 align-items-center">
                                    <span class="me-2">
                                        <img src="assets/img/reports-img/employee-report-success.svg" alt="Img" class="img-fluid"></span>
                                    <div>
                                        <p class="fs-14 fw-normal mb-1 text-truncate">Active Employee</p>
                                        <asp:Label ID="lblActiveEmployees" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div>
                                    <p class="fs-12 fw-normal d-flex align-items-center text-truncate "><span class="text-success fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i>+20.01%</span>from last week</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Total Companies -->

                    <!-- Inactive Companies -->
                    <div class="col-lg-6 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <div class="overflow-hidden d-flex mb-2 align-items-center">
                                    <span class="me-2">
                                        <img src="assets/img/reports-img/employee-report-info.svg" alt="Img" class="img-fluid"></span>
                                    <div>
                                        <p class="fs-14 fw-normal mb-1 text-truncate">New EmployeeRole</p>
                                        <asp:Label ID="lblTotalNewJoiners" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div>
                                    <p class="fs-12 fw-normal d-flex align-items-center text-truncate "><span class="text-success fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i>+20.01%</span>from last week</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Inactive Companies -->

                    <!-- Company Location -->
                    <div class="col-lg-6 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <div class="overflow-hidden d-flex mb-2 align-items-center">
                                    <span class="me-2">
                                        <img src="assets/img/reports-img/employee-report-danger.svg" alt="Img" class="img-fluid"></span>
                                    <div>
                                        <p class="fs-14 fw-normal mb-1 text-truncate">Total InActive Employee</p>
                                        <asp:Label ID="lblTotalInActiveEmployee" runat="server"></asp:Label>
                                    </div>
                                </div>
                                <div>
                                    <p class="fs-12 fw-normal d-flex align-items-center text-truncate "><span class="text-success fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i>+20.01%</span>from last week</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Company Location -->
                </div>
            </div>
            <!-- Graph Employeee-->

            <div class="col-xl-6 d-flex">
                <div class="card flex-fill">
                    <div class="card-header border-0 pb-0">
                        <div class="d-flex flex-wrap justify-content-between align-items-center row-gap-2">
                            <div class="d-flex align-items-center ">
                                <span class="me-2"><i class="ti ti-chart-bar text-danger"></i></span>
                                <h5>Employee </h5>
                            </div>
                            <div class="d-flex align-items-center">
                                <p class="d-inline-flex align-items-center me-3 mb-0">
                                    <i class="ti ti-square-filled fs-12 text-success me-2"></i>
                                    Active Employees
                                </p>
                                <p class="d-inline-flex align-items-center">
                                    <i class="ti ti-square-filled fs-12 text-gray-1 me-2 mb-0"></i>
                                    Inactive Employees
                                </p>
                            </div>
                            <asp:DropDownList
                                ID="ddlYear"
                                runat="server"
                                CssClass="form-select form-select-sm"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
                                <asp:ListItem>2026</asp:ListItem>
                                <asp:ListItem>2025</asp:ListItem>
                                <asp:ListItem>2024</asp:ListItem>
                                <asp:ListItem>2023</asp:ListItem>

                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="card-body py-0">
                        <div id="employee-reports" style="min-height: 195px;"></div>


                    </div>
                </div>
            </div>
        </div>



        <!-- filter -->
        <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                <h5>Employees List</h5>
                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">

                    <div class="dropdown me-3">
                        <asp:DropDownList
                            ID="ddlDepartment"
                            runat="server"
                            CssClass="form-select"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="FilterChanged"
                            AppendDataBoundItems="true">

                            <asp:ListItem Text="All Department" Value=""></asp:ListItem>

                        </asp:DropDownList>
                    </div>
                    <div class="dropdown me-3">
                        <asp:DropDownList
                            ID="ddlStatus"
                            runat="server"
                            CssClass="form-select"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="FilterChanged">

                            <asp:ListItem Text="All Status" Value=""></asp:ListItem>
                            <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                            <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>


                        </asp:DropDownList>
                    </div>
                    <div class="dropdown me-3">
                        <asp:DropDownList
                            ID="ddlSortBy"
                            runat="server"
                            CssClass="form-select"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="FilterChanged">

                            <asp:ListItem Text="Sort By" Value=""></asp:ListItem>
                            <asp:ListItem>Recently Added</asp:ListItem>
                            <asp:ListItem>Ascending</asp:ListItem>
                            <asp:ListItem>Desending</asp:ListItem>
                            <asp:ListItem>Last Month</asp:ListItem>
                            <asp:ListItem>Last 7 Days</asp:ListItem>

                        </asp:DropDownList>
                    </div>
                    <div class="dropdown me-3">
                        <asp:TextBox
                            ID="txtSearch"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Search Employee..."
                            AutoPostBack="true"
                            OnTextChanged="FilterChanged">
                        </asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="card-body p-0">
                <div class="d-flex align-items-center gap-2 mb-3">

                    <span>Show</span>

                    <asp:DropDownList
                        ID="ddlPageSize"
                        runat="server"
                        CssClass="form-select"
                        Style="width: 90px;"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">


                        <asp:ListItem Value="5" Selected="True">5</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="25">25</asp:ListItem>
                        <asp:ListItem Value="50">50</asp:ListItem>
                        <asp:ListItem Value="100">100</asp:ListItem>
                        <asp:ListItem Value="999999">All</asp:ListItem>

                    </asp:DropDownList>

                    <span>Entries</span>

                </div>

                <!-- Grid view-->
                <asp:GridView
                    ID="gvEmployeeReport"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table table-striped table-hover table-bordered align-middle"
                    GridLines="None">

                    <Columns>

                        <asp:BoundField DataField="UserId"
                            HeaderText="Emp ID" />

                        <asp:BoundField DataField="Name"
                            HeaderText="Name" />

                        <asp:BoundField DataField="Email"
                            HeaderText="Email" />

                        <asp:BoundField DataField="Department"
                            HeaderText="Department" />

                        <asp:BoundField DataField="PhoneNumber"
                            HeaderText="Phone" />

                        <asp:BoundField DataField="DateOfJoining"
                            HeaderText="Joining Date"
                            DataFormatString="{0:dd-MMM-yyyy}" />

                        <asp:BoundField DataField="Status"
                            HeaderText="Status" />

                    </Columns>

                </asp:GridView>





                <div class="row">
                    <div class="col-sm-12 col-md-5">
                        <div class="dataTables_info" id="DataTables_Table_0_info" role="status" aria-live="polite">Showing 1 - 10 of 10 entries</div>
                    </div>
                    <div class="col-sm-12 col-md-7">
                        <div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate">
                            <ul class="pagination">
                                <li class="paginate_button page-item previous disabled" id="DataTables_Table_0_previous"><a aria-controls="DataTables_Table_0" aria-disabled="true" role="link" data-dt-idx="previous" tabindex="-1" class="page-link"><i class="ti ti-chevron-left"></i></a></li>
                                <li class="paginate_button page-item active"><a href="#" aria-controls="DataTables_Table_0" role="link" aria-current="page" data-dt-idx="0" tabindex="0" class="page-link">1</a></li>
                                <li class="paginate_button page-item next disabled" id="DataTables_Table_0_next"><a aria-controls="DataTables_Table_0" aria-disabled="true" role="link" data-dt-idx="next" tabindex="-1" class="page-link"><i class="ti ti-chevron-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <asp:HiddenField ID="hfActiveEmployees" runat="server" />
    <asp:HiddenField ID="hfInactiveEmployees" runat="server" />

    <asp:HiddenField
        ID="hfFromDate"
        runat="server" />

    <asp:HiddenField
        ID="hfToDate"
        runat="server" />

    <asp:HiddenField
        ID="hfMonths"
        runat="server"
        ClientIDMode="Static" />

    <asp:HiddenField
        ID="hfActive"
        runat="server"
        ClientIDMode="Static" />

    <asp:HiddenField
        ID="hfInactive"
        runat="server"
        ClientIDMode="Static" />

</asp:Content>
