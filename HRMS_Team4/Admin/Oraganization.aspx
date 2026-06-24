<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Oraganization.aspx.cs" Inherits="HRMS_Team4.Admin.Oraganization" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div b-ietxc090g4="" class="content">








        <style>
            #UploadDocumentListTable th,
            #UploadDocumentListTable td {
                text-align: center;
                border-right: none !important;
                border-left: none !important;
            }
        </style>


        <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
            <div class="my-auto mb-2">
                <h2 class="mb-1">Organizations List</h2>
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item">
                            <a href="index.html"><i class="ti ti-smart-home"></i></a>
                        </li>
                        <li class="breadcrumb-item">Organizations</li>
                        <li class="breadcrumb-item active" aria-current="page">Organizations List</li>
                    </ol>
                </nav>
            </div>
            <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">
                <div class="mb-2">
                    <div class="d-flex my-xl-auto right-content align-items-center">
                        <a class="btn btn-primary d-flex align-items-center"
                            href="javascript:void(0);"
                            data-bs-toggle="modal"
                            data-bs-target="#addOrganizationModal">
                            <i class="ti ti-circle-plus me-2"></i>Add Organizations
                        </a>
                    </div>
                </div>
                <div class="head-icons ms-2">
                    <a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
                        <i class="ti ti-chevrons-up"></i>
                    </a>
                </div>
            </div>
        </div>

        <br>
        <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                <h5 class="mb-0">Organizations List</h5>
            </div>
            <div class="card-body">
                <div id="OrgTable_wrapper" class="dt-container dt-empty-footer">
                    <div class="dt-layout-row dt-layout-table">
                        <div class="dt-layout-cell dt-layout-full table-responsive">
                            <table class="table table-bordered mt-4" id="OrgTable">
                                <thead>
                                    <tr>
                                        <th>OrganizationName</th>
                                        <th>OrganizationAddress</th>
                                        <th>OrganizationPhone</th>
                                        <th>OrganizationEmail</th>
                                        <th>OrganizationLogo</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <asp:Repeater ID="rptOrganizations" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("OrganizationName") %></td>
                                                <td><%# Eval("OrganizationAddress") %></td>
                                                <td><%# Eval("OrganizationPhone") %></td>
                                                <td><%# Eval("OrganizationEmail") %></td>
                                                <td>
                                                    <img src='<%# Eval("OrganizationLogo") %>' style="width: 100px; height: auto;" />
                                                </td>
                                                <td>
                                                    <asp:LinkButton ID="btnEdit" runat="server"
                                                        CommandArgument='<%# Eval("OrganizationId") %>'
                                                        OnClick="btnEdit_Click">
                                                        <i class="ti ti-edit"></i>
                                                    </asp:LinkButton>

                                                    <asp:LinkButton ID="btnDelete" runat="server"
                                                        CommandArgument='<%# Eval("OrganizationId") %>'
                                                        OnClick="btnDelete_Click"
                                                        OnClientClick="return confirm('Are you sure to delete this data?');">
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
            </div>
        </div>





    </div>




    <div class="modal fade" id="addOrganizationModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">Add Organization</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Add Organization</h3>
                        </div>

                        <div class="card-body">

                            <div class="row">

                                <div class="col-md-6">
                                    <asp:HiddenField ID="hfOrganizationId" runat="server" />
                                    <asp:HiddenField ID="hfLogo" runat="server" />
                                    <div class="form-group mb-3">
                                        <label>Organization Name</label>
                                        <div class="input-group">
                                            <asp:TextBox
                                                ID="txtOrganizationName"
                                                runat="server"
                                                CssClass="form-control">
                                            </asp:TextBox>

                                            <span class="input-group-text">
                                                <i class="ti ti-user"></i>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Organization Contact</label>
                                        <div class="input-group">
                                            <asp:TextBox
                                                ID="txtOrganizationPhone"
                                                runat="server"
                                                CssClass="form-control">
                                            </asp:TextBox>

                                            <span class="input-group-text">
                                                <i class="ti ti-phone"></i>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Organization Address</label>

                                        <asp:TextBox
                                            ID="txtOrganizationAddress"
                                            runat="server"
                                            TextMode="MultiLine"
                                            Rows="4"
                                            CssClass="form-control">
                                        </asp:TextBox>
                                    </div>

                                </div>

                                <div class="col-md-6">

                                    <div class="form-group mb-3">
                                        <label>Organization Email</label>
                                        <div class="input-group">

                                            <asp:TextBox
                                                ID="txtOrganizationEmail"
                                                runat="server"
                                                CssClass="form-control">
                                            </asp:TextBox>

                                            <span class="input-group-text">
                                                <i class="ti ti-mail"></i>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Organization Logo</label>

                                        <asp:FileUpload
                                            ID="fuOrganizationLogo"
                                            runat="server"
                                            CssClass="form-control" />
                                    </div>

                                    <div class="form-group mb-3">
                                        <label>Organization Description</label>

                                        <asp:TextBox
                                            ID="txtOrganizationDescription"
                                            runat="server"
                                            TextMode="MultiLine"
                                            Rows="4"
                                            CssClass="form-control">
                                        </asp:TextBox>
                                    </div>

                                </div>

                            </div>

                            <div class="form-group mt-3">

                                <asp:Button
                                    ID="btnSave"
                                    runat="server"
                                    Text="Save"
                                    CssClass="btn btn-primary"
                                    OnClick="btnSave_Click" />

                                <button type="button"
                                    class="btn btn-secondary"
                                    data-bs-dismiss="modal">
                                    Close
                                </button>

                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <script>
        $(function () {
            $('#OrgTable').DataTable({
                pageLength: 5,
                lengthMenu: [5, 10, 25, 50, 100]
            });
        });
    </script>


</asp:Content>
