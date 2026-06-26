<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Task.aspx.cs" Inherits="HRMS_Team4.Admin.Task" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <style>
        .project-scroll-container {
            height: 85vh; 
            overflow-y: auto;
        }
        .project-clickable-card {
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .project-clickable-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1) !important;
        }
        .rating-select .filled {
            color: #ffc107;
        }
    </style>
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="smTasks" runat="server" />

    <div class="content">
        <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
            <div class="my-auto mb-2">
                <h2 class="mb-1">Tasks</h2>
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="Dashboard.aspx"><i class="ti ti-smart-home"></i></a></li>
                        <li class="breadcrumb-item">Employee</li>
                        <li class="breadcrumb-item active" aria-current="page">Tasks</li>
                    </ol>
                </nav>
            </div>
            <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">
                <div class="mb-2">
                    <button type="button" class="btn btn-primary d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#modal_add_task">
                        <i class="ti ti-circle-plus me-2"></i>Add Task
                    </button>
                </div>
            </div>
        </div>

        <div class="container-fluid px-0 mb-3">
            <div class="row align-items-center row-gap-3">
                <div class="col-md-6">
                    <div class="d-flex align-items-center flex-wrap gap-2">
                        <h6 class="mb-0 me-2 text-muted">Priority</h6>
                        <div class="nav nav-pills border p-1 rounded bg-light">
                            <asp:Button ID="btnFilterAll" runat="server" Text="All" CssClass="nav-link btn-sm active border-0" OnClick="PriorityFilter_Click" CommandArgument="All" />
                            <asp:Button ID="btnFilterHigh" runat="server" Text="High" CssClass="nav-link btn-sm border-0" OnClick="PriorityFilter_Click" CommandArgument="High" />
                            <asp:Button ID="btnFilterMedium" runat="server" Text="Medium" CssClass="nav-link btn-sm border-0" OnClick="PriorityFilter_Click" CommandArgument="Medium" />
                            <asp:Button ID="btnFilterLow" runat="server" Text="Low" CssClass="nav-link btn-sm border-0" OnClick="PriorityFilter_Click" CommandArgument="Low" />
                        </div>
                    </div>
                </div>
                <div class="col-md-6 text-md-end">
                    <div class="d-inline-block position-relative">
                        <asp:TextBox ID="txtDueDateFilter" runat="server" TextMode="Date" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtDueDateFilter_TextChanged"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xl-4 project-scroll-container mb-4">
                <asp:Repeater ID="rptProjects" runat="server" OnItemDataBound="rptProjects_ItemDataBound" OnItemCommand="rptProjects_ItemCommand">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkProjectCard" runat="server" CommandName="SelectProject" CommandArgument='<%# Eval("ProjectId") %>' style="text-decoration:none; color:inherit;">
                            <div class="card mb-3 shadow-sm border project-clickable-card">
                                <div class="card-body">
                                    <div class="d-flex align-items-center pb-3 mb-3 border-bottom">
                                        <div class="flex-shrink-0 me-2">
                                            <img src='<%# ResolveUrl(string.IsNullOrEmpty(Eval("LogoPath").ToString()) ? "~/assets/images/users/user-dummy.jpg" : Eval("LogoPath").ToString()) %>' alt="Project Logo" style="width: 48px; height: 48px; object-fit: cover;" class="rounded border">
                                        </div>
                                        <div>
                                            <h6 class="mb-1 text-dark fw-semibold"><%# Eval("ProjectName") %></h6>
                                            <div class="d-flex align-items-center text-muted small">
                                                <span><asp:Literal ID="litTotalTasks" runat="server" /> tasks</span>
                                                <span class="mx-1"><i class="ti ti-point-filled text-primary"></i></span>
                                                <span><asp:Literal ID="litCompletedTasks" runat="server" /> Completed</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2 text-center">
                                        <div class="col-6 border-end">
                                            <span class="mb-1 d-block text-muted small">Deadline</span>
                                            <p class="fw-medium text-danger mb-0 small"><%# Eval("EndDate", "{0:dd MMM yyyy}") %></p>
                                        </div>
                                        <div class="col-6">
                                            <span class="mb-1 d-block text-muted small">Value</span>
                                            <p class="text-dark fw-semibold mb-0 small"><%# Eval("PriceType") %><%# Eval("ProjectValue", "{0:N0}") %></p>
                                        </div>
                                    </div>
                                    <div class="bg-light p-2 rounded">
                                        <small class="text-dark fw-bold"><asp:Literal ID="litPercentageText" runat="server" />% Completed</small>
                                        <div class="progress mt-1" style="height:5px;">
                                            <asp:Panel ID="pnlProgressBar" runat="server" CssClass="progress-bar bg-info" role="progressbar" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="col-xl-8 project-scroll-container">
                <asp:UpdatePanel ID="upTaskDetails" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pnlEmptyState" runat="server" CssClass="card p-5 text-center text-muted border-0 bg-transparent">
                            <div class="py-5">
                                <i class="ti ti-folder-open text-secondary mb-3" style="font-size: 4rem;"></i>
                                <p class="fs-15">Select a project profile from the list menu tracking framework layout allocation arrays.</p>
                            </div>
                        </asp:Panel>

                        <asp:Panel ID="pnlActiveState" runat="server" Visible="false">
                            <div class="tab-content">
                                <div class="tab-pane fade show active" role="tabpanel">
                                    <div class="card mb-3 shadow-sm border-0">
                                        <div class="card-body">
                                            <h5 class="mb-3 fw-bold text-dark"><asp:Label ID="lblSelectedProjectName" runat="server" /></h5>
                                            <div class="bg-light p-3 rounded">
                                                <span class="d-block mb-1 text-muted small fw-medium">Tasks Done</span>
                                                <h4 class="mb-2 fw-bold text-dark"><asp:Label ID="lblTasksFraction" runat="server" /></h4>
                                                <div class="progress progress-xs mb-2" style="height: 6px;">
                                                    <asp:Panel ID="pnlActiveProgressBar" runat="server" CssClass="progress-bar bg-info" role="progressbar" />
                                                </div>
                                                <p class="mb-0 text-muted small fw-bold"><asp:Label ID="lblActivePercentage" runat="server" />% Completed</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="list-group list-group-flush mb-4">
                                        <asp:Repeater ID="rptProjectTasks" runat="server">
                                            <ItemTemplate>
                                                <div class="list-group-item shadow-sm rounded mb-2 p-3 bg-white border">
                                                    <div class="row align-items-center row-gap-3">
                                                        <div class="col-lg-7 col-md-7">
                                                            <div class="todo-inbox-check d-flex align-items-center flex-wrap gap-2">
                                                                <span class="me-2 d-flex align-items-center"><i class="ti ti-grid-dots text-dark"></i></span>
                                                                <span class="me-2 d-flex align-items-center rating-select"><i class="ti ti-star-filled filled" style="color: #ffc107;"></i></span>
                                                                <div class="strike-info">
                                                                    <h4 class="fs-14 mb-0 fw-semibold text-dark"><%# Eval("Title") %></h4>
                                                                </div>
                                                                <span class="badge bg-transparent-dark text-dark rounded-pill ms-2 small border">
                                                                    <i class="ti ti-calendar me-1"></i><%# Eval("Deadline", "{0:dd MMM yyyy}") %>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-5 col-md-5 text-md-end">
                                                            <div class="d-flex align-items-center justify-content-md-end flex-wrap gap-2">
                                                                <span class="badge px-2 py-1 bg-light text-primary border" style="font-size:0.75rem;"><%# Eval("Status") %></span>
                                                                <span class='badge px-2 py-1 border <%# Eval("Priority").ToString() == "High" ? "bg-light-danger text-danger border-danger-subtle" : "bg-light-warning text-warning border-warning-subtle" %>' style="font-size:0.75rem;">
                                                                    <%# Eval("Priority") %>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Panel ID="pnlNoTasks" runat="server" Visible='<%# rptProjectTasks.Items.Count == 0 %>' CssClass="text-center py-4 text-muted small bg-white border rounded">
                                                    No checklist tasks found linked inside this workspace profile.
                                                </asp:Panel>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal_add_task" tabindex="-1" aria-hidden="true" data-bs-backdrop="static">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content shadow-lg border-0">
                <div class="modal-header border-0 pb-0">
                    <h4 class="modal-title fw-bold text-dark">Add New Task</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="upModalFields" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="row row-gap-3">
                                <div class="col-12">
                                    <label class="form-label text-muted small fw-bold">Title</label>
                                    <asp:TextBox ID="txtModalTitle" runat="server" CssClass="form-control" placeholder="Enter Task Title Summary"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label text-muted small fw-bold">Due Date</label>
                                    <asp:TextBox ID="txtModalDueDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label text-muted small fw-bold">Select Project</label>
                                    <asp:DropDownList ID="ddlModalProject" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlModalProject_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label text-muted small fw-bold">Team Members</label>
                                    <asp:DropDownList ID="ddlModalTeam" runat="server" CssClass="form-select"></asp:DropDownList>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label text-muted small fw-bold">Status</label>
                                    <asp:DropDownList ID="ddlModalStatus" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="Select Status" Value="Pending"></asp:ListItem>
                                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                        <asp:ListItem Text="Inprogress" Value="Inprogress"></asp:ListItem>
                                        <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                                        <asp:ListItem Text="Onhold" Value="Onhold"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-12">
                                    <label class="form-label text-muted small fw-bold">Priority</label>
                                    <asp:DropDownList ID="ddlModalPriority" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="Select Priority" Value="Medium"></asp:ListItem>
                                        <asp:ListItem Text="High" Value="High"></asp:ListItem>
                                        <asp:ListItem Text="Medium" Value="Medium"></asp:ListItem>
                                        <asp:ListItem Text="Low" Value="Low"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-12">
                                    <label class="form-label text-muted small fw-bold">Description</label>
                                    <asp:TextBox ID="txtModalDesc" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="Add detailed instructions..."></asp:TextBox>
                                </div>
                                <div class="col-12">
                                    <label class="form-label text-muted small fw-bold">Upload Attachment</label>
                                    <asp:FileUpload ID="fuModalAttachment" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlModalProject" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer border-0">
                    <button type="button" class="btn btn-light shadow-sm border px-4" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnModalSaveTask" runat="server" Text="Save Task" CssClass="btn btn-orange px-4 text-white" style="background-color:#ff5e24; border:none;" OnClick="btnModalSaveTask_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
