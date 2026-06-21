<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="HRMS_Team4.Admin.EmployeeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content">

    <!-- Breadcrumb -->
    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
        <div class="my-auto mb-2">
            <h2 class="mb-1">Employee</h2>
            <nav>
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item">
                        <a href="index.html"><i class="ti ti-smart-home"></i></a>
                    </li>
                    <li class="breadcrumb-item">Employee
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Employee List</li>
                </ol>
            </nav>
        </div>
        <div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
            <div class="me-2 mb-2">
                <div class="d-flex align-items-center border bg-white rounded p-1 me-2 icon-list">
                    <a class="btn btn-icon btn-sm active bg-primary text-white me-1" href="/Employee/EmpList"><i class="ti ti-list-tree"></i></a>
                    <a class="btn btn-icon btn-sm" href="/Employee/EmployeeGrid"><i class="ti ti-layout-grid"></i></a>
                </div>
            </div>
            <div class="me-2 mb-2">
                <div id="" class="dropdown">
                    <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                        <i class="ti ti-file-export me-1"></i>Export
                    </a>
                    <ul class="dropdown-menu  dropdown-menu-end p-3">
                        <li>
                            <a id="exportToPDF" href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-pdf me-1"></i>Export as PDF</a>
                        </li>
                        <li>
                            <a id="exportToExcel" href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-xls me-1"></i>Export as Excel </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="mb-2">
                <a href="#" id="openmod" class="btn btn-primary d-flex align-items-center"><i class="ti ti-circle-plus me-2"></i>Add Employee</a>
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

        <!-- Total Plans -->
        <div class="col-lg-3 col-md-6 d-flex">
            <div class="card flex-fill">
                <div class="card-body d-flex align-items-center justify-content-between">
                    <div class="d-flex align-items-center overflow-hidden">
                        <div>
                            <span class="avatar avatar-lg bg-dark rounded-circle"><i class="ti ti-users"></i></span>
                        </div>
                        <div class="ms-2 overflow-hidden">
                            <p class="fs-12 fw-medium mb-1 text-truncate">Total Employee</p>
                            <h4>7</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Total Plans -->
        <!-- Total Plans -->
        <div class="col-lg-3 col-md-6 d-flex">
            <div class="card flex-fill">
                <div class="card-body d-flex align-items-center justify-content-between">
                    <div class="d-flex align-items-center overflow-hidden">
                        <div>
                            <span class="avatar avatar-lg bg-success rounded-circle"><i class="ti ti-user-share"></i></span>
                        </div>
                        <div class="ms-2 overflow-hidden">
                            <p class="fs-12 fw-medium mb-1 text-truncate">Active</p>
                            <h4>7</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Total Plans -->
        <!-- Inactive Plans -->
        <div class="col-lg-3 col-md-6 d-flex">
            <div class="card flex-fill">
                <div class="card-body d-flex align-items-center justify-content-between">
                    <div class="d-flex align-items-center overflow-hidden">
                        <div>
                            <span class="avatar avatar-lg bg-danger rounded-circle"><i class="ti ti-user-pause"></i></span>
                        </div>
                        <div class="ms-2 overflow-hidden">
                            <p class="fs-12 fw-medium mb-1 text-truncate">InActive</p>
                            <h4>0</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Inactive Companies -->
        <!-- No of Plans  -->
        <div class="col-lg-3 col-md-6 d-flex">
            <div class="card flex-fill">
                <div class="card-body d-flex align-items-center justify-content-between">
                    <div class="d-flex align-items-center overflow-hidden">
                        <div>
                            <span class="avatar avatar-lg bg-info rounded-circle"><i class="ti ti-user-plus"></i></span>
                        </div>
                        <div class="ms-2 overflow-hidden">
                            <p class="fs-12 fw-medium mb-1 text-truncate">New Joiners</p>
                            <h4>0</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /No of Plans -->

    </div>

    <div class="card">
        <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
            <h5>Employee List</h5>
            <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">

                <div class="d-flex mb-1">
                    <div class="d-flex align-items-center me-1">
                        <label for="startDate" class="me-2">Start:</label>
                        <input type="date" class="form-control" id="startDate">
                    </div>
                    <div class="d-flex align-items-center me-3">
                        <label for="endDate" class="me-2">End:</label>
                        <input type="date" class="form-control" id="endDate">
                    </div>
                </div>

                <div class="dropdown me-3">
                    <select id="designation" class="form-control" fdprocessedid="4ek98">

                        <option value="12">Software Developer</option>
                        <option value="15">Sales</option>
                    </select>
                </div>







                <div class="dropdown me-3">
                    <select id="sts" class="form-control" fdprocessedid="656ktn">
                        <option value="select">Status</option>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>


                <div class="dropdown">

                    <select id="opt" class="form-control" fdprocessedid="a4golr">
                        <option value="">Sorting By</option>
                        <option value="asc">Ascending</option>
                        <option value="desc">Descending</option>
                        <option value="last7days">Last 7 Days</option>
                        <option value="thismonth">This Month</option>
                        <option value="thisyear">This Year</option>
                    </select>
                </div>


            </div>
        </div>
        <div class="card-body p-0">
            <div class="custom-datatable-filter table-responsive">
                <div id="table_wrapper" class="dt-container dt-empty-footer">
                    <div class="dt-layout-row">
                        <div class="dt-layout-cell dt-layout-start">
                            <div class="dt-length">
                                <select aria-controls="table" class="dt-input" id="dt-length-0" fdprocessedid="3rf0ji">
                                    <option value="5">5</option>
                                    <option value="10">10</option>
                                    <option value="25">25</option>
                                    <option value="-1">All</option>
                                </select><label for="dt-length-0"> entries per page</label>
                            </div>
                        </div>
                        <div class="dt-layout-cell dt-layout-end">
                            <div class="dt-search">
                                <label for="dt-search-0">Search:</label><input type="search" class="dt-input" id="dt-search-0" placeholder="" aria-controls="table">
                            </div>
                        </div>
                    </div>
                    <div class="dt-layout-row dt-layout-table">
                        <div class="dt-layout-cell dt-layout-full table-responsive">
                            <table class="table dataTable" id="table" aria-describedby="table_info">
                                <colgroup>
                                    <col data-dt-column="0">
                                    <col data-dt-column="1">
                                    <col data-dt-column="2">
                                    <col data-dt-column="3">
                                    <col data-dt-column="4">
                                    <col data-dt-column="5">
                                    <col data-dt-column="6">
                                    <col data-dt-column="7">
                                    <col data-dt-column="8">
                                    <col data-dt-column="9">
                                    <col data-dt-column="10">
                                </colgroup>
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col" data-dt-column="0" rowspan="1" colspan="1" class="dt-type-numeric dt-orderable-asc dt-orderable-desc dt-ordering-asc" aria-sort="ascending" aria-label="Id: Activate to invert sorting"><span class="dt-column-title">Id</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="1" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="Name: Activate to sort"><span class="dt-column-title">Name</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="2" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="Email: Activate to sort"><span class="dt-column-title">Email</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="3" rowspan="1" colspan="1" class="dt-type-numeric dt-orderable-asc dt-orderable-desc" aria-label="Number: Activate to sort"><span class="dt-column-title">Number</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="4" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="Designation: Activate to sort"><span class="dt-column-title">Designation</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="5" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="Reporting manager: Activate to sort"><span class="dt-column-title">Reporting manager</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="6" rowspan="1" colspan="1" class="dt-type-date dt-orderable-asc dt-orderable-desc" aria-label="DOJ: Activate to sort"><span class="dt-column-title">DOJ</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="7" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="Status: Activate to sort"><span class="dt-column-title">Status</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="8" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="CreatedBy: Activate to sort"><span class="dt-column-title">CreatedBy</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="9" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="ModifiedBy: Activate to sort"><span class="dt-column-title">ModifiedBy</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="10" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="Action: Activate to sort"><span class="dt-column-title">Action</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                    </tr>
                                </thead>
                                <tbody id="mydata">
                                    <tr>
                                        <td class="dt-type-numeric sorting_1">35</td>
                                        <td>
                                            <img src="/Content/uploads/Krish Photo.jpeg" alt="Profile Picture" width="50" height="50" class="rounded-circle">
                                            Krish Kheloji</td>
                                        <td>khelojikrish@gmail.com</td>
                                        <td class="dt-type-numeric">8877665544</td>
                                        <td>Software Developer</td>
                                        <td>null</td>
                                        <td class="dt-type-date">2025-05-02</td>
                                        <td><span class="badge bg-success"><i class="ti ti-point-filled me-1"></i>Active</span></td>
                                        <td>null</td>
                                        <td>null</td>
                                        <td><a href="#" class="edit-btn" data-id="35"><i class="ti ti-edit"></i></a><a href="#" class="delete-btn" data-id="35"><i class="bi bi-trash"></i></a></td>
                                    </tr>
                                    <tr>
                                        <td class="dt-type-numeric sorting_1">36</td>
                                        <td>
                                            <img src="/Content/uploads/user1.jpg" alt="Profile Picture" width="50" height="50" class="rounded-circle">
                                            SurajR K</td>
                                        <td>suraj@gmail.com</td>
                                        <td class="dt-type-numeric">6546378292</td>
                                        <td>Software Developer</td>
                                        <td>Krish</td>
                                        <td class="dt-type-date">0001-01-01</td>
                                        <td><span class="badge bg-success"><i class="ti ti-point-filled me-1"></i>Active</span></td>
                                        <td>admin</td>
                                        <td>admin</td>
                                        <td><a href="#" class="edit-btn" data-id="36"><i class="ti ti-edit"></i></a><a href="#" class="delete-btn" data-id="36"><i class="bi bi-trash"></i></a></td>
                                    </tr>
                                    <tr>
                                        <td class="dt-type-numeric sorting_1">37</td>
                                        <td>
                                            <img src="/Content/uploads/user2.jpg" alt="Profile Picture" width="50" height="50" class="rounded-circle">
                                            Ram Kheloji</td>
                                        <td>ram@gmail.com</td>
                                        <td class="dt-type-numeric">8877665544</td>
                                        <td>Software Developer</td>
                                        <td>Krish</td>
                                        <td class="dt-type-date">0001-01-01</td>
                                        <td><span class="badge bg-success"><i class="ti ti-point-filled me-1"></i>Active</span></td>
                                        <td>admin</td>
                                        <td>admin</td>
                                        <td><a href="#" class="edit-btn" data-id="37"><i class="ti ti-edit"></i></a><a href="#" class="delete-btn" data-id="37"><i class="bi bi-trash"></i></a></td>
                                    </tr>
                                    <tr>
                                        <td class="dt-type-numeric sorting_1">38</td>
                                        <td>
                                            <img src="/Content/uploads/IMG_20230714_114721.jpg" alt="Profile Picture" width="50" height="50" class="rounded-circle">
                                            Jack J</td>
                                        <td>jack@gmail.com</td>
                                        <td class="dt-type-numeric">9988776655</td>
                                        <td>Software Developer</td>
                                        <td>Krish</td>
                                        <td class="dt-type-date">0001-01-01</td>
                                        <td><span class="badge bg-success"><i class="ti ti-point-filled me-1"></i>Active</span></td>
                                        <td>admin</td>
                                        <td>null</td>
                                        <td><a href="#" class="edit-btn" data-id="38"><i class="ti ti-edit"></i></a><a href="#" class="delete-btn" data-id="38"><i class="bi bi-trash"></i></a></td>
                                    </tr>
                                    <tr>
                                        <td class="dt-type-numeric sorting_1">40</td>
                                        <td>
                                            <img src="/Content/uploads/photo.jpeg" alt="Profile Picture" width="50" height="50" class="rounded-circle">
                                            Harish K</td>
                                        <td>harish@gmail.com</td>
                                        <td class="dt-type-numeric">9988776655</td>
                                        <td>Software Developer</td>
                                        <td>Krish</td>
                                        <td class="dt-type-date">2025-02-26</td>
                                        <td><span class="badge bg-success"><i class="ti ti-point-filled me-1"></i>Active</span></td>
                                        <td>admin</td>
                                        <td>admin</td>
                                        <td><a href="#" class="edit-btn" data-id="40"><i class="ti ti-edit"></i></a><a href="#" class="delete-btn" data-id="40"><i class="bi bi-trash"></i></a></td>
                                    </tr>
                                </tbody>
                                <tfoot></tfoot>
                            </table>
                        </div>
                    </div>
                    <div class="dt-layout-row">
                        <div class="dt-layout-cell dt-layout-start">
                            <div class="dt-info" aria-live="polite" id="table_info" role="status">Showing 1 to 5 of 6 entries</div>
                        </div>
                        <div class="dt-layout-cell dt-layout-end">
                            <div class="dt-paging">
                                <nav aria-label="pagination">
                                    <button class="dt-paging-button disabled first" role="link" type="button" aria-controls="table" aria-disabled="true" aria-label="First" data-dt-idx="first" tabindex="-1">«</button>
                                    <button class="dt-paging-button disabled previous" role="link" type="button" aria-controls="table" aria-disabled="true" aria-label="Previous" data-dt-idx="previous" tabindex="-1">‹</button>
                                    <button class="dt-paging-button current" role="link" type="button" aria-controls="table" aria-current="page" data-dt-idx="0" fdprocessedid="amuyt">1</button>
                                    <button class="dt-paging-button" role="link" type="button" aria-controls="table" data-dt-idx="1" fdprocessedid="jb4vwrs">2</button>
                                    <button class="dt-paging-button next" role="link" type="button" aria-controls="table" aria-label="Next" data-dt-idx="next" fdprocessedid="efgsrv">›</button>
                                    <button class="dt-paging-button last" role="link" type="button" aria-controls="table" aria-label="Last" data-dt-idx="last" fdprocessedid="2d1kq">»</button>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

</asp:Content>
