<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master"
AutoEventWireup="true"
CodeBehind="Timesheet.aspx.cs"
Inherits="HRMS_Team4.Timesheet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
.employee-img{
    width:35px;
    height:35px;
    border-radius:50%;
}

.badge-approved{
    background:#00c851;
    color:white;
    padding:5px 10px;
    border-radius:5px;
}

.badge-rejected{
    background:red;
    color:white;
    padding:5px 10px;
    border-radius:5px;
}
</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container-fluid mt-3">

<h2>Admin Timesheet Management</h2>

<div class="mb-3">

<asp:Button ID="btnApprove"
runat="server"
Text="Approve Selected"
CssClass="btn btn-success"
OnClick="btnApprove_Click"/>

<asp:Button ID="btnReject"
runat="server"
Text="Reject Selected"
CssClass="btn btn-danger"
OnClick="btnReject_Click"/>

</div>

<asp:GridView ID="gvTimesheet"
runat="server"
AutoGenerateColumns="False"
CssClass="table table-bordered">

<Columns>

<asp:BoundField DataField="Employee" HeaderText="Employee"/>

<asp:BoundField DataField="CreatedAt" HeaderText="Created At"/>

<asp:BoundField DataField="Project" HeaderText="Project"/>

<asp:BoundField DataField="Hours" HeaderText="Worked Hours"/>

<asp:BoundField DataField="Status" HeaderText="Status"/>

</Columns>

</asp:GridView>

</div>

</asp:Content>