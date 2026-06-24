<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="HRMS_Team4.Admin.EmployeeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




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
                    <a asp-controller="Employee" asp-action="EmpList" class="btn btn-icon btn-sm active bg-primary text-white me-1"><i class="ti ti-list-tree"></i></a>
                    <a asp-controller="Employee" asp-action="EmployeeGrid" class="btn btn-icon btn-sm"><i class="ti ti-layout-grid"></i></a>
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
                <a href="javascript:void(0);"
                    data-bs-toggle="modal"
                    data-bs-target="#EmployeeModal"
                    class="btn btn-primary d-flex align-items-center">
                    <i class="ti ti-circle-plus me-2"></i>Add Employee
                </a>
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
                            <h4>
                                <asp:Label ID="LblTotalEmployee" runat="server" Text="Label"></asp:Label>
                            </h4>
                        </div>
                    </div>
                    @*
                    <div>
                        <span class="badge badge-soft-purple badge-sm fw-normal">
                            <i class="ti ti-arrow-wave-right-down"></i>
                            +19.01%
                        </span>
                    </div>
                    *@
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
                            <h4>
                                <asp:Label ID="LblActiveEmployee" runat="server" Text="Label"></asp:Label>
                            </h4>
                        </div>
                    </div>
                    @*
                    <div>
                        <span class="badge badge-soft-primary badge-sm fw-normal">
                            <i class="ti ti-arrow-wave-right-down"></i>
                            +19.01%
                        </span>
                    </div>
                    *@
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
                            <h4>
                                <asp:Label ID="LblInActiveEmployee" runat="server" Text="Label"></asp:Label>

                            </h4>
                        </div>
                    </div>
                    @*
                    <div>
                        <span class="badge badge-soft-dark badge-sm fw-normal">
                            <i class="ti ti-arrow-wave-right-down"></i>
                            +19.01%
                        </span>
                    </div>
                    *@
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
                            <h4>
                                <asp:Label ID="LblNewJoiners" runat="server" Text="Label"></asp:Label>
                            </h4>
                        </div>
                    </div>
                    @*
                    <div>
                        <span class="badge badge-soft-secondary badge-sm fw-normal">
                            <i class="ti ti-arrow-wave-right-down"></i>
                            +19.01%
                        </span>
                    </div>
                    *@
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
                        <label class="me-2">Start:</label>
                        <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>
                    <div class="d-flex align-items-center me-3">
                        <label class="me-2">End:</label>
                        <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>
                </div>

                <div class="dropdown me-3">
                    <asp:DropDownList ID="ddlFilterDesignation" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Designation</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="dropdown me-3">
                    <asp:DropDownList ID="ddlFilterStatus" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Status</asp:ListItem>
                        <asp:ListItem Value="Active">Active</asp:ListItem>
                        <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="dropdown">
                    <asp:DropDownList ID="ddlSorting" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Sorting By</asp:ListItem>
                        <asp:ListItem Value="asc">Ascending</asp:ListItem>
                        <asp:ListItem Value="desc">Descending</asp:ListItem>
                        <asp:ListItem Value="last7days">Last 7 Days</asp:ListItem>
                        <asp:ListItem Value="thismonth">This Month</asp:ListItem>
                        <asp:ListItem Value="thisyear">This Year</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>

        <div class="card-body p-0">
            <div class="custom-datatable-filter table-responsive">
                <table class="table dataTable" id="table">
                    <thead class="table-dark">
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Number</th>
                            <th>Designation</th>
                            <th>Reporting Manager</th>
                            <th>DOJ</th>
                            <th>Status</th>
                            <th>CreatedBy</th>
                            <th>ModifiedBy</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <asp:Repeater ID="rptEmployees" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("UserId") %></td>

                                    <td>
                                        <img src='<%# ResolveUrl("~/" + Eval("ProfilePicture")) %>'
                                            width="50"
                                            height="50"
                                            class="rounded-circle me-2" />
                                        <%# Eval("FirstName") %> <%# Eval("LastName") %>
                                    </td>

                                    <td><%# Eval("Email") %></td>
                                    <td><%# Eval("PhoneNumber") %></td>
                                    <td><%# Eval("DesignationName") %></td>
                                    <td><%# Eval("ReportingManagerName") %></td>

                                    <td>
                                        <%# Eval("DateOfJoining") == DBNull.Value 
                                        ? "" 
                                        : Convert.ToDateTime(Eval("DateOfJoining")).ToString("yyyy-MM-dd") %>
                                    </td>

                                    <td>
                                        <%# Eval("Status").ToString() == "Active"
                                        ? "<span class='badge bg-success'><i class='ti ti-point-filled me-1'></i>Active</span>"
                                        : "<span class='badge bg-danger'><i class='ti ti-point-filled me-1'></i>Inactive</span>" %>
                                    </td>

                                    <td><%# Eval("CreatedBy") %></td>
                                    <td><%# Eval("ModifiedBy") %></td>

                                    <td>
                                        <asp:LinkButton ID="btnEdit" runat="server"
                                            CssClass="me-2"
                                            CommandArgument='<%# Eval("UserId") %>'
                                            OnClick="btnEdit_Click">
                                        <i class="ti ti-edit"></i>
                                        </asp:LinkButton>

                                        <asp:LinkButton ID="btnDelete" runat="server"
                                            CommandArgument='<%# Eval("UserId") %>'
                                            OnClick="btnDelete_Click"
                                            OnClientClick="return confirm('Are you sure you want to delete this Employee?');">
                                        <i class="ti ti-trash"></i>
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <div class="modal fade" id="EmployeeModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="d-flex align-items-center">
                        <asp:Label ID="modelHeader" runat="server" Text="Add New Employee" CssClass="modal-title me-2 h4" />
                    </div>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>

                <div class="contact-grids-tab">
                    <ul class="nav nav-underline" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="info-tab" data-bs-toggle="tab" data-bs-target="#basic-info" type="button" role="tab" aria-selected="true">Basic Information</button>
                        </li>
                    </ul>
                </div>

                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="basic-info" role="tabpanel" aria-labelledby="info-tab" tabindex="0">
                        <div class="modal-body pb-0">
                            <div class="row">

                                <asp:HiddenField ID="hfUserId" runat="server" />
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                <asp:HiddenField ID="hfProfilePicture" runat="server" />
                                <div class="col-md-12">
                                    <div class="d-flex align-items-center flex-wrap row-gap-3 bg-light w-100 rounded p-3 mb-4">

                                        <asp:Image ID="imgProfile"
                                            runat="server"
                                            CssClass="avatar avatar-xxl rounded-circle border border-dashed me-2 flex-shrink-0"
                                            ImageUrl="~/uploads/user/man1.jpg" />

                                        <div class="profile-upload">
                                            <div class="mb-2">
                                                <h6 class="mb-1">Upload Profile Image</h6>
                                                <p class="fs-12">Image should be below 4 mb</p>
                                            </div>

                                            <div class="profile-uploader d-flex align-items-center">
                                                <div class="drag-upload-btn btn btn-sm btn-primary me-2">
                                                    Upload
                                                    <asp:FileUpload ID="fuProfilePicture"
                                                        runat="server"
                                                        CssClass="form-control image-sign" />
                                                </div>

                                                <button type="button" class="btn btn-light btn-sm">
                                                    Cancel
                                                </button>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">First Name <span class="text-danger">*</span></label>
                                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Last Name</label>
                                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Email <span class="text-danger">*</span></label>
                                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Password <span class="text-danger">*</span></label>
                                        <div class="pass-group">
                                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="pass-input form-control" />
                                            <span class="ti toggle-password ti-eye-off"></span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Joining Date <span class="text-danger">*</span></label>
                                        <asp:TextBox ID="txtDateOfJoining" runat="server" TextMode="Date" CssClass="form-control" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Birth Date <span class="text-danger">*</span></label>
                                        <asp:TextBox ID="txtDateOfBirth" runat="server" TextMode="Date" CssClass="form-control" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Role</label>
                                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control" />
                                        <div class="error-msg text-danger" style="display: none;"></div>
                                    </div>
                                </div>

                                <div class="col-md-6" id="departmentContainer">
                                    <div class="mb-3">
                                        <label class="form-label">Department</label>
                                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control" />
                                        <div class="error-msg text-danger" style="display: none;"></div>
                                    </div>
                                </div>

                                <div class="col-md-6" id="managerContainer">
                                    <div class="mb-3">
                                        <label class="form-label">Manager</label>
                                        <asp:DropDownList ID="ddlManager" runat="server" CssClass="form-control" />
                                        <div class="error-msg text-danger" style="display: none;"></div>
                                    </div>
                                </div>

                                <div class="col-md-6" id="designationContainer">
                                    <div class="mb-3">
                                        <label class="form-label">Designation</label>
                                        <asp:DropDownList ID="ddlDesignation" runat="server" CssClass="form-control" />
                                        <div class="error-msg text-danger" style="display: none;"></div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Phone Number <span class="text-danger">*</span></label>
                                        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Address<span class="text-danger">*</span></label>
                                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Gender</label>
                                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="">Select</asp:ListItem>
                                            <asp:ListItem Value="Male">Male</asp:ListItem>
                                            <asp:ListItem Value="Female">Female</asp:ListItem>
                                        </asp:DropDownList>
                                        <div class="error-msg text-danger" style="display: none;"></div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Status</label>
                                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="">Select</asp:ListItem>
                                            <asp:ListItem Value="Active">Active</asp:ListItem>
                                            <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                                        </asp:DropDownList>
                                        <div class="error-msg text-danger" style="display: none;"></div>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label class="form-label">About <span class="text-danger">*</span></label>
                                        <asp:TextBox ID="txtAboutEmployee" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" />
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-light border me-2" data-bs-dismiss="modal">Cancel</button>
                            <asp:Button ID="btnAddEmployee" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnAddEmployee_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#table').DataTable({
                pageLength: 5,
                lengthMenu: [5, 10, 25, 50, 100]
            });
        });
    </script>

</asp:Content>
