<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="TrainersType.aspx.cs" Inherits="HRMS_Team4.Admin.TrainersType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   

            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                <div class="my-auto mb-2">
                    <h2 class="mb-1">Training Type</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="index.html"><i class="ti ti-smart-home"></i></a>
                            </li>
                            <li class="breadcrumb-item">
                                Performance
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Training Type</li>
                        </ol>
                    </nav>
                </div>
                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
                    <div class="mb-2">
                        <a href="#" data-bs-toggle="modal" data-bs-target="#add_training_type" class="btn btn-primary d-flex align-items-center"><i class="ti ti-circle-plus me-2"></i>Add Training type</a>
                    </div>
                    <div class="head-icons ms-2">
                        <a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
                            <i class="ti ti-chevrons-up"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                    <h5>Training Type List</h5>
                    <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
                        
                      <div class="dropdown">
    <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown" id="lblSortText" runat="server">
        Sort By : Recently Added
    </a>
    <ul class="dropdown-menu dropdown-menu-end p-3">
        <li><asp:LinkButton ID="btnSortRecent" runat="server" CssClass="dropdown-item rounded-1" OnClick="SortFilter_Click" CommandArgument="Recently Added">Recently Added</asp:LinkButton></li>
        <li><asp:LinkButton ID="btnSortAsc" runat="server" CssClass="dropdown-item rounded-1" OnClick="SortFilter_Click" CommandArgument="Ascending">Ascending (A-Z)</asp:LinkButton></li>
        <li><asp:LinkButton ID="btnSortDesc" runat="server" CssClass="dropdown-item rounded-1" OnClick="SortFilter_Click" CommandArgument="Descending">Descending (Z-A)</asp:LinkButton></li>
    </ul>
               </div>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="custom-datatable-filter table-responsive">
                        <table class="table datatable">
                            <thead class="thead-light">
                                <tr>
                                    <th class="no-sort">
                                        <div class="form-check form-check-md">
                                            <input class="form-check-input" type="checkbox" id="select-all">
                                        </div>
                                    </th>
                                    <th>Type</th>
                                    <th>Description</th>
                                    <th>Status</th>
                                    <th></th>
                                </tr>
                            </thead>
                            
                            <tbody>
                                <asp:Repeater ID="rptTrainingTypes" runat="server" OnItemCommand="rptTrainingTypes_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <div class="form-check form-check-md">
                                                    <input class="form-check-input" type="checkbox">
                                                </div>
                                            </td>
                                            <td>
                                                <a href="#"><%# Eval("TrainingTypeName") %></a>
                                            </td>
                                            <td>
                                                <%# Eval("Description") %>
                                            </td>
                                              <td>
                                                <span class='badge <%# Eval("Status").ToString()=="Active" ? "bg-success" : "bg-danger" %>'>
                                                    <i class="ti ti-point-filled me-1"></i>
                                                    <%# Eval("Status") %>
                                                </span>
                                            </td>
                                                <td>
                                                <div class="action-icon d-inline-flex">
                                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("TrainingTypeId") %>' CssClass="me-2 text-primary"><i class="ti ti-edit"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("TrainingTypeId") %>' CssClass="text-danger" OnClientClick="return confirm('WARNING: Are you sure you want to permanently delete this Training Type?');"><i class="ti ti-trash"></i></asp:LinkButton>
                                                </div>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            </table>
                    </div>
                </div>
            </div>
           

        <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
            <p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
            <p>Designed &amp; Developed By <a href="javascript:void(0);" class="text-primary">Dreams</a></p>
        </div>

    
    
    <div class="modal fade" id="add_training_type">
        <div class="modal-dialog modal-dialog-centered modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Training Type</h4>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>
                <div class="modal-body pb-0">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Type</label>
                                <asp:TextBox ID="txtTrainingType" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>  
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                            </div>  
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Status</label>
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="select form-control">
                                    <asp:ListItem Text="Select" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Active" Value="Active" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light me-2" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnAddTrainingType" runat="server" CssClass="btn btn-primary" Text="Add Training Type" OnClick="btnAddTrainingType_Click" />
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="edit_training_type">
        <div class="modal-dialog modal-dialog-centered modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Edit Training Type</h4>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>
                <div class="modal-body pb-0">
                    <div class="row">
                        <asp:HiddenField ID="hfEditId" runat="server" />
                        
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Type</label>
                                <asp:TextBox ID="txtEditType" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>  
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <asp:TextBox ID="txtEditDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                            </div>  
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Status</label>
                                <asp:DropDownList ID="ddlEditStatus" runat="server" CssClass="select form-control">
                                    <asp:ListItem Text="Select" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                    <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light me-2" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnUpdateTrainingType" runat="server" CssClass="btn btn-primary" Text="Save Changes" OnClick="btnUpdateTrainingType_Click" />
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="delete_modal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <span class="avatar avatar-xl bg-transparent-danger text-danger mb-3">
                        <i class="ti ti-trash-x fs-36"></i>
                    </span>
                    <h4 class="mb-1">Confirm Delete</h4>
                    <p class="mb-3">You want to delete all the marked items, this cant be undone once you delete.</p>
                    <div class="d-flex justify-content-center">
                        <a href="javascript:void(0);" class="btn btn-light me-3" data-bs-dismiss="modal">Cancel</a>
                        <a href="training-type.html" class="btn btn-danger">Yes, Delete</a>
                    </div>
                </div>
            </div>
       </div>
        </div>
</asp:Content>