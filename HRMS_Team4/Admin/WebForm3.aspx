<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="HRMS_Team4.Admin.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
        <div class="my-auto mb-2">
            <h2 class="mb-1">Helpdesk & Support Workspace</h2>
            <nav>
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="index.html"><i class="ti ti-smart-home"></i></a></li>
                    <li class="breadcrumb-item active" aria-current="page">Raise Ticket</li>
                </ol>
            </nav>
        </div>
        <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">
            <div class="mb-2">
                <button type="button" data-bs-toggle="modal" data-bs-target="#modal_raise_ticket" class="btn btn-primary d-flex align-items-center">
                    <i class="ti ti-circle-plus me-2"></i>Raise New Ticket
                </button>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            <h5>Active Helpdesk Management Matrix</h5>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table datatable mb-0">
                    <thead class="thead-light">
                        <tr>
                            <th>ID</th>
                            <th>Ticket Title & Context</th>
                            <th>Raised By</th>
                            <th>Date Raised</th>
                            <th>Assigned To</th>
                            <th>Status</th>
                            <th>Attachment</th>
                            <th class="text-end">Action Interface Controls</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptTickets" runat="server" OnItemCommand="rptTickets_ItemCommand" OnItemDataBound="rptTickets_ItemDataBound">
                            <ItemTemplate>
                                <tr>
                                    <td>#<%# Eval("Id") %></td>
                                    <td>
                                        <span class="fw-bold d-block text-dark"><%# Eval("TicketName") %></span>
                                        <small class="text-muted d-block text-wrap" style="max-width: 250px;"><%# Eval("Description") %></small>
                                    </td>
                                    <td><%# Eval("RaisedByName") %></td>
                                    <td><%# Convert.ToDateTime(Eval("RaisedAt")).ToString("dd MMM yyyy HH:mm") %></td>
                                    <td>
                                        <%# string.IsNullOrEmpty(Eval("AssignedToName").ToString()) ? "<em class='text-muted'>Unassigned</em>" : Eval("AssignedToName") %>
                                    </td>
                                    <td>
                                        <span class='badge <%# GetStatusClass(Eval("Status").ToString()) %>'>
                                            <%# Eval("Status") %>
                                        </span>
                                    </td>
                                    <td>
                                        <%# string.IsNullOrEmpty(Eval("Attachment").ToString()) ? "None" : "<a href='" + ResolveUrl(Eval("Attachment").ToString()) + "' target='_blank' class='btn btn-xs btn-outline-secondary'><i class='ti ti-download'></i> View</a>" %>
                                    </td>
                                    <td class="text-end">
                                        <asp:LinkButton ID="btnOpenAssignModal" runat="server" CommandName="OpenAssign" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-info me-1 text-white" Visible="false">
                                            <i class="ti ti-user-plus me-1"></i> Assign Task
                                        </asp:LinkButton>

                                        <asp:LinkButton ID="btnOpenResolveModal" runat="server" CommandName="OpenResolve" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-success me-1 text-white" Visible="false">
                                            <i class="ti ti-check me-1"></i> Resolve Ticket
                                        </asp:LinkButton>

                                        <asp:LinkButton ID="btnViewSolution" runat="server" CommandName="ViewSolution" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-sm btn-secondary me-1 text-white" Visible="false">
                                            <i class="ti ti-eye me-1"></i> View Solution
                                        </asp:LinkButton>
                                        
                                        <span class="text-muted text-xs" id="lblNoAction" runat="server" visible="false">Locked</span>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal_raise_ticket" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Create Ticket Request</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Ticket Title / Name</label>
                        <asp:TextBox ID="txtTicketName" runat="server" CssClass="form-control" placeholder="Brief statement of error..."></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Detailed Description</label>
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" placeholder="Provide troubleshooting details..."></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">File Attachment Log</label>
                        <asp:FileUpload ID="fileAttachment" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnSubmitTicket" runat="server" Text="File Ticket" CssClass="btn btn-primary" OnClick="btnSubmitTicket_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal_manager_assign" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg-info text-white">
                    <h5 class="modal-title">Delegate System Ticket Ownership</h5>
                    <button type="button" class="btn-close text-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:HiddenField ID="hfSelectedTicketId" runat="server" />
                    <div class="mb-3">
                        <label class="form-label fw-bold">Select Active Resource:</label>
                        <asp:DropDownList ID="ddlEmployees" runat="server" CssClass="form-select"></asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Dismiss</button>
                    <asp:Button ID="btnConfirmAssignment" runat="server" Text="Confirm Assignment" CssClass="btn btn-info text-white" OnClick="btnConfirmAssignment_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal_employee_resolve" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title">Resolve and Close Ticket Workflow</h5>
                    <button type="button" class="btn-close text-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:HiddenField ID="hfResolveTicketId" runat="server" />
                    <div class="mb-3">
                        <label class="form-label fw-bold">Resolution Post-Mortem Description:</label>
                        <asp:TextBox ID="txtResolutionNotes" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" placeholder="Document the modifications deployed to address this error..."></asp:TextBox>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Abort</button>
                    <asp:Button ID="btnConfirmResolution" runat="server" Text="Submit Resolution" CssClass="btn btn-success" OnClick="btnConfirmResolution_Click" />
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modal_view_solution" data-bs-backdrop="static" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg-secondary text-white">
                    <h5 class="modal-title"><i class="ti ti-info-circle me-1"></i> Resolution Summary Logs</h5>
                    <button type="button" class="btn-close text-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label fw-bold text-dark">Ticket Title Summary:</label>
                        <asp:TextBox ID="txtViewTicketName" runat="server" CssClass="form-control-plaintext fw-semibold" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold text-dark">Resolution Post-Mortem Log Description:</label>
                        <asp:TextBox ID="txtViewResolutionDescription" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control bg-light" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light shadow-sm border" data-bs-dismiss="modal">Close Window</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
