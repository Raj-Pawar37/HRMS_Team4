<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="TimeSheet.aspx.cs" Inherits="HRMS_Team4.User.TimeSheet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

          <script>
$(function () {
    $('#<%= gvTimesheet.ClientID %>').DataTable({
        pageLength: 5,
        lengthMenu: [[5, 10, 25, -1], [5, 10, 25, "All"]]
    });
})</script>

<div class="content">

    <h2>Timesheet</h2>

    <!-- ACTION BAR -->
    <div class="mb-3">

        <!-- Export -->
        <asp:Button ID="btnExportPdf" runat="server" Text="Export PDF"
            CssClass="btn btn-danger" OnClick="btnExportPdf_Click" />

        <asp:Button ID="btnExportExcel" runat="server" Text="Export Excel"
            CssClass="btn btn-success" OnClick="btnExportExcel_Click" />

        <!-- Add Modal Trigger -->
        <button type="button" class="btn btn-primary"
            data-bs-toggle="modal" data-bs-target="#addModal">
            Add Timesheet
        </button>

        <!-- Send Approval -->
        <asp:HiddenField ID="hiddenIds" runat="server" />

        <asp:Button ID="btnSendForApproval" runat="server"
            Text="Send for Approval"
            CssClass="btn btn-warning"
            OnClick="btnSendForApproval_Click"
            OnClientClick="collectSelectedIds();"
            Enabled="false" />
    </div>

    <!-- GRID -->
    <asp:GridView ID="gvTimesheet" runat="server" AutoGenerateColumns="False"
        CssClass="table table-bordered"
        OnRowDataBound="gvTimesheet_RowDataBound">

        <Columns>

           
            <asp:TemplateField>
                <HeaderTemplate>
                    <input type="checkbox" onclick="toggleSelectAll(this)" />
                </HeaderTemplate>
                <ItemTemplate>
                    <input type="checkbox"
                        class="rowCheckbox"
                        data-id='<%# Eval("TimesheetId") %>'
                        onclick="toggleSendButton()" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="EmployeeName" HeaderText="Employee" />
            <asp:BoundField DataField="ProjectName" HeaderText="Project" />
            <asp:BoundField DataField="Date" HeaderText="Date" />
            <asp:BoundField DataField="WorkHours" HeaderText="Worked Hours" />
            <asp:TemplateField HeaderText="Status">
    <ItemTemplate>
        <span class='<%# GetStatusClass(Eval("Status").ToString()) %>'>
            <%# Eval("Status") %>
        </span>
    </ItemTemplate>
</asp:TemplateField>

        </Columns>
    </asp:GridView>


    <!-- MODAL -->
    <div class="modal fade" id="addModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <h5>Add Timesheet</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">

                    Project:
                    <asp:DropDownList ID="ddlProject" runat="server" CssClass="form-control" />

                    <br />

                    Date:
                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date" />

                    <br />

                    Hours:
                    <asp:TextBox ID="txtHours" runat="server" CssClass="form-control" TextMode="Number" />

                </div>

                <div class="modal-footer">
                    <asp:Button ID="btnAdd" runat="server"
                        Text="Add"
                        CssClass="btn btn-primary"
                        OnClick="btnAdd_Click" />
                </div>

            </div>
        </div>
    </div>

</div>

</asp:Content>