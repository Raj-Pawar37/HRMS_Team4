<%@ Page Title="Employee Document List" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeBehind="FetchEmployeeDocName.aspx.cs" Inherits="HRMS_Team4.Admin.FetchEmployeeDocName" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap5.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        #FetchEmployeeDocNameTable th,
        #FetchEmployeeDocNameTable td {
            text-align: center;
            border-right: none !important;
            border-left: none !important;
            vertical-align: middle;
        }
        div.dt-container .dt-search input {
            margin-left: 0.5em;
            display: inline-block;
            width: auto;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
        <div class="my-auto mb-2">
            <h2 class="mb-1">Employee Document Types</h2>
            <nav>
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="Default.aspx"><i class="ti ti-smart-home"></i></a></li>
                    <li class="breadcrumb-item">Master Documents</li>
                    <li class="breadcrumb-item active" aria-current="page">Employee Document List</li>
                </ol>
            </nav>
        </div>
        <div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
            <div class="mb-2">
                <a class="btn btn-primary d-flex align-items-center" href="<%= ResolveUrl("~/Admin/AddEmployeeDocName.aspx") %>">
                    <i class="bi bi-plus-circle me-2"></i>Add Document
                </a>
            </div>
        </div>
    </div>

    <br />

    <asp:Label ID="lblMessage" runat="server" Font-Bold="true" CssClass="mb-3 d-block"></asp:Label>

    <div class="card w-100">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h5 class="mb-0">All Employee Document Types</h5>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered mt-4" id="FetchEmployeeDocNameTable" style="width: 100%;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Document Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptEmpDocs" runat="server" OnItemCommand="rptEmpDocs_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Id") %></td>
                                    <td><%# Eval("DocName") %></td>
                                    <td>
                                        <a href='<%# ResolveUrl("~/Admin/EditEmployeeDocName.aspx?id=" + Eval("Id")) %>' title="Edit" class="text-primary me-3 text-decoration-none">
                                            <i class="bi bi-pencil-square" style="font-size: 22px;"></i>
                                        </a>

                                        <asp:LinkButton ID="lnkDelete" runat="server" CssClass="text-danger text-decoration-none"
                                            CommandName="DeleteDoc" 
                                            CommandArgument='<%# Eval("Id") %>' 
                                            OnClientClick="return confirm('Are you sure you want to delete this document type?');" title="Delete">
                                            <i class="bi bi-trash3" style="font-size: 22px;"></i>
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/2.0.8/js/dataTables.js"></script>
<script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap5.js"></script>

<script>
    $(document).ready(function () {

        // Prevent reinitialization error
        if ($.fn.DataTable.isDataTable('#FetchEmployeeDocNameTable')) {
            $('#FetchEmployeeDocNameTable').DataTable().destroy();
        }

        $('#FetchEmployeeDocNameTable').DataTable({
            paging: true,
            searching: true,
            ordering: true,
            info: true,
            lengthChange: true,
            pageLength: 5,
            lengthMenu: [5, 10, 25, 50, 100],

            language: {
                lengthMenu: "Rows Per Page _MENU_ Entries",
                search: "Search:",
                emptyTable: "No records found.",
                info: "Showing _START_ to _END_ of _TOTAL_ entries",
                paginate: {
                    first: "First",
                    last: "Last",
                    next: "Next",
                    previous: "Previous"
                }
            }
        });

    });
</script>
</asp:Content>