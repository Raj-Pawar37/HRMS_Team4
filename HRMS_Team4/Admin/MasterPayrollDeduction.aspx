<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="MasterPayrollDeduction.aspx.cs" Inherits="HRMS_Team4.Admin.MasterPayrollDeduction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="d-flex flex-wrap gy-2 justify-content-between my-4">

        <div class="payroll-btns" style="display: flex; gap: 15px;">

            <div style="position: relative; width: 180px;">
                <button type="button" onclick="toggleDropdown('earningMenu')"
                    style="width: 100%; background:#fff; border:1px solid #dee2e6; border-radius:6px; padding:10px 15px; display:flex; justify-content:space-between; align-items:center; cursor:pointer;">
                    <span>Earning</span>
                    <span>▼</span>
                </button>

                <div id="earningMenu"
                    style="display:none; position:absolute; top:105%; left:0; width:100%; background:#fff; border:1px solid #ddd; border-radius:6px; box-shadow:0 5px 15px rgba(0,0,0,.15); z-index:9999;">
                    <a href="MasterPayrollEarningType.aspx" style="display:block; padding:10px 15px; color:#000; text-decoration:none;">Earning Type</a>
                    <a href="MasterPayrollEarning.aspx" style="display:block; padding:10px 15px; color:#000; text-decoration:none;">Earning</a>
                </div>
            </div>

            <div style="position: relative; width: 180px;">
                <button type="button" onclick="toggleDropdown('deductionMenu')"
                    style="width: 100%; background:#fff; border:1px solid #dee2e6; border-radius:6px; padding:10px 15px; display:flex; justify-content:space-between; align-items:center; cursor:pointer;">
                    <span>Deduction</span>
                    <span>▼</span>
                </button>

                <div id="deductionMenu"
                    style="display:none; position:absolute; top:105%; left:0; width:100%; background:#fff; border:1px solid #ddd; border-radius:6px; box-shadow:0 5px 15px rgba(0,0,0,.15); z-index:9999;">
                    <a href="MasterPayrollDeductionType.aspx" style="display:block; padding:10px 15px; color:#000; text-decoration:none;">Deduction Type</a>
                    <a href="MasterPayrollDeduction.aspx" style="display:block; padding:10px 15px; color:#000; text-decoration:none;">Deduction</a>
                </div>
            </div>

        </div>

        <div class="mb-3 text-end">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#deductionModal">
                Add Deduction
            </button>
        </div>

    </div>

    <div class="card-body p-0">
        <table class="table dataTable" id="table">
            <thead class="table-dark">
                <tr>
                    <th>Id</th>
                    <th>Deduction Type</th>
                    <th>Percentage</th>
                    <th>Department</th>
                    <th>Designation</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <asp:Repeater ID="rptDeduction" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("DeductionId") %></td>
                            <td><%# Eval("DeductionsName") %></td>
                            <td><%# Eval("DeductionPercentage") %>%</td>
                            <td><%# Eval("DepartmentName") %></td>
                            <td><%# Eval("DesignationName") %></td>
                            <td>
                                <asp:LinkButton ID="btnEdit" runat="server"
                                    CssClass="me-2"
                                    CommandArgument='<%# Eval("DeductionId") %>'
                                    OnClick="btnEdit_Click">
                                    <i class="ti ti-edit"></i>
                                </asp:LinkButton>

                                <asp:LinkButton ID="btnDelete" runat="server"
                                    CommandArgument='<%# Eval("DeductionId") %>'
                                    OnClick="btnDelete_Click"
                                    OnClientClick="return confirm('Are you sure you want to delete this deduction?');">
                                    <i class="ti ti-trash"></i>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>

    <div class="modal fade" id="deductionModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-md">
            <div class="modal-content">

                <div class="modal-header">
                    <asp:Label ID="Label1" runat="server" Text="Add Deduction"></asp:Label>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal">
                        <i class="ti ti-x"></i>
                    </button>
                </div>

                <div class="modal-body pb-0">

                    <asp:HiddenField ID="hfDeductionId" runat="server" />

                    <div class="mb-3">
                        <label class="form-label">Deduction Type</label>
                        <asp:DropDownList ID="ddlDeductionType" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Deduction Percentage</label>
                        <asp:TextBox ID="txtDeductionPercentage" runat="server"
                            CssClass="form-control"
                            placeholder="Enter Deduction Percentage" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Department</label>
                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Designation</label>
                        <asp:DropDownList ID="ddlDesignation" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-light me-2" data-bs-dismiss="modal">Cancel</button>

                    <asp:Button ID="btnAddDeduction"
                        runat="server"
                        Text="Add Deduction"
                        CssClass="btn btn-primary"
                        OnClick="btnAddDeduction_Click" />
                </div>

            </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <script>
        function toggleDropdown(id) {
            var earning = document.getElementById("earningMenu");
            var deduction = document.getElementById("deductionMenu");

            if (id === "earningMenu") {
                deduction.style.display = "none";
            } else {
                earning.style.display = "none";
            }

            var menu = document.getElementById(id);
            menu.style.display = menu.style.display === "block" ? "none" : "block";
        }

        document.addEventListener("click", function (e) {
            if (!e.target.closest(".payroll-btns")) {
                document.getElementById("earningMenu").style.display = "none";
                document.getElementById("deductionMenu").style.display = "none";
            }
        });
    </script>

</asp:Content>
