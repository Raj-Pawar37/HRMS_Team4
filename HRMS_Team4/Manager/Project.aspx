<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="HRMS_Team4.Manager.Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
        <div class="my-auto mb-2">
            <h2 class="mb-1">Projects</h2>
            <nav>
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="#"><i class="ti ti-smart-home"></i></a></li>
                    <li class="breadcrumb-item">Core Modules</li>
                    <li class="breadcrumb-item active" aria-current="page">Project List</li>
                </ol>
            </nav>
        </div>
        <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">
            <div class="mb-2">
                <a href="#" data-bs-toggle="modal" data-bs-target="#add_project_modal" class="btn btn-primary d-flex align-items-center">
                    <i class="ti ti-circle-plus me-2"></i>Add Project
                </a>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
            <h5>Project List</h5>
        </div>
        
        <div class="card-body p-0">
            <div class="custom-datatable-filter table-responsive">
                <table class="table datatable">
                    <thead class="thead-light">
                        <tr>
                            <th style="width: 40px;"><input class="form-check-input" type="checkbox" id="select-all" /></th>
                            <th>Project Id</th>
                            <th>Project Name</th>
                            <th>Team Members</th>
                            <th>Deadline</th>
                            <th>Priority</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptProjects" runat="server" OnItemCommand="rptProjects_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td><input class="form-check-input row-checkbox" type="checkbox" /></td>
                                    <td><%# Eval("ProjectId") %></td>
                                    <td>
                                        <h6 class="fw-medium mb-0"><%# Eval("ProjectName") %></h6>
                                        <small class="text-muted"><%# Eval("ClientName") %></small>
                                    </td>
                                    <td><span class="badge bg-light text-dark"><%# Eval("TeamMembersList") %></span></td>
                                    <td><%# Convert.ToDateTime(Eval("EndDate")).ToString("yyyy-MM-dd") %></td>
                                    <td>
                                        <span class='badge <%# Eval("Priority").ToString() == "High" ? "bg-danger" : Eval("Priority").ToString() == "Medium" ? "bg-warning" : "bg-primary" %>'>
                                            <%# Eval("Priority") %>
                                        </span>
                                    </td>
                                    <td>
                                        <span class='badge <%# Eval("Status").ToString() == "Active" ? "bg-success" : "bg-danger" %>'>
                                            <%# Eval("Status") %>
                                        </span>
                                    </td>
                                    <td>
                                        <div class="action-icon d-inline-flex">
                                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("ProjectId") %>' CssClass="me-2 text-primary">
                                                <i class="ti ti-edit"></i>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("ProjectId") %>' CssClass="text-danger" OnClientClick="return confirm('WARNING: Are you sure you want to permanently delete this project?');">
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

    <div class="modal fade" id="add_project_modal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"><asp:Label ID="lblModalTitle" runat="server" Text="Add Project"></asp:Label></h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body pb-0">
                    <asp:HiddenField ID="hfProjectId" runat="server" Value="" />
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Project Name</label>
                            <asp:TextBox ID="txtProjectName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvProjectName" runat="server" ControlToValidate="txtProjectName" Display="Dynamic" ErrorMessage="Required" CssClass="text-danger" ValidationGroup="vgProj"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Client Name</label>
                            <asp:TextBox ID="txtClientName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvClientName" runat="server" ControlToValidate="txtClientName" Display="Dynamic" ErrorMessage="Required" CssClass="text-danger" ValidationGroup="vgProj"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Start Date</label>
                            <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">End Date (Deadline)</label>
                            <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Priority</label>
                            <asp:DropDownList ID="ddlPriority" runat="server" CssClass="form-select">
                                <asp:ListItem Value="High">High</asp:ListItem>
                                <asp:ListItem Value="Medium" Selected="True">Medium</asp:ListItem>
                                <asp:ListItem Value="Low">Low</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Status</label>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                                <asp:ListItem Value="Active">Active</asp:ListItem>
                                <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Project Value</label>
                            <asp:TextBox ID="txtProjectValue" runat="server" CssClass="form-control" Text="0"></asp:TextBox>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Price Type</label>
                            <asp:DropDownList ID="ddlPriceType" runat="server" CssClass="form-select">
                                <asp:ListItem Value="$">$</asp:ListItem>
                                <asp:ListItem Value="INR">INR (₹)</asp:ListItem>
                                <asp:ListItem Value="AFN">AFN</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Team Members</label>
                            <div class="dropdown">
                                <button class="btn btn-white dropdown-toggle w-100 text-start" type="button" id="teamDropdown" data-bs-toggle="dropdown" data-bs-auto-close="outside">
                                    Select Team Members
                                </button>
                                <div class="dropdown-menu p-3 w-100 checkbox-list-menu">
                                    <asp:CheckBoxList ID="cblTeamMembers" runat="server" CssClass="w-100" RepeatLayout="UnorderedList"></asp:CheckBoxList>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Manager Name</label>
                            <asp:DropDownList ID="ddlManagerName" runat="server" CssClass="form-select"></asp:DropDownList>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Upload Project Logo</label>
                            <asp:FileUpload ID="fileLogo" runat="server" CssClass="form-control" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Upload File</label>
                            <asp:FileUpload ID="fileProject" runat="server" CssClass="form-control" />
                        </div>
                        <div class="col-md-12 mb-3">
                            <label class="form-label">Description</label>
                            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnSave" runat="server" Text="Save Project" CssClass="btn btn-primary" OnClick="btnSave_Click" ValidationGroup="vgProj" />
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const selectAll = document.getElementById("select-all");
            if (selectAll) {
                selectAll.addEventListener("change", function () {
                    document.querySelectorAll(".row-checkbox").forEach(cb => cb.checked = this.checked);
                });
            }
        });
    </script>
</asp:Content>
