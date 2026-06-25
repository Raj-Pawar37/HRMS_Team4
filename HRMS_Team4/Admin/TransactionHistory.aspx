<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="TransactionHistory.aspx.cs" Inherits="HRMS_Team4.Admin.TransactionHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<link href="https://cdn.datatables.net/2.3.8/css/dataTables.dataTables.min.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" rel="stylesheet" />

<div class="content">

    <!-- Breadcrumb -->
    <div class="d-md-flex d-block align-items-center justify-content-between mb-3">

        <div>
            <h2 class="fw-bold">Transaction History</h2>

            <ol class="breadcrumb">
                <li class="breadcrumb-item">HR</li>
                <li class="breadcrumb-item active">Employee Salary</li>
            </ol>
        </div>

        <!-- Export -->
        <div class="dropdown">

            <button class="btn btn-light dropdown-toggle"
                data-bs-toggle="dropdown">

                <i class="fa fa-file-export"></i>
                Export

            </button>

            <ul class="dropdown-menu">

                <li>
                    <asp:LinkButton ID="btnExportPDF"
                        runat="server"
                        CssClass="dropdown-item"
                        OnClick="btnExportPDF_Click">

                        <i class="fa fa-file-pdf text-danger"></i>
                        Export PDF

                    </asp:LinkButton>
                </li>

                <li>
                    <asp:LinkButton ID="btnExportExcel"
                        runat="server"
                        CssClass="dropdown-item"
                        OnClick="btnExportExcel_Click">

                        <i class="fa fa-file-excel text-success"></i>
                        Export Excel

                    </asp:LinkButton>
                </li>

            </ul>

        </div>

    </div>


    <!-- Card -->
    <div class="card">

        <!-- Filters -->
        <div class="card-header">

            <div class="row">

                <div class="col-md-2">
                    <asp:DropDownList ID="ddlMonth"
                        runat="server"
                        CssClass="form-control">
                    </asp:DropDownList>
                </div>

                <div class="col-md-2">
                    <asp:DropDownList ID="ddlYear"
                        runat="server"
                        CssClass="form-control">
                    </asp:DropDownList>
                </div>

                <div class="col-md-3">
                    <asp:DropDownList ID="ddlDepartment"
                        runat="server"
                        CssClass="form-control">
                    </asp:DropDownList>
                </div>

                <div class="col-md-3">
                    <asp:DropDownList ID="ddlDesignation"
                        runat="server"
                        CssClass="form-control">
                    </asp:DropDownList>
                </div>

                <div class="col-md-2">

                    <asp:Button ID="btnApplyFilter"
                        runat="server"
                        Text="Apply Filters"
                        CssClass="btn btn-warning w-100"
                        OnClick="btnApplyFilter_Click" />

                </div>

            </div>

        </div>


        <!-- Table -->
        <div class="card-body">

            <div class="table-responsive">

                <asp:GridView ID="gvTransactionHistory"
    runat="server"
    AutoGenerateColumns="False"
    CssClass="table table-bordered table-hover"
    ClientIDMode="Static"
    AllowPaging="true"
    PageSize="10"
   
    OnPageIndexChanging="gvTransactionHistory_PageIndexChanging"
   
    OnRowCommand="gvTransactionHistory_RowCommand">

                    <Columns>

                       
                        <asp:BoundField DataField="UserId"
                            HeaderText="Emp ID" />


                        <asp:TemplateField HeaderText="Employee">

                            <ItemTemplate>

                                <div class="d-flex align-items-center">

                                    <img src='<%# Eval("ProfilePicture") %>'
                                        width="45"
                                        height="45"
                                        class="rounded-circle border" />

                                    <div class="ms-2">

                                        <b><%# Eval("EmployeeName") %></b>

                                        <br />

                                        <small class="text-muted">

                                            <%# Eval("DepartmentName") %>

                                        </small>

                                    </div>

                                </div>

                            </ItemTemplate>

                        </asp:TemplateField>


                       
                        <asp:BoundField DataField="Email"
                            HeaderText="Email" />

                      
                        <asp:BoundField DataField="PhoneNumber"
                            HeaderText="Phone" />

                      
                        <asp:BoundField DataField="DepartmentName"
                            HeaderText="Department" />

                        
                        <asp:BoundField DataField="GeneratedOn"
                            HeaderText="Generated On" />


                        <asp:TemplateField HeaderText="Month / Year">

                            <ItemTemplate>

                                <%# Eval("SalaryMonth") %> /
                                <%# Eval("SalaryYear") %>

                            </ItemTemplate>

                        </asp:TemplateField>





                        <asp:TemplateField HeaderText="Actions">

                            <ItemTemplate>

                           

                                <asp:LinkButton ID="btnView"
                                    runat="server"
                                    CommandName="ViewPayslip"
                                    CommandArgument='<%# Eval("SalaryId") %>'
                                    CssClass="text-dark">

                                    <i class="fa fa-eye"></i>

                                </asp:LinkButton>

                                &nbsp;&nbsp;


                                <asp:LinkButton ID="btnDownload"
                                    runat="server"
                                    CommandName="DownloadPayslip"
                                    CommandArgument='<%# Eval("SalaryId") %>'
                                    CssClass="text-dark">

                                    <i class="fa fa-download"></i>

                                </asp:LinkButton>

                                &nbsp;&nbsp;

                            

                                <asp:LinkButton ID="btnDelete"
                                    runat="server"
                                    CommandName="DeletePayslip"
                                    CommandArgument='<%# Eval("SalaryId") %>'
                                    CssClass="text-danger"
                                    OnClientClick="return confirm('Delete record?');">

                                    <i class="fa fa-trash"></i>

                                </asp:LinkButton>

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

        </div>

    </div>

</div>


<script src="https://cdn.datatables.net/2.3.8/js/dataTables.min.js"></script>



</asp:Content>
