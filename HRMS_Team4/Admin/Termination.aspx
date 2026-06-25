<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Termination.aspx.cs" Inherits="HRMS_Team4.Admin.Termination1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
    <div class="my-auto mb-2">
        <h2 class="mb-1">Termination</h2>
    </div>

    <div>
        <button type="button"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addTerminationModal"> Add Termination </button>
    </div>
</div>
    <div class="modal fade" id="addTerminationModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title">Add Termination</h5>
                <button type="button"  class="btn-close" data-bs-dismiss="modal"> </button>
            </div>

            <div class="modal-body">

                <div class="mb-3">
                    <label>Employee</label>
                    <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="form-control"> </asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label>Termination Type</label>
                    <asp:TextBox ID="txtTerminationType" runat="server" CssClass="form-control"> </asp:TextBox>
                </div>

                <div class="mb-3">
                    <label>Notice Date</label>
                    <asp:TextBox ID="txtNoticeDate" runat="server" TextMode="Date" CssClass="form-control">
                    </asp:TextBox>
                </div>

                <div class="mb-3">
                    <label>Resign Date</label>
                    <asp:TextBox ID="txtResignDate" runat="server" TextMode="Date" CssClass="form-control">
                    </asp:TextBox>
                </div>

                <div class="mb-3">
                    <label>Reason</label>
                    <asp:TextBox ID="txtReason" runat="server"
                        TextMode="MultiLine"
                        Rows="3"
                        CssClass="form-control">
                    </asp:TextBox>
                </div>

                <asp:Button ID="btnSave"
                    runat="server"
                    Text="Save"
                    CssClass="btn btn-primary"
                    OnClick="btnSave_Click" />

            </div>

        </div>
    </div>
</div>
    <div class="modal fade" id="editTerminationModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title">Edit Termination</h5>
                <button type="button"
                    class="btn-close"
                    data-bs-dismiss="modal">
                </button>
            </div>

            <div class="modal-body">

                <asp:HiddenField ID="hfTerminationId"
                    runat="server" />

                <div class="mb-3">
                    <label>Employee</label>
                    <asp:DropDownList ID="ddlEditEmployee"
                        runat="server"
                        CssClass="form-control">
                    </asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label>Termination Type</label>
                    <asp:TextBox ID="txtEditTerminationType"
                        runat="server"
                        CssClass="form-control">
                    </asp:TextBox>
                </div>

                <div class="mb-3">
                    <label>Notice Date</label>
                    <asp:TextBox ID="txtEditNoticeDate"
                        runat="server"
                        TextMode="Date"
                        CssClass="form-control">
                    </asp:TextBox>
                </div>

                <div class="mb-3">
                    <label>Resign Date</label>
                    <asp:TextBox ID="txtEditResignDate"
                        runat="server"
                        TextMode="Date"
                        CssClass="form-control">
                    </asp:TextBox>
                </div>

                <div class="mb-3">
                    <label>Reason</label>
                    <asp:TextBox ID="txtEditReason"
                        runat="server"
                        TextMode="MultiLine"
                        Rows="3"
                        CssClass="form-control">
                    </asp:TextBox>
                </div>

                <asp:Button ID="btnUpdate"
                    runat="server"
                    Text="Update"
                    CssClass="btn btn-success"
                    OnClick="btnUpdate_Click" />

            </div>

        </div>
    </div>
</div>
    <div class="card">
    <div class="card-header">
        <h5>Termination List</h5>
    </div>

    <div class="card-body">

        <asp:GridView ID="gvTermination"
            runat="server"
            AutoGenerateColumns="False"
            CssClass="table table-bordered table-striped">

            <Columns>

                <asp:BoundField DataField="EmployeeName"
                    HeaderText="Employee Name" />

                <asp:BoundField DataField="TerminationType"
                    HeaderText="Termination Type" />

                <asp:BoundField DataField="NoticeDate"
                    HeaderText="Notice Date"
                    DataFormatString="{0:yyyy-MM-dd}" />

                <asp:BoundField DataField="ResignDate"
                    HeaderText="Resign Date"
                    DataFormatString="{0:yyyy-MM-dd}" />

                <asp:BoundField DataField="Reason"
                    HeaderText="Reason" />

                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>

                        <asp:LinkButton ID="btnEdit"
                            runat="server"
                            CssClass="btn btn-warning btn-sm"
                            CommandArgument='<%# Eval("TerminationId") %>'
                            OnClick="btnEdit_Click">
                            Edit
                        </asp:LinkButton>

                        <asp:LinkButton ID="btnDelete"
                            runat="server"
                            CssClass="btn btn-danger btn-sm ms-2"
                            CommandArgument='<%# Eval("TerminationId") %>'
                            OnClick="btnDelete_Click"
                            OnClientClick="return confirm('Delete this record?');">
                            Delete
                        </asp:LinkButton>

                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

        </asp:GridView>

    </div>
</div>
       
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>