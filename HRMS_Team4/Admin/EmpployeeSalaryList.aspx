<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="EmpployeeSalaryList.aspx.cs"
    Inherits="HRMS_Team4.Admin.EmpployeeSalaryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
function SelectAll(headerCheckbox: HTMLInputElement):void {

    var grid = document.getElementById('<%= gvEmployeeSalary.ClientID %>');
            var inputs = grid.getElementsByTagName("input");

            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].type == "checkbox" && inputs[i] != headerCheckbox) {
                    inputs[i].checked = headerCheckbox.checked;
                }
            }
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="content">

    <!-- Top Button -->
    <div class="d-flex flex-wrap gy-2 justify-content-between my-4">

        <div></div>

        <div class="mb-2">

            <asp:Button ID="btnGeneratePayslips"
                runat="server"
                Text="Generate Payslips for Selected Employees"
                CssClass="btn btn-primary"
                OnClick="btnGeneratePayslips_Click" />

        </div>

    </div>


    <!-- Card -->
    <div class="card">

        <!-- Card Header -->
        <div class="card-header d-flex justify-content-between align-items-center flex-wrap">

            <h5>Employee Salary List</h5>

            <div class="d-flex align-items-center gap-2">

                <asp:TextBox ID="txtDateRange"
                    runat="server"
                    CssClass="form-control"
                    Width="180px"
                    placeholder="dd/mm/yyyy - dd/mm/yyyy">
                </asp:TextBox>


                <asp:DropDownList ID="ddlSort"
                    runat="server"
                    CssClass="form-select"
                    Width="180px">

                    <asp:ListItem>Recently Added</asp:ListItem>
                    <asp:ListItem>Ascending</asp:ListItem>
                    <asp:ListItem>Descending</asp:ListItem>
                    <asp:ListItem>Last Month</asp:ListItem>
                    <asp:ListItem>Last 7 Days</asp:ListItem>

                </asp:DropDownList>


                <asp:Button ID="btnFilter"
                    runat="server"
                    Text="Filter"
                    CssClass="btn btn-primary"
                    OnClick="btnFilter_Click" />

            </div>

        </div>


        <!-- Grid -->
        <div class="card-body table-responsive">

            <asp:GridView ID="gvEmployeeSalary"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-hover"
                DataKeyNames="UserId"
                OnRowCommand="gvEmployeeSalary_RowCommand">

                <Columns>

                   
                    <asp:TemplateField>
                        <HeaderTemplate>

                            <asp:CheckBox ID="chkAll"
                                runat="server"
                                onclick="SelectAll(this);" />

                        </HeaderTemplate>

                        <ItemTemplate>

                            <asp:CheckBox ID="chkSelect"
                                runat="server" />

                        </ItemTemplate>
                    </asp:TemplateField>



                   
                    <asp:BoundField DataField="UserId"
                        HeaderText="Emp ID" />


                   <asp:TemplateField HeaderText="Name">
    <ItemTemplate>
        <div class="d-flex align-items-center">

            <asp:Image ID="imgEmp"
                runat="server"
                Width="40"
                Height="40"
                CssClass="rounded-circle"
                ImageUrl='<%# Eval("ProfilePicture") %>' />

            <div class="ms-2">

                <asp:Label ID="lblName"
                    runat="server"
                    Font-Bold="true"
                    Text='<%# Eval("FirstName") + " " + Eval("LastName") %>'>
                </asp:Label>

            </div>

        </div>
    </ItemTemplate>
</asp:TemplateField>


                   
                    <asp:BoundField DataField="Email" HeaderText="Email" />

<asp:BoundField DataField="PhoneNumber" HeaderText="Phone" />


                   
                   <asp:BoundField DataField="DateOfJoining" HeaderText="Joining Date" />

                   
            <asp:BoundField DataField="TotalSalary" HeaderText="Total Salary" />

<asp:BoundField DataField="NetSalary" HeaderText="Net Salary" />


                    
                    <asp:TemplateField HeaderText="GeneratePayslip PDF">

                        <ItemTemplate>

                           <asp:LinkButton ID="lnkPDF"
    runat="server"
    Text="Generate Payslip PDF"
    CommandName="GeneratePDF"
    CommandArgument='<%# Eval("PaySlipId") %>'>
</asp:LinkButton>
                        </ItemTemplate>

                    </asp:TemplateField>


                    
                    <asp:TemplateField HeaderText="Actions">

                        <ItemTemplate>

                            <asp:LinkButton ID="btnDelete"
                                runat="server"
                                CommandName="DeleteRecord"
                                CommandArgument='<%# Eval("PaySlipID") %>'
                                OnClientClick="return confirm('Are you sure you want to delete?');">

                                <i class="fa fa-trash text-danger"></i>

                            </asp:LinkButton>

                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>

</div>

</asp:Content>