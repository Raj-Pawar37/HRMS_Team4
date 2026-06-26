<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="TaskBoard.aspx.cs" Inherits="HRMS_Team4.Admin.TaskBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div b-ietxc090g4="" class="content">




        <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
            <div class="my-auto mb-2">
                <h2 class="mb-1">Task Board</h2>
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item">
                            <a href="index.html"><i class="ti ti-smart-home"></i></a>
                        </li>
                        <li class="breadcrumb-item">Projects
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Task Board</li>
                    </ol>
                </nav>
            </div>
            <div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
                <div class="dropdown me-2">
                    <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                        <i class="ti ti-file-export me-2"></i>Export
                    </a>
                    <ul class="dropdown-menu  dropdown-menu-end p-3">
                        <li>
                            <a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-pdf me-1"></i>Export as PDF</a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-xls me-1"></i>Export as Excel </a>
                        </li>
                    </ul>
                </div>
                <button type="button"
                    class="btn btn-primary d-inline-flex align-items-center"
                    data-bs-toggle="modal"
                    data-bs-target="#addBoardModal">

                    <i class="ti ti-circle-plus me-1"></i>Add New Board
                </button>
                <div class="head-icons ms-2 mb-0">
                    <a href="javascript:void(0);" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
                        <i class="ti ti-chevrons-up"></i>
                    </a>
                </div>
            </div>
        </div>

        <div class="card">

            <asp:Repeater ID="rptProjects" runat="server" OnItemDataBound="rptProjects_ItemDataBound">
                <itemtemplate>

                    <div class="card mb-4">

                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h3><%# Eval("ProjectName") %></h3>

                            <div>
                                Total Task :
                    <asp:Label ID="lblTotal" runat="server" />

                                Pending :
                    <asp:Label ID="lblPending" runat="server" />

                                Completed :
                    <asp:Label ID="lblCompleted" runat="server" />
                            </div>
                        </div>

                        <div class="card-body">
                            <div class="kanban-board d-flex flex-wrap">

                                <!-- Pending -->
                                <div class="kanban-column flex-fill p-2" style="min-width: 250px;">
                                    <h4 class="text-center bg-light p-3 rounded">Pending</h4>

                                    <asp:Repeater ID="rptPending" runat="server">
                                        <itemtemplate>
                                            <div class="card kanban-card mb-3 shadow-sm">
                                                <div class="card-body">
                                                    <span class="badge bg-outline-dark"><%# Eval("Priority") %></span>
                                                    <h6 class="mt-2"><%# Eval("Title") %></h6>
                                                    <div class="progress progress-sm mb-2">
                                                        <div class="progress-bar bg-warning"
                                                            style='width: <%# Eval("Percentage") %>%'>
                                                            <%# Eval("Percentage") %>%
   
                                                        </div>
                                                    </div>
                                                    <p>Due on: <%# Convert.ToDateTime(Eval("Deadline")).ToString("dd MMM yyyy") %></p>
                                                </div>
                                            </div>
                                        </itemtemplate>
                                    </asp:Repeater>
                                </div>

                                <!-- Inprogress -->
                                <div class="kanban-column flex-fill p-2" style="min-width: 250px;">
                                    <h4 class="text-center bg-light p-3 rounded">Inprogress</h4>

                                    <asp:Repeater ID="rptInprogress" runat="server">
                                        <itemtemplate>
                                            <div class="card kanban-card mb-3 shadow-sm">
                                                <div class="card-body">
                                                    <span class="badge bg-outline-dark"><%# Eval("Priority") %></span>
                                                    <h6 class="mt-2"><%# Eval("Title") %></h6>
                                                    <div class="progress progress-sm mb-2">
                                                        <div class="progress-bar bg-warning"
                                                            style='width: <%# Eval("Percentage") %>%'>
                                                            <%# Eval("Percentage") %>%
   
                                                        </div>
                                                    </div>
                                                    <p>Due on: <%# Convert.ToDateTime(Eval("Deadline")).ToString("dd MMM yyyy") %></p>
                                                </div>
                                            </div>
                                        </itemtemplate>
                                    </asp:Repeater>
                                </div>

                                <!-- Onhold -->
                                <div class="kanban-column flex-fill p-2" style="min-width: 250px;">
                                    <h4 class="text-center bg-light p-3 rounded">Onhold</h4>

                                    <asp:Repeater ID="rptOnhold" runat="server">
                                        <itemtemplate>
                                            <div class="card kanban-card mb-3 shadow-sm">
                                                <div class="card-body">
                                                    <span class="badge bg-outline-dark"><%# Eval("Priority") %></span>
                                                    <h6 class="mt-2"><%# Eval("Title") %></h6>
                                                    <div class="progress progress-sm mb-2">
                                                        <div class="progress-bar bg-warning"
                                                            style='width: <%# Eval("Percentage") %>%'>
                                                            <%# Eval("Percentage") %>%
   
                                                        </div>
                                                    </div>
                                                    <p>Due on: <%# Convert.ToDateTime(Eval("Deadline")).ToString("dd MMM yyyy") %></p>
                                                </div>
                                            </div>
                                        </itemtemplate>
                                    </asp:Repeater>
                                </div>

                                <!-- Completed -->
                                <div class="kanban-column flex-fill p-2" style="min-width: 250px;">
                                    <h4 class="text-center bg-light p-3 rounded">Completed</h4>

                                    <asp:Repeater ID="rptCompleted" runat="server">
                                        <itemtemplate>
                                            <div class="card kanban-card mb-3 shadow-sm">
                                                <div class="card-body">
                                                    <span class="badge bg-outline-dark"><%# Eval("Priority") %></span>
                                                    <h6 class="mt-2"><%# Eval("Title") %></h6>
                                                    <div class="progress progress-sm mb-2">
                                                        <div class="progress-bar bg-warning"
                                                            style='width: <%# Eval("Percentage") %>%'>
                                                            <%# Eval("Percentage") %>%
   
                                                        </div>
                                                    </div>
                                                    <p>Due on: <%# Convert.ToDateTime(Eval("Deadline")).ToString("dd MMM yyyy") %></p>
                                                </div>
                                            </div>
                                        </itemtemplate>
                                    </asp:Repeater>
                                </div>

                            </div>
                        </div>

                    </div>

                </itemtemplate>
            </asp:Repeater>


        </div>










        <%--modal--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />


        <div class="modal fade" id="addBoardModal" tabindex="-1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">



                    <div class="modal-header">
                        <h5 class="modal-title">Add / Update Task Board</h5>

                        <button type="button"
                            class="btn-close"
                            data-bs-dismiss="modal">
                        </button>
                    </div>

                    <div class="modal-body">

                        <asp:UpdatePanel ID="upBoardModal" runat="server" UpdateMode="Conditional">
                            <contenttemplate>

                                <div class="mb-3">
                                    <label>Project</label>

                                    <asp:DropDownList ID="ddlProject"
                                        runat="server"
                                        CssClass="form-select"
                                        AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlProject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>

                                <div class="mb-3">
                                    <label>Task</label>

                                    <asp:DropDownList ID="ddlTask"
                                        runat="server"
                                        CssClass="form-select">
                                    </asp:DropDownList>
                                </div>

                                <div class="mb-3">
                                    <label>Percentage</label>

                                    <asp:TextBox ID="txtPercentage"
                                        runat="server"
                                        CssClass="form-control"
                                        TextMode="Number">
                                    </asp:TextBox>
                                </div>

                                <div class="mb-3">
                                    <label>Due Date</label>

                                    <asp:TextBox ID="txtDueDate"
                                        runat="server"
                                        CssClass="form-control"
                                        TextMode="Date">
                                    </asp:TextBox>
                                </div>
                    </div>

                    </ContentTemplate>
                </asp:UpdatePanel>

                    <div class="modal-footer">
                        <button type="button"
                            class="btn btn-secondary"
                            data-bs-dismiss="modal">
                            Close
                        </button>

                        <asp:Button ID="btnSave"
                            runat="server"
                            CssClass="btn btn-primary"
                            Text="Save"
                            OnClick="btnSave_Click" />
                    </div>


                </div>
            </div>
        </div>
</asp:Content>
