<%@ Page Title="Uploaded Documents List" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeBehind="fetchempdoc.aspx.cs" Inherits="HRMS_Team4.Admin.fetchempdoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet" />

    <style>
        #FetchDocList th, #FetchDocList td {
            text-align: center;
            vertical-align: middle;
            border-right: none !important;
            border-left: none !important;
        }
        
        /* Adds a nice hover effect to the action icons */
        .action-icon {
            font-size: 1.2rem;
            transition: 0.2s;
        }
        .action-icon:hover {
            transform: scale(1.1);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
        <div class="my-auto mb-2">
            <h2 class="mb-1">Uploaded Documents List</h2>
            <nav>
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="Default.aspx"><i class="ti ti-smart-home"></i></a></li>
                    <li class="breadcrumb-item">Documents</li>
                    <li class="breadcrumb-item active" aria-current="page">Document List</li>
                </ol>
            </nav>
        </div>
      
    </div>

    <asp:Label ID="lblMessage" runat="server" Font-Bold="true" CssClass="mb-3 d-block"></asp:Label>

    <div class="card">
        <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
            <h5 class="mb-0">All Uploaded Documents</h5>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                
                <table class="table table-bordered mt-4" id="FetchDocList" style="width: 100%;">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Employee Email</th>
                            <th>Document Type</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptDocs" runat="server" OnItemCommand="rptDocs_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("AdminDocId") %></td>
                                    <td><%# Eval("Email") %></td>
                                    <td><%# Eval("DocName") %></td>
                                    <td>
                                        <a href='<%# ResolveUrl(Eval("DocFile").ToString()) %>' target="_blank" class="text-primary me-3 text-decoration-none action-icon" title="View">
                                            <i class="bi bi-eye"></i> 
                                        </a>

                                        <a href='<%# ResolveUrl(Eval("DocFile").ToString()) %>' download class="text-success me-3 text-decoration-none action-icon" title="Download">
                                            <i class="bi bi-download"></i> 
                                        </a>

                                        <asp:LinkButton ID="lnkDelete" runat="server" CssClass="text-danger text-decoration-none action-icon"
                                            CommandName="DeleteDoc" 
                                            CommandArgument='<%# Eval("AdminDocId") %>' 
                                            OnClientClick="return confirm('Are you sure you want to delete this document record?');" title="Delete">
                                            <i class="bi bi-trash3"></i> 
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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#FetchDocList').DataTable({
                "paging": true,
                "searching": true,
                "lengthChange": true,
                "pageLength": 10,
                "language": {
                    "lengthMenu": "Row Per Page _MENU_ Entries",
                    "search": "Search:",
                    "emptyTable": "No records found."
                }
            });
        });
    </script>
</asp:Content>