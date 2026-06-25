<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Resignation.aspx.cs" Inherits="HRMS_Team4.Admin.Resignation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid mt-4">
<div class="d-flex justify-content-between align-items-center mb-3">

    <h3>Resignation List</h3>

    <div class="d-flex">

        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control me-2"  Width="250px" placeholder="Search Employee..." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged">  </asp:TextBox>

        <button type="button" class="btn btn-primary" onclick="openModal();">

            Add Resignation

        </button>

    </div>

</div>
        <div class="mb-3">

    <asp:DropDownList ID="ddlSort" runat="server"  CssClass="form-select"  Width="220px"  AutoPostBack="true" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">

        <asp:ListItem Text="Sort Ascending" Value="ASC"></asp:ListItem>
        <asp:ListItem Text="Sort Descending" Value="DESC"></asp:ListItem>

    </asp:DropDownList>

</div>

        <asp:GridView ID="gvResignation" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">

            <Columns>

                <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />

                <asp:BoundField DataField="DepartmentName" HeaderText="Department" />

                <asp:BoundField DataField="Reason" HeaderText="Reason" />

                <asp:BoundField DataField="NoticeDate" HeaderText="Notice Date" DataFormatString="{0:dd-MM-yyyy}" />

                <asp:BoundField DataField="ResignDate" HeaderText="Resignation Date" DataFormatString="{0:dd-MM-yyyy}" />

               <asp:TemplateField HeaderText="Action">
    <ItemTemplate>

        <asp:LinkButton ID="btnEdit"  runat="server" CssClass="btn btn-warning btn-sm me-1" CommandArgument='<%# Eval("ResignationId") %>' OnClick="btnEdit_Click">
            ✏️ </asp:LinkButton>

        <asp:LinkButton ID="btnDelete"  runat="server" CssClass="btn btn-danger btn-sm"  CommandArgument='<%# Eval("ResignationId") %>' OnClick="btnDelete_Click">
            🗑️ </asp:LinkButton>

    </ItemTemplate>
</asp:TemplateField>

            </Columns>

        </asp:GridView>

    </div>



    <div class="modal fade" id="resignationModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                   <h5 id="resignationModalLabel">Add Resignation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                   <asp:HiddenField ID="hfResignationId" runat="server" />

                    <div class="mb-3">
                        <label>Employee ID</label>
                        <asp:TextBox ID="txtUserID" runat="server" CssClass="form-control">  </asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label>Department ID</label>
                        <asp:TextBox ID="txtDepartmentID" runat="server" CssClass="form-control">
                        </asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label>Notice Date</label>
                        <asp:TextBox ID="txtNoticeDate" runat="server" TextMode="Date" CssClass="form-control"> </asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label>Resignation Date</label>
                        <asp:TextBox ID="txtResignDate" runat="server" TextMode="Date" CssClass="form-control">
                        </asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label>Reason</label>
                        <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control">
                        </asp:TextBox>
                    </div>

                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" />

                </div>

            </div>
        </div>
    </div>

    <script>

        function openModal() {
            var modal =
                new bootstrap.Modal(document.getElementById('resignationModal'));
            modal.show();
        }

    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


</asp:Content>