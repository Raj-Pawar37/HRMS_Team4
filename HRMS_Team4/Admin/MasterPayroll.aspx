
<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="MasterPayroll.aspx.cs" Inherits="HRMS_Team4.Admin.MasterPayroll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="content">

<style>
.payroll-btns {
    display:flex;
    justify-content:space-between;
    gap:15px;
}
.dropdown { flex:1; position:relative; }
.dropdown-menu {
    position:absolute !important;
    z-index:1050;
    top:100%;
}
</style>

<!-- TOP BUTTONS -->
<div class="d-flex flex-wrap justify-content-between my-4">

    <div class="payroll-btns">

        <!-- EARNING -->
        <div class="dropdown">
            <a class="dropdown-toggle btn btn-white border" data-bs-toggle="dropdown">
                Earning
            </a>
            <ul class="dropdown-menu p-3">
                <li>
                    <asp:HyperLink runat="server"
                        NavigateUrl="~/Earning/EarningType"
                        CssClass="dropdown-item">
                        Earning Type
                    </asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink runat="server"
                        NavigateUrl="~/Earning/Earning"
                        CssClass="dropdown-item">
                        Earning
                    </asp:HyperLink>
                </li>
            </ul>
        </div>

        <!-- DEDUCTION -->
        <div class="dropdown">
            <a class="dropdown-toggle btn btn-white border" data-bs-toggle="dropdown">
                Deduction
            </a>
            <ul class="dropdown-menu p-3">
                <li>
                    <asp:HyperLink runat="server"
                        NavigateUrl="~/Deduction/DeductionType"
                        CssClass="dropdown-item">
                        Deduction Type
                    </asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink runat="server"
                        NavigateUrl="~/Deduction/Deduction"
                        CssClass="dropdown-item">
                        Deduction
                    </asp:HyperLink>
                </li>
            </ul>
        </div>

    </div>

    <!-- OPEN MODAL -->
    <button type="button"
        class="btn btn-primary d-flex align-items-center"
        data-bs-toggle="modal"
        data-bs-target="#earning_type">

        <i class="ti ti-circle-plus me-2"></i>
        Add Earning Type
    </button>

</div>

<!-- GRIDVIEW (IMPORTANT FIX) -->
<div class="card-body p-0">



    <div class="table-responsive">

        <asp:GridView ID="gvEarningType"
    runat="server"
    AutoGenerateColumns="False"
    CssClass="table table-bordered"
    DataKeyNames="EarnTypeId"
    OnRowCommand="gvEarningType_RowCommand">

            <Columns>

                <asp:BoundField DataField="EarnTypeId" HeaderText="Id" />
<asp:BoundField DataField="EarningName" HeaderText="Earning Type Name" />

                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
<asp:LinkButton runat="server"
    CommandName="EditRow"
    CommandArgument='<%# Eval("EarnTypeId") %>'
    CausesValidation="false"
    OnClientClick="return true;">
    <i class="ti ti-edit"></i>
</asp:LinkButton>

                        &nbsp;

                        <asp:LinkButton runat="server"
                        CommandName="DeleteRow"
                        CommandArgument='<%# Eval("EarnTypeId") %>'>
                        <i class="ti ti-trash"></i>
                    </asp:LinkButton>

                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

        </asp:GridView>

    </div>
</div>

<!-- ADD MODAL -->
<div class="modal fade" id="earning_type">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <h5>Add Earning Type</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">

                <asp:TextBox ID="txtEarningName"
                    runat="server"
                    CssClass="form-control"
                    placeholder="Enter Earning Type Name" />

            </div>

            <div class="modal-footer">

                <asp:Button ID="btnSave"
                    runat="server"
                    Text="Save"
                    CssClass="btn btn-primary"
                    OnClick="btnSave_Click" />

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    Cancel
                </button>

            </div>

        </div>
    </div>
</div>

<!-- EDIT MODAL -->
<div class="modal fade" id="editearningtype">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <h5>Edit Earning Type</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">

                <asp:HiddenField ID="hdnId" runat="server" />

                <asp:TextBox ID="txtEditEarningName"
                    runat="server"
                    CssClass="form-control" />

            </div>

            <div class="modal-footer">

                <asp:Button ID="btnUpdate"
                    runat="server"
                    Text="Update"
                    CssClass="btn btn-primary"
                    OnClick="btnUpdate_Click" />

                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    Cancel
                </button>

            </div>

        </div>
    </div>
</div>

</div>

</asp:Content>