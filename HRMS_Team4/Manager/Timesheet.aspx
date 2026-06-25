<%@ Page Title="" Language="C#" MasterPageFile="~/Manager/Manager.Master" AutoEventWireup="true" CodeBehind="Timesheet.aspx.cs" Inherits="HRMS_Team4.Manager.Timesheet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
function selectAll(source) {
    let grid = document.getElementById("GridView1");
    let checkboxes = grid.querySelectorAll("input[type='checkbox']");

    for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i] !== source) {
            checkboxes[i].checked = source.checked;
        }
    }
}
</script> 
<div class="content">

        <!-- Breadcrumb -->
        <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
            <div class="my-auto mb-2">
                <h2 class="mb-1">Timesheets</h2>

                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item">
                            <a href="#">
                                <i class="ti ti-smart-home"></i>
                            </a>
                        </li>

                        <li class="breadcrumb-item">
                            Employee
                        </li>

                        <li class="breadcrumb-item active">
                            Timesheets
                        </li>
                    </ol>
                   
                </nav>
            </div>

            <div class="mb-2">
            </div>
        </div>

        <!-- Card -->
        <div class="card">

            <div class="card-header">
                <h5 class="mb-0">Timesheet</h5>
            </div>

            <div class="card-body">

                <div class="table-responsive">
                    <asp:Button ID="btnApprove"
                        runat="server"
                        Text="Approved"
                        CssClass="btn btn-success me-2"
                        OnClick="btnApprove_Click" />

                    <asp:Button ID="btnReject"
                        runat="server"
                        Text="Rejected"
                        CssClass="btn btn-danger"
                        OnClick="btnReject_Click" />
                    <asp:GridView
                        ID="GridView1"
                        runat="server"
                        ClientIDMode="Static"
                        AutoGenerateColumns="False"
                        CssClass="table datatable"
                        GridLines="None"
                        >
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HiddenField ID="hfId" runat="server" Value='<%# Eval("TimesheetId") %>' />
                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                </ItemTemplate>

                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkAll" runat="server" onclick="selectAll(this)" />
                                </HeaderTemplate>
                            </asp:TemplateField>

                            
                            <asp:TemplateField HeaderText="Employee">
                                <ItemTemplate>

                                    <div class="d-flex align-items-center file-name-icon">

                                        <a class="avatar avatar-md border avatar-rounded">

                                            <img src='<%# ResolveUrl("~/" + Eval("ProfilePicture")) %>'
                                                class="img-fluid"
                                                alt="Profile" />

                                        </a>

                                        <div class="ms-2">

                                            <h6 class="fw-medium mb-0">
                                                <%# Eval("EmployeeName") %>
                                            </h6>

                                        </div>

                                    </div>

                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField
                                DataField="CreatedAt"
                                HeaderText="Date"
                                DataFormatString="{0:dd MMM yyyy}" />

                         
                            <asp:TemplateField HeaderText="Project">
                                <ItemTemplate>

                                    <p class="fs-14 fw-medium text-gray-9 mb-0">
                                        <%# Eval("ProjectName") %>
                                    </p>

                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField
                                DataField="WorkHours"
                                HeaderText="Worked Hours" />

                            
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>

                                    <span class='<%#
                                        Eval("Status").ToString()=="Approved"
                                        ? "badge bg-success"

                                        : Eval("Status").ToString()=="Rejected"
                                        ? "badge bg-danger"

                                        : "badge bg-warning"
                                    %>'>

                                        <%# Eval("Status") %>

                                    </span>

                                </ItemTemplate>
                            </asp:TemplateField>

                          
                        </Columns>

                    </asp:GridView>

                </div>

            </div>

        </div>

    </div>

</asp:Content>


