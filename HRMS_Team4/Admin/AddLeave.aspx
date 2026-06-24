<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddLeave.aspx.cs" Inherits="HRMS_Team4.Admin.AddLeave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="card">
    <div class="card-body">

        <h3 class="mb-4"><b>Allocate Leave Deptwise</b></h3>

        <div class="mb-3">
            <label class="form-label">Select Department</label>
            <asp:DropDownList ID="DropDownList1"
                runat="server"
                CssClass="form-control">
            </asp:DropDownList>
        </div>

        <div class="mb-3">
            <label class="form-label">Select Leave Type</label>
            <asp:DropDownList ID="DropDownList2"
                runat="server"
                CssClass="form-control">
            </asp:DropDownList>
        </div>

        <div class="mb-3">
            <label class="form-label">Number of Leaves Allocated</label>
            <asp:TextBox ID="TextBox1"
                runat="server"
                CssClass="form-control">
            </asp:TextBox>
        </div>

        <asp:Button ID="Button1"
            runat="server"
            Text="Allocate Leave"
            CssClass="btn btn-primary"
            OnClick="Button1_Click" />

    </div>
</div>


</asp:Content>
