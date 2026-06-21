<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="HRMS_Team4.Admin.Department" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Breadcrumb -->
    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
        <div class="my-auto mb-2">
            <h2 class="mb-1">Departments</h2>
            <nav>
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item">
                        <a href="<%= ResolveUrl("~/Admin/Dashboard.aspx") %>">
                            <i class="ti ti-smart-home"></i>
                        </a></li>
                    <li class="breadcrumb-item">Employee
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Departments</li>
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
                    data-bs-target="#departmentModal"
                    class="btn btn-primary d-flex align-items-center">
                    <i class="ti ti-circle-plus me-2"></i>Add Department
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
    <!-- Performance Indicator list -->
    <div class="card">
        <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
            <h5>Department List</h5>
            <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">

                <div class="dropdown me-3">
                    <select id="sts" class="form-control" fdprocessedid="d86fj">
                        <option value="select">Status</option>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>

                </div>


                <div class="dropdown">

                    <select id="opt" class="form-control" fdprocessedid="jqatds">
                        <option value="select">Sort By</option>
                        <option value="asc">ascending</option>
                        <option value="desc">descending</option>
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
                                <select aria-controls="table" class="dt-input" id="dt-length-0" fdprocessedid="zegt8">
                                    <option value="5">5</option>
                                    <option value="10">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
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
                                </colgroup>
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col" data-dt-column="0" rowspan="1" colspan="1" class="dt-type-numeric dt-orderable-asc dt-orderable-desc dt-ordering-asc" aria-sort="ascending" aria-label="Id: Activate to invert sorting"><span class="dt-column-title">Id</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="1" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="Name: Activate to sort"><span class="dt-column-title">Name</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="2" rowspan="1" colspan="1" class="dt-type-numeric dt-orderable-asc dt-orderable-desc" aria-label="NoOfEmp: Activate to sort"><span class="dt-column-title">NoOfEmp</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="3" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="Status: Activate to sort"><span class="dt-column-title">Status</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="4" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="CreatedBy: Activate to sort"><span class="dt-column-title">CreatedBy</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="5" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="ModifiedBy: Activate to sort"><span class="dt-column-title">ModifiedBy</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="6" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label=": Activate to sort"><span class="dt-column-title"></span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                    </tr>
                                </thead>
                                <tbody id="mydata">
                                    <asp:Repeater ID="rptDepartments" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("DepartmentId") %></td>
                                                <td><%# Eval("Name") %></td>
                                                <td><%# Eval("NoOfEmployee") %></td>

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
                                                        CommandArgument='<%# Eval("DepartmentId") %>'
                                                        OnClick="btnEdit_Click">
                                                        <i class="ti ti-edit"></i>
                                                    </asp:LinkButton>

                                                    <asp:LinkButton ID="btnDelete" runat="server"
                                                        CommandArgument='<%# Eval("DepartmentId") %>'
                                                        OnClick="btnDelete_Click"
                                                        OnClientClick="return confirm('Are you sure you want to delete this department?');">
                                                        <i class="bi bi-trash"></i>dl
                                                        <%--<i class="bi bi-trash"></i>--%>
                                                    </asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>



                                <tfoot></tfoot>
                            </table>
                        </div>
                    </div>
                    <div class="dt-layout-row">
                        <div class="dt-layout-cell dt-layout-start">
                            <div class="dt-info" aria-live="polite" id="table_info" role="status">Showing 1 to 5 of 5 entries</div>
                        </div>
                        <div class="dt-layout-cell dt-layout-end">
                            <div class="dt-paging">
                                <nav aria-label="pagination">
                                    <button class="dt-paging-button disabled first" role="link" type="button" aria-controls="table" aria-disabled="true" aria-label="First" data-dt-idx="first" tabindex="-1">«</button>
                                    <button class="dt-paging-button disabled previous" role="link" type="button" aria-controls="table" aria-disabled="true" aria-label="Previous" data-dt-idx="previous" tabindex="-1">‹</button>
                                    <button class="dt-paging-button current" role="link" type="button" aria-controls="table" aria-current="page" data-dt-idx="0" fdprocessedid="xcsvkr">1</button>
                                    <button class="dt-paging-button disabled next" role="link" type="button" aria-controls="table" aria-disabled="true" aria-label="Next" data-dt-idx="next" tabindex="-1">›</button>
                                    <button class="dt-paging-button disabled last" role="link" type="button" aria-controls="table" aria-disabled="true" aria-label="Last" data-dt-idx="last" tabindex="-1">»</button>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


       

    </div>
    <!-- /Performance Indicator list -->








    <%--Model Body--%>
    <div class="modal fade" id="departmentModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <asp:Label ID="modelHeader" runat="server" Text="Add Department"></asp:Label>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>
                <div class="modal-body pb-0">
                    <div class="row">
                        <asp:HiddenField ID="hfDepartmentId" runat="server" />
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Department Name</label>
                                <asp:TextBox ID="txtDepartmentName" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Status</label>
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="">Select</asp:ListItem>
                                    <asp:ListItem Value="1">Active</asp:ListItem>
                                    <asp:ListItem Value="0">Inactive</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light me-2" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnAddDepartment"
                        runat="server"
                        Text="Add Department"
                        CssClass="btn btn-primary"
                        OnClick="btnAddDepartment_Click" />
                </div>

            </div>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>


</asp:Content>

