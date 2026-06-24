<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="TransactionHistory.aspx.cs" Inherits="HRMS_Team4.Admin.TransactionHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div b-ietxc090g4="" class="content">
				




<!-- Breadcrumb -->
<div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
    <div class="my-auto mb-2">
        <h2 class="mb-1">Transcation History</h2>
        <nav>
            <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item">
                    <a href="index.html"><i class="ti ti-smart-home"></i></a>
                </li>
                <li class="breadcrumb-item">
                    HR
                </li>
                <li class="breadcrumb-item active" aria-current="page">Employee Salary</li>
            </ol>
        </nav>
    </div>
    <div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">

        <div class="me-2 mb-2">
            <div class="dropdown">
                <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                    <i class="ti ti-file-export me-1"></i>Export
                </a>
                <ul class="dropdown-menu dropdown-menu-end p-3">
                    <li>
                        <a href="javascript:void(0);" class="dropdown-item rounded-1" id="ExportPdf">
                            <i class="ti ti-file-type-pdf me-1"></i>Export as PDF
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="dropdown-item rounded-1" id="ExportExcel">
                            <i class="ti ti-file-type-xls me-1"></i>Export as Excel
                        </a>
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


<div class="card">
    <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
        <h5>Payslip List</h5>
        <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
            <!-- Month Filter -->
            <div class="me-3">
                <select id="filterMonth" class="form-control" fdprocessedid="er9p9">
                    <option value="">Select Month</option>
                    <option value="January">January</option>
                    <option value="February">February</option>
                    <option value="March">March</option>
                    <option value="April">April</option>
                    <option value="May">May</option>
                    <option value="June">June</option>
                    <option value="July">July</option>
                    <option value="August">August</option>
                    <option value="September">September</option>
                    <option value="October">October</option>
                    <option value="November">November</option>
                    <option value="December">December</option>
                </select>
            </div>

            <!-- Year Filter -->
            <div class="me-3">
                <select id="filterYear" class="form-control" fdprocessedid="q0iv4u">
                    <option value="">Select Year</option>
                        <option value="2026">2026</option>
                        <option value="2025">2025</option>
                        <option value="2024">2024</option>
                        <option value="2023">2023</option>
                        <option value="2022">2022</option>
                        <option value="2021">2021</option>
                        <option value="2020">2020</option>
                        <option value="2019">2019</option>
                        <option value="2018">2018</option>
                        <option value="2017">2017</option>
                        <option value="2016">2016</option>
                </select>
            </div>

            <!-- Department Filter -->
            <div class="me-3">
                <select id="filterDepartment" class="form-control" fdprocessedid="s6rjn">
                    <option value="">Select Department</option>
                        <option value="25">IT</option>
                        <option value="26">HR</option>
                        <option value="27">Test1</option>
                        <option value="28">Test2</option>
                        <option value="29">Test3</option>
                </select>
            </div>

            <!-- Designation Filter -->
            <div class="me-3">
                <select id="filterDesignation" class="form-control" fdprocessedid="85tb2a">
                    <option value="">Select Designation</option>
                        <option value="12">Software Developer</option>
                        <option value="15">Sales</option>
                        <option value="16">Test1</option>
                </select>
            </div>

            <!-- Apply Filter Button -->
            <div>
                <button id="applyFiltersBtn" class="btn btn-primary" fdprocessedid="ylcel">Apply Filters</button>
            </div>
        </div>
    </div>

    <div class="card-body p-0">
        <div class="table-responsive">
            <div id="payslipTable_wrapper" class="dataTables_wrapper no-footer table-responsive"><div class="dataTables_length" id="payslipTable_length"><label>Show <select name="payslipTable_length" aria-controls="payslipTable" class="" fdprocessedid="mqhhal"><option value="5">5</option><option value="10">10</option><option value="25">25</option><option value="-1">All</option></select> entries per page</label></div><div id="payslipTable_filter" class="dataTables_filter"><label>Search:<input type="search" class="" placeholder="" aria-controls="payslipTable"></label></div><table class="table display dataTable no-footer" id="payslipTable" aria-describedby="payslipTable_info">
                <thead class="thead-light">
                    <tr><th class="sorting sorting_asc" tabindex="0" aria-controls="payslipTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Emp ID: activate to sort column descending" style="width: 44.5556px;">Emp ID</th><th class="sorting" tabindex="0" aria-controls="payslipTable" rowspan="1" colspan="1" aria-label="Employee: activate to sort column ascending" style="width: 138.111px;">Employee</th><th class="sorting" tabindex="0" aria-controls="payslipTable" rowspan="1" colspan="1" aria-label="Email: activate to sort column ascending" style="width: 142.972px;">Email</th><th class="sorting" tabindex="0" aria-controls="payslipTable" rowspan="1" colspan="1" aria-label="Phone: activate to sort column ascending" style="width: 72.6944px;">Phone</th><th class="sorting" tabindex="0" aria-controls="payslipTable" rowspan="1" colspan="1" aria-label="Department: activate to sort column ascending" style="width: 74.5139px;">Department</th><th class="sorting" tabindex="0" aria-controls="payslipTable" rowspan="1" colspan="1" aria-label="Generated On: activate to sort column ascending" style="width: 86.0694px;">Generated On</th><th class="sorting" tabindex="0" aria-controls="payslipTable" rowspan="1" colspan="1" aria-label="Month / Year: activate to sort column ascending" style="width: 81.1528px;">Month / Year</th><th class="sorting" tabindex="0" aria-controls="payslipTable" rowspan="1" colspan="1" aria-label="Actions: activate to sort column ascending" style="width: 56.8889px;">Actions</th></tr>
                </thead>
                <tbody id="payslipData">
                        
                        
                        
                <tr class="odd">
                            <td class="sorting_1">35</td>
                            <td>
                                <div class="d-flex align-items-center file-name-icon">
                                    <a href="#" class="avatar avatar-md border avatar-rounded">
                                        <img src="/Content/uploads/Krish Photo.jpeg" class="img-fluid" alt="Profile Picture">
                                    </a>
                                    <div class="ms-2">
                                        <h6 class="fw-medium"><a href="#">Krish Kheloji</a></h6>
                                        <span class="fs-12 fw-normal">Software Developer</span>
                                    </div>
                                </div>
                            </td>
                            <td>khelojikrish@gmail.com</td>
                            <td>8877665544</td>
                            <td>IT</td>
                            <td>04-03-2025</td>
                            <td>March / 2025</td>
                            <td>
                                <a href="/Payslip/GeneratePayslipforAllUser?userId=35&amp;month=March&amp;year=2025">
                                    <i class="bi bi-eye"></i>

                                   
                                </a>
                                &nbsp;
                                <a href="/Payslip/DownloadPayslip?payslipPath=C%3A%5CUsers%5Cfinan%5CDownloads%5CPulse360%20(2)%20(2)Lat%5CPulse360%5CPulse360%5CPulse360%5Cwwwroot%5Cpayslips%5CPayslip_Krish_March_2025.pdf">
                                   
                                    <i class="ti ti-download"></i>
                                </a>
                                &nbsp;
                                <a href="/Payslip/DeleteTransaction?payslipId=27" onclick="return confirm('Are You Sure to delete this Payslip?')"><i class="bi bi-trash"></i>

                        </a>
                            </td>
                        </tr><tr class="even">
                            <td class="sorting_1">38</td>
                            <td>
                                <div class="d-flex align-items-center file-name-icon">
                                    <a href="#" class="avatar avatar-md border avatar-rounded">
                                        <img src="/Content/uploads/IMG_20230714_114721.jpg" class="img-fluid" alt="Profile Picture">
                                    </a>
                                    <div class="ms-2">
                                        <h6 class="fw-medium"><a href="#">Jack J</a></h6>
                                        <span class="fs-12 fw-normal">Software Developer</span>
                                    </div>
                                </div>
                            </td>
                            <td>jack@gmail.com</td>
                            <td>9988776655</td>
                            <td>IT</td>
                            <td>04-03-2025</td>
                            <td>March / 2025</td>
                            <td>
                                <a href="/Payslip/GeneratePayslipforAllUser?userId=38&amp;month=March&amp;year=2025">
                                    <i class="bi bi-eye"></i>

                                   
                                </a>
                                &nbsp;
                                <a href="/Payslip/DownloadPayslip?payslipPath=C%3A%5CUsers%5Cfinan%5CDownloads%5CPulse360%20(2)%20(2)Lat%5CPulse360%5CPulse360%5CPulse360%5Cwwwroot%5Cpayslips%5CPayslip_Jack_March_2025.pdf">
                                   
                                    <i class="ti ti-download"></i>
                                </a>
                                &nbsp;
                                <a href="/Payslip/DeleteTransaction?payslipId=28" onclick="return confirm('Are You Sure to delete this Payslip?')"><i class="bi bi-trash"></i>

                        </a>
                            </td>
                        </tr><tr class="odd">
                            <td class="sorting_1">40</td>
                            <td>
                                <div class="d-flex align-items-center file-name-icon">
                                    <a href="#" class="avatar avatar-md border avatar-rounded">
                                        <img src="/Content/uploads/photo.jpeg" class="img-fluid" alt="Profile Picture">
                                    </a>
                                    <div class="ms-2">
                                        <h6 class="fw-medium"><a href="#">Harish K</a></h6>
                                        <span class="fs-12 fw-normal">Software Developer</span>
                                    </div>
                                </div>
                            </td>
                            <td>harish@gmail.com</td>
                            <td>9988776655</td>
                            <td>IT</td>
                            <td>04-03-2025</td>
                            <td>March / 2025</td>
                            <td>
                                <a href="/Payslip/GeneratePayslipforAllUser?userId=40&amp;month=March&amp;year=2025">
                                    <i class="bi bi-eye"></i>

                                   
                                </a>
                                &nbsp;
                                <a href="/Payslip/DownloadPayslip?payslipPath=C%3A%5CUsers%5Cfinan%5CDownloads%5CPulse360%20(2)%20(2)Lat%5CPulse360%5CPulse360%5CPulse360%5Cwwwroot%5Cpayslips%5CPayslip_Harish_March_2025.pdf">
                                   
                                    <i class="ti ti-download"></i>
                                </a>
                                &nbsp;
                                <a href="/Payslip/DeleteTransaction?payslipId=29" onclick="return confirm('Are You Sure to delete this Payslip?')"><i class="bi bi-trash"></i>

                        </a>
                            </td>
                        </tr></tbody>
            </table><div class="dataTables_info" id="payslipTable_info" role="status" aria-live="polite">Showing 1 to 3 of 3 entries</div><div class="dataTables_paginate paging_simple_numbers" id="payslipTable_paginate"><a class="paginate_button previous disabled" aria-controls="payslipTable" aria-disabled="true" role="link" data-dt-idx="previous" tabindex="-1" id="payslipTable_previous">Previous</a><span><a class="paginate_button current" aria-controls="payslipTable" role="link" aria-current="page" data-dt-idx="0" tabindex="0">1</a></span><a class="paginate_button next disabled" aria-controls="payslipTable" aria-disabled="true" role="link" data-dt-idx="next" tabindex="-1" id="payslipTable_next">Next</a></div></div>
        </div>
    </div>
</div>



			</div>

</asp:Content>
