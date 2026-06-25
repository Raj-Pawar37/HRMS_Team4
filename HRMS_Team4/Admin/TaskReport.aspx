<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="TaskReport.aspx.cs" Inherits="HRMS_Team4.Admin.TaskReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <asp:HiddenField ID="hfCompleted" runat="server" />
<asp:HiddenField ID="hfPending" runat="server" />
<asp:HiddenField ID="hfInProgress" runat="server" />
<asp:HiddenField ID="hfOnHold" runat="server" />

        <!-- Breadcrumb -->
        <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
            <div class="my-auto mb-2">
                <h2 class="mb-1">Task Report</h2>
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item">
                            <a href="index.html"><i class="ti ti-smart-home"></i></a>
                        </li>
                        <li class="breadcrumb-item">HR
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Task Report</li>
                    </ol>
                </nav>
            </div>
            <div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
                <div class="mb-2">
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
                <div class="head-icons ms-2">
                    <a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
                        <i class="ti ti-chevrons-up"></i>
                    </a>
                </div>
            </div>
        </div>
        <!-- /Breadcrumb -->

        <div class="row">

            <!-- Total Exponses -->
            <div class="col-lg-6 col-md-6 d-flex">
                <div class="row flex-fill">
                    <div class="col-lg-6 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body ">
                                <div class="row align-items-center">
                                    <div class="col-8">
                                        <div>
                                            <span class="fs-14 fw-normal text-truncate mb-1">Total Complete Tasks</span>
                                            <h5>
                                                <asp:Label ID="lblCompletedTasks" runat="server"></asp:Label></h5>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <p class="data-attributes">
                                            <span data-peity="{ &quot;fill&quot;: [&quot;#F26522&quot;, &quot;rgba(67, 87, 133, .09)&quot;], &quot;innerRadius&quot;: 16, &quot;radius&quot;: 32 }" style="display: none;">6/7</span><svg class="peity" height="64" width="64"><path d="M 32 0 A 32 32 0 1 1 6.981392561023043 12.048326340520532 L 19.49069628051152 22.024163170260266 A 16 16 0 1 0 32 16" data-value="6" fill="#F26522"></path><path d="M 6.981392561023043 12.048326340520532 A 32 32 0 0 1 31.999999999999993 0 L 31.999999999999996 16 A 16 16 0 0 0 19.49069628051152 22.024163170260266" data-value="1" fill="rgba(67, 87, 133, .09)"></path></svg>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body ">
                                <div class="row align-items-center">
                                    <div class="col-8">
                                        <div>
                                            <span class="fs-14 fw-normal text-truncate mb-1">Total Pending Tasks</span>
                                            <h5>
                                                <asp:Label ID="lblPendingTasks" runat="server"></asp:Label></h5>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <p class="data-attributes">
                                            <span data-peity="{ &quot;fill&quot;: [&quot;#03C95A&quot;, &quot;rgba(67, 87, 133, .09)&quot;], &quot;innerRadius&quot;: 16, &quot;radius&quot;: 32 }" style="display: none;">4/7</span><svg class="peity" height="64" width="64"><path d="M 32 0 A 32 32 0 1 1 18.115720348238142 60.83100377287741 L 25.05786017411907 46.415501886438705 A 16 16 0 1 0 32 16" data-value="4" fill="#03C95A"></path><path d="M 18.115720348238142 60.83100377287741 A 32 32 0 0 1 31.999999999999993 0 L 31.999999999999996 16 A 16 16 0 0 0 25.05786017411907 46.415501886438705" data-value="3" fill="rgba(67, 87, 133, .09)"></path></svg>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-8">
                                        <div>
                                            <span class="fs-14 fw-normal text-truncate mb-1">Total OnHold Tasks</span>
                                            <h5>
                                                <asp:Label ID="lblOnHoldTasks" runat="server"></asp:Label></h5>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <p class="data-attributes">
                                            <span data-peity="{ &quot;fill&quot;: [&quot;#FD3995&quot;, &quot;rgba(67, 87, 133, .09)&quot;], &quot;innerRadius&quot;: 16, &quot;radius&quot;: 32 }" style="display: none;">2/7</span><svg class="peity" height="64" width="64"><path d="M 32 0 A 32 32 0 0 1 63.19769318981835 39.12066988660206 L 47.598846594909176 35.56033494330103 A 16 16 0 0 0 32 16" data-value="2" fill="#FD3995"></path><path d="M 63.19769318981835 39.12066988660206 A 32 32 0 1 1 31.999999999999993 0 L 31.999999999999996 16 A 16 16 0 1 0 47.598846594909176 35.56033494330103" data-value="5" fill="rgba(67, 87, 133, .09)"></path></svg>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body ">
                                <div class="row align-items-center">
                                    <div class="col-8">
                                        <div>
                                            <span class="fs-14 fw-normal text-truncate mb-1">
    Total In Progress Tasks
</span>

<h5>
    <asp:Label ID="lblInProgressTasks"
        runat="server">
    </asp:Label>
</h5>
                                            <span class="fs-14 fw-normal text-truncate mb-1">Total Tasks</span>
                                            <h5>
                                                <asp:Label ID="lblTotalTasks" runat="server"></asp:Label></h5>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <p class="data-attributes">
                                            <span data-peity="{ &quot;fill&quot;: [&quot;#0DCAF0&quot;, &quot;rgba(67, 87, 133, .09)&quot;], &quot;innerRadius&quot;: 16, &quot;radius&quot;: 32 }" style="display: none;">1/7</span><svg class="peity" height="64" width="64"><path d="M 32 0 A 32 32 0 0 1 57.01860743897696 12.048326340520529 L 44.50930371948848 22.024163170260266 A 16 16 0 0 0 32 16" data-value="1" fill="#0DCAF0"></path><path d="M 57.01860743897696 12.048326340520529 A 32 32 0 1 1 31.999999999999993 0 L 31.999999999999996 16 A 16 16 0 1 0 44.50930371948848 22.024163170260266" data-value="6" fill="rgba(67, 87, 133, .09)"></path></svg>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Total Exponses -->

            <!-- Total Exponses -->
            <div class="col-lg-6 col-md-6 d-flex">
                <div class="card flex-fill">
                    <div class="card-header border-0">
                        <div class="d-flex flex-wrap justify-content-between align-items-center">
                            <div class="d-flex align-items-center ">
                                <span class="me-2"><i class="ti ti-chart-pie text-danger"></i></span>
                                <h5>Tasks</h5>
                            </div>
                            <div class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle btn btn-sm fs-12 btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Office Management App
                                </a>
                                <ul class="dropdown-menu  dropdown-menu-end p-2">
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">PRO-001</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">PRO-002</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">PRO-004</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="card-body pt-0">
                        <div class="row align-items-center">
                            <div class="col-md-6 d-flex align-items-center justify-content-center">
                                <div class="position-relative payment-total">
                                    <div id="task-reports">


                                    </div>
                                    <div class="task-total-content ">
                                        <p class="fs-16 fw-normal mb-0">Pending</p>
                                        <span class="display-3 fs-24 fw-bold text-skyblue">30%</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row gy-4">
                                    <div class="col-md-6">
                                        <div class="d-flex task-report-icons">
                                            <span class="me-2"><i class="ti ti-arrow-badge-right-filled text-success"></i></span>
                                            <h6 class="fs-16">Completed <span class="fs-14 fw-normal">40%</span></h6>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="d-flex task-report-icons">
                                            <span class="me-2"><i class="ti ti-arrow-badge-right-filled text-skyblue"></i></span>
                                            <h6 class="fs-16">Pending <span class="fs-14 fw-normal">30 %</span></h6>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="d-flex task-report-icons">
                                            <span class="me-2"><i class="ti ti-arrow-badge-right-filled text-warning"></i></span>
                                            <h6 class="fs-16">Inprogress  <span class="fs-14 fw-normal">20 %</span></h6>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="d-flex task-report-icons">
                                            <span class="me-2"><i class="ti ti-arrow-badge-right-filled text-purple"></i></span>
                                            <h6 class="fs-16">On Hold <span class="fs-14 fw-normal">10 %</span></h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Total Exponses -->
        </div>
        <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                <h5>Tasks List</h5>
                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
                    <div class="me-3">
                        <div class="input-icon-end position-relative">
                            <input type="text" class="form-control date-range bookingrange" placeholder="dd/mm/yyyy - dd/mm/yyyy">
                            <span class="input-icon-addon">
                                <i class="ti ti-chevron-down"></i>
                            </span>
                        </div>
                    </div>
                    <div class="dropdown me-3">
                        <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Select Priority
                        </a>
                        <ul class="dropdown-menu  dropdown-menu-end p-3">
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Low</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Medium</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">High</a>
                            </li>
                        </ul>
                    </div>
                    <div class="dropdown me-3">
                        <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Select Status
                        </a>
                        <ul class="dropdown-menu  dropdown-menu-end p-3">
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Active</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Inactive</a>
                            </li>
                        </ul>
                    </div>
                    <div class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Sort By : Last 7 Days
                        </a>
                        <ul class="dropdown-menu  dropdown-menu-end p-3">
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Recently Added</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Ascending</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Desending</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Last Month</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Last 7 Days</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="card-body p-0">
                <div class="custom-datatable-filter table-responsive">
                    <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper dt-bootstrap5 no-footer">
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                                <div class="dataTables_length" id="DataTables_Table_0_length">
                                    <label>
                                        Row Per Page
                                        <select name="DataTables_Table_0_length" aria-controls="DataTables_Table_0" class="form-select form-select-sm">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                        Entries</label>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div id="DataTables_Table_0_filter" class="dataTables_filter">
                                    <label>
                                        <input type="search" class="form-control form-control-sm" placeholder="Search" aria-controls="DataTables_Table_0"></label>
                                </div>
                            </div>
                        </div>




                       <asp:GridView ID="gvTaskReport"
    runat="server"
    AutoGenerateColumns="False"
    CssClass="table table-bordered table-hover">

    <Columns>

        <asp:BoundField DataField="TaskId"
            HeaderText="Task ID" />

        <asp:BoundField DataField="TaskName"
            HeaderText="Task Name" />

        <asp:BoundField DataField="ProjectName"
            HeaderText="Project Name" />

        <asp:BoundField DataField="Priority"
            HeaderText="Priority" />

        <asp:BoundField DataField="DueDate"
            HeaderText="Due Date"
            DataFormatString="{0:dd-MMM-yyyy}" />

        <asp:TemplateField HeaderText="Status">
            <ItemTemplate>

                <span class="badge bg-primary">
                    <%# Eval("Status") %>
                </span>

            </ItemTemplate>
        </asp:TemplateField>

    </Columns>

</asp:GridView>







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
        </div>

    </div>

  

<script>

document.addEventListener("DOMContentLoaded", function () {

    var completed =
        parseInt(document.getElementById('<%=hfCompleted.ClientID%>').value) || 0;

    var pending =
        parseInt(document.getElementById('<%=hfPending.ClientID%>').value) || 0;

    var inprogress =
        parseInt(document.getElementById('<%=hfInProgress.ClientID%>').value) || 0;

    var onhold =
        parseInt(document.getElementById('<%=hfOnHold.ClientID%>').value) || 0;

    var options = {
        chart: {
            type: 'donut',
            height: 300
        },

        series: [
            completed,
            pending,
            inprogress,
            onhold
        ],

        labels: [
            'Completed',
            'Pending',
            'In Progress',
            'On Hold'
        ]
    };

    var chart =
        new ApexCharts(
            document.querySelector("#task-reports"),
            options
        );

    chart.render();
});

</script>
</asp:Content>
