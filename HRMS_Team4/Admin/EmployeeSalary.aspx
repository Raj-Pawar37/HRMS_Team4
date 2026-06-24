<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EmployeeSalary.aspx.cs" Inherits="HRMS_Team4.Admin.EmployeeSalary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="card p-4">
    <asp:Panel runat="server">

        <h3 class="text-start mb-4">Add Employee Salary</h3>

        <div class="form-group">
            <label>Select Employee</label>
            <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="form-control">
                <asp:ListItem Value="">-- Select Employee --</asp:ListItem>
            </asp:DropDownList>
        </div>

      
        <div class="form-group mt-2">
            <label>Total Salary</label>
            <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control"
                AutoPostBack="true" OnTextChanged="txtSalary_TextChanged"
                TextMode="Number"></asp:TextBox>
        </div>

       
        <h4 class="mt-3">Earnings</h4>

        <div class="row">
            <div class="col-md-3">
                <label>Bonus (5%)</label>
                <asp:TextBox ID="txtBonus" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="col-md-3">
                <label>Profit Sharing (50%)</label>
                <asp:TextBox ID="txtProfit" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
        </div>

     
        <h4 class="mt-3">Deductions</h4>

        <div class="row">
            <div class="col-md-3">
                <label>Tax (10%)</label>
                <asp:TextBox ID="txtTax" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>
        </div>

        
        <div class="d-flex justify-content-end mt-4">
            <asp:Button ID="btnSave" runat="server" Text="Save Salary"
                CssClass="btn btn-primary" OnClick="btnSave_Click" />
        </div>

    </asp:Panel>
</div>
</asp:Content>
