<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Designation.aspx.cs" Inherits="HRMS_Team4.Admin.Designation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Breadcrumb -->
    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
        <div class="my-auto mb-2">
            <h2 class="mb-1">Designations</h2>
            <nav>
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item">
                        <a href="<%= ResolveUrl("~/Admin/Dashboard.aspx") %>">
                            <i class="ti ti-smart-home"></i>
                        </a></li>
                    <li class="breadcrumb-item">Employee
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Designations</li>
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
                    data-bs-target="#DesignationModal"
                    class="btn btn-primary d-flex align-items-center">
                    <i class="ti ti-circle-plus me-2"></i>Add Designation
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
            <h5>Designation List</h5>
            <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">

                <div class="dropdown me-3">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="">Status</asp:ListItem>
                        <asp:ListItem Value="Active">Active</asp:ListItem>
                        <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                    </asp:DropDownList>
                </div>


            </div>
        </div>
        <div class="card-body p-0">
            <div class="custom-datatable-filter table-responsive">
                <div id="table_wrapper" class="dt-container dt-empty-footer">

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
                                <thead class="table-dark">
                                    <tr>
                                        <th scope="col" data-dt-column="0" rowspan="1" colspan="1" class="dt-type-numeric dt-orderable-asc dt-orderable-desc dt-ordering-asc" aria-sort="ascending" aria-label="Id: Activate to invert sorting"><span class="dt-column-title">Id</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="1" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="Name: Activate to sort"><span class="dt-column-title">Name</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="2" rowspan="1" colspan="1" class="dt-type-numeric dt-orderable-asc dt-orderable-desc" aria-label="NoOfEmp: Activate to sort"><span class="dt-column-title">Department Name</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="3" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="Status: Activate to sort"><span class="dt-column-title">Status</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="4" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="CreatedBy: Activate to sort"><span class="dt-column-title">CreatedBy</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="5" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="ModifiedBy: Activate to sort"><span class="dt-column-title">ModifiedBy</span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                        <th scope="col" data-dt-column="6" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label=": Activate to sort"><span class="dt-column-title"></span><span class="dt-column-order" role="button" tabindex="0"></span></th>
                                    </tr>
                                </thead>
                                <tbody id="mydata">
                                    <asp:Repeater ID="rptDesignations" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("DesignationId") %></td>
                                                <td><%# Eval("Name") %></td>
                                                <td><%# Eval("DepartmentName") %></td>

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
                                                        CommandArgument='<%# Eval("DesignationId") %>'
                                                        OnClick="btnEdit_Click">
                                                        <i class="ti ti-edit"></i>
                                                    </asp:LinkButton>

                                                    <asp:LinkButton ID="btnDelete" runat="server"
                                                        CommandArgument='<%# Eval("DesignationId") %>'
                                                        OnClick="btnDelete_Click"
                                                        OnClientClick="return confirm('Are you sure you want to delete this Designation?');">
                                                        <i class="ti ti-trash"></i>
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
                </div>
            </div>
        </div>

        <hr />

    </div>









    <%--Model Body--%>
    <div class="modal fade" id="DesignationModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <asp:Label ID="modelHeader" runat="server" Text="Add Designation"></asp:Label>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>
                <div class="modal-body pb-0">
                    <div class="row">
                        <asp:HiddenField ID="hfDesignationId" runat="server" />
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Designation Name</label>
                                <asp:TextBox ID="txtDesignationName" runat="server" CssClass="form-control" />
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Department</label>
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>


                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Status</label>
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="">Select</asp:ListItem>
                                    <asp:ListItem Value="Active">Active</asp:ListItem>
                                    <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>


                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light me-2" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnAddDesignation"
                        runat="server"
                        Text="Add Designation"
                        CssClass="btn btn-primary"
                        OnClick="btnAddDesignation_Click" />
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
