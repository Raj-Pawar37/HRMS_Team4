<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="LeaveType.aspx.cs" Inherits="HRMS_Team4.Admin.LeaveType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript">
$(function () {
    $('#<%= GridView1.ClientID %>').DataTable();
</script>
          <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
          <div class="my-auto mb-2">
              <h2 class="mb-1">Leaves</h2>
              <nav>
                  <ol class="breadcrumb mb-0">
                      <li class="breadcrumb-item">
                          <a href="index.aspx"><i class="ti ti-smart-home"></i></a>
                      </li>
                      <li class="breadcrumb-item">Admin</li>
                      <li class="breadcrumb-item active">Add Leave </li>
                  </ol>
              </nav>
          </div>
      </div>


	<div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h4>LeaveType List</h4>

        <asp:Button ID="Button1" runat="server"
            Text="Add Leave Type"
            CssClass="btn btn-primary"
            OnClick="Button1_Click" />
    </div>

    <div class="card-body">

        <div class="table-responsive">

			<div class="card mb-3">

    <div class="card-header">
        <h4>Add New Leave Type</h4>
    </div>

    <div class="card-body">

        <asp:Panel ID="Panel1" runat="server" Visible="false">

            <div class="mb-3">
                <asp:Label ID="Label1" runat="server"
                    Text="Leave Type"
                    CssClass="form-label">
                </asp:Label>

                <asp:TextBox ID="TextBox1" runat="server"
                    CssClass="form-control">
                </asp:TextBox>
            </div>

            <asp:Button ID="Button2" runat="server"
                Text="Submit"
                CssClass="btn btn-success"
                OnClick="Button2_Click" />

        </asp:Panel>
    </div>
	<!--<div style="margin-left: 640px">

		<asp:Button ID="Button3" runat="server" BackColor="White" Height="32px" OnClick="Button3_Click" Text="Search" Width="127px" />

	    <asp:TextBox ID="TextBox2" runat="server" Height="22px" Width="173px"></asp:TextBox>

	</div>
                -->
</div>


    <asp:GridView ID="GridView1"
    runat="server"
    AutoGenerateColumns="False"
    CssClass="table table-hover "
    GridLines="None">

    <Columns>
        <asp:BoundField DataField="LeaveType" HeaderText="Leave Type" />

        <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
                <span class="badge bg-success">
                    ● Active
                </span>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:LinkButton ID="lnkDelete"
                    runat="server"
                    CommandArgument='<%# Eval("LeaveTypeId") %>'
                    OnClick="lnkDelete_Click"
                    OnClientClick="return confirm('Are you sure you want to delete this leave type?');"
                    Style="display: inline-block; padding: 6px 10px; color: #dc3545; font-size: 1.2rem; text-decoration: none;">

                    <i class="ti ti-trash" style="pointer-events: none;"></i>

                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>

        </div>

    </div>
</div>

</asp:Content>
