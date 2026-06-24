<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DepartmentLeaveDetails.aspx.cs" Inherits="HRMS_Team4.Admin.DepartmentLeaveDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
  </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <script>
$(function () {
    $('#<%= GridView1.ClientID %>').DataTable({
            pageLength: 5,
            lengthMenu: [[5, 10, 25, -1], [5, 10, 25, "All"]]
        });
    });
</script>
        <!-- Breadcrumb -->
        <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
            <div class="my-auto mb-2">
                <h2 class="mb-1">Leaves</h2>
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item">
                            <a href="index.aspx"><i class="ti ti-smart-home"></i></a>
                        </li>
                        <li class="breadcrumb-item">Admin</li>
                        <li class="breadcrumb-item active">Department Leave Allocation</li>
                    </ol>
                </nav>
            </div>
        </div>
    
 

        <!-- Card -->
        <div class="card">

            <div class="card-header">
                <h5 class="mb-0">Department Leave Details</h5>
            </div>

            <div class="card-body table-responsive">

                <!-- GridView -->
                <asp:GridView ID="GridView1"
                    runat="server"
                    CssClass="table table-bordered table-striped"       
                    AutoGenerateColumns="False"
                    DataKeyNames="LeaveId" >

                    <Columns>

                        <asp:BoundField DataField="DepartmentName"
                            HeaderText="Department Name" />

                        <asp:BoundField DataField="LeaveType"
                            HeaderText="Leave Type" />

                        <asp:BoundField DataField="NoOfLeaves"
                            HeaderText="No. of Leaves" />

                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span class="badge badge-success">
                                    Active
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete"
                                    runat="server" 
                                    CommandArgument='<%# Eval("LeaveId") %>'
                                     OnClick="LnkDelete_Click"
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

    


</asp:Content>
