<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="TrainingList.aspx.cs" Inherits="HRMS_Team4.Admin.TrainingList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                <div class="my-auto mb-2">
                    <h2 class="mb-1">Training</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="index.html"><i class="ti ti-smart-home"></i></a></li>
                            <li class="breadcrumb-item">Performance</li>
                            <li class="breadcrumb-item active" aria-current="page">Training List</li>
                             </ol>
                    </nav>
                </div>
                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
                    <div class="mb-2">
                        <a href="#" data-bs-toggle="modal" data-bs-target="#add_training" class="btn btn-primary d-flex align-items-center"><i class="ti ti-circle-plus me-2"></i>Add Training</a>
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
                    <h5>Training List</h5>
                      <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
      
     <div class="dropdown">
    <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown" id="lblSortText" runat="server">
        Sort By : Recently Added
    </a>
    <ul class="dropdown-menu dropdown-menu-end p-3">
        <li><asp:LinkButton ID="btnSortRecent" runat="server" CssClass="dropdown-item rounded-1" OnClick="SortFilter_Click" CommandArgument="Recently Added">Recently Added</asp:LinkButton></li>
        <li><asp:LinkButton ID="btnSortAsc" runat="server" CssClass="dropdown-item rounded-1" OnClick="SortFilter_Click" CommandArgument="Ascending">Asc (A-Z)</asp:LinkButton></li>
        <li><asp:LinkButton ID="btnSortDesc" runat="server" CssClass="dropdown-item rounded-1" OnClick="SortFilter_Click" CommandArgument="Descending">Des (Z-A)</asp:LinkButton></li>
        <li><asp:LinkButton ID="btnSort7Days" runat="server" CssClass="dropdown-item rounded-1" OnClick="SortFilter_Click" CommandArgument="Last 7 Days">Last 7 Days</asp:LinkButton></li>
        <li><asp:LinkButton ID="btnSortMonth" runat="server" CssClass="dropdown-item rounded-1" OnClick="SortFilter_Click" CommandArgument="Last Month">Last Month</asp:LinkButton></li>
    </ul>
</div>
  </div>
                </div>
                <div class="card-body p-0">
                    <div class="custom-datatable-filter table-responsive">
                        <table class="table datatable">
                            
     <thead class ="thead-light">
    <tr>
        <th class="no-sort">
            <div class="form-check form-check-md">
                <input class="form-check-input" type="checkbox" id="select-all" />
            </div>
        </th>

        <th>Training Type</th>
        <th>Trainer</th>
        <th>Employee</th>
        <th>Time Duration</th>
        <th>Description</th>
        <th>Cost</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
</thead>

<tbody>
    <asp:Repeater ID="rptTraining" runat="server" OnItemCommand="rptTraining_ItemCommand">
        <ItemTemplate>

            <tr>

                <!-- Checkbox Column -->
                <td>
                    <div class="form-check form-check-md">
                        <input class="form-check-input row-checkbox" type="checkbox" />
                    </div>
                </td>

                <!-- Training Type -->
                <td>
                    <%# Eval("TrainingTypeName") %>
                </td>

                <!-- Trainer -->
                <td>
                    <div class="d-flex align-items-center file-name-icon">
                        <div class="ms-2">
                            <h6 class="fw-medium mb-0">
                                <%# Eval("TrainerName") %>
                            </h6>
                        </div>
                    </div>
                </td>

                <!-- Employee -->
                <td>
                    <span class="badge bg-light text-dark">
                        <%# Eval("EmployeeName") %>
                    </span>
                </td>

                <!-- Duration -->
                <td>
                    <%# Convert.ToDateTime(Eval("StartDate")).ToString("dd MMM yyyy") %>
                    -
                    <%# Convert.ToDateTime(Eval("EndDate")).ToString("dd MMM yyyy") %>
                </td>

                <!-- Description -->
                <td>
                    <%# Eval("Description") %>
                </td>

                <!-- Cost -->
                <td>
                    ₹ <%# Eval("TrainingCost") %>
                </td>

                <!-- Status -->
                <td>
                    <span class='badge <%# Eval("Status").ToString()=="Active" ? "bg-success" : "bg-danger" %>'>
                        <i class="ti ti-point-filled me-1"></i>
                        <%# Eval("Status") %>
                    </span>
                </td>

                <!-- Action -->
                <td>
                    <div class="action-icon d-inline-flex">

                        <asp:LinkButton
                            ID="btnEdit"
                            runat="server"
                            CommandName="Edit"
                            CommandArgument='<%# Eval("TrainingId") %>'
                            CssClass="me-2 text-primary">
                            <i class="ti ti-edit"></i>
                        </asp:LinkButton>

                        <asp:LinkButton
                            ID="btnDelete"
                            runat="server"
                            CommandName="Delete"
                            CommandArgument='<%# Eval("TrainingId") %>'
                            CssClass="text-danger"
                            OnClientClick="return confirm('WARNING: Are you sure you want to permanently delete this?');">
                            <i class="ti ti-trash"></i>
                        </asp:LinkButton>

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
        

    <div class="modal fade" id="add_training">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Training</h4>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>
                <div class="modal-body pb-0">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Training Type</label>
                               <asp:DropDownList ID="ddlTrainingType" runat="server" CssClass="select form-control">
                            </asp:DropDownList>
                            </div>  
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Trainer</label>
                              <asp:DropDownList ID="ddlTrainer" runat="server" CssClass="select form-control">
                             </asp:DropDownList>
                            </div>  
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Employee (User)</label>
                                <asp:DropDownList ID="ddlUser" runat="server" CssClass="select form-control">
                            </asp:DropDownList>
                            </div>  
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Training Cost</label>
                                <asp:TextBox ID="txtCost" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>  
                        </div>
                        
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Start Date</label>
                                <div class="input-icon-end position-relative">
                                    <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control datetimepicker" placeholder="dd/mm/yyyy"></asp:TextBox>
                                    <span class="input-icon-addon">
                                        <i class="ti ti-calendar text-gray-7"></i>
                                    </span>
                                </div>
                            </div>  
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">End Date</label>
                                <div class="input-icon-end position-relative">
                                    <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control datetimepicker" placeholder="dd/mm/yyyy"></asp:TextBox>
                                    <span class="input-icon-addon">
                                        <i class="ti ti-calendar text-gray-7"></i>
                                    </span>
                                </div>
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
                                    <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                    <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light me-2" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnAddTraining" runat="server" CssClass="btn btn-primary" Text="Add Training" UseSubmitBehavior="false" OnClick="btnAddTraining_Click" />
                </div>
            </div>
       </div>
        </div>
    <script>
document.addEventListener("DOMContentLoaded", function () {

    const selectAll = document.getElementById("select-all");

    if (selectAll) {
        selectAll.addEventListener("change", function () {

            document.querySelectorAll(".row-checkbox")
                .forEach(cb => cb.checked = this.checked);

        });
    }

});
    </script>
</asp:Content>