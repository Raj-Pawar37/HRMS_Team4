<%@ Page Title="Add Admin Document Name" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeBehind="AddAdminDocName.aspx.cs" Inherits="HRMS_Team4.Admin.AddAdminDocName" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
        <div class="my-auto mb-2">
            <h2 class="mb-1">Add Admin Document Type</h2>
            <nav>
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="Default.aspx"><i class="ti ti-smart-home"></i></a></li>
                    <li class="breadcrumb-item">Master Documents</li>
                    <li class="breadcrumb-item active" aria-current="page">Add Admin Doc Name</li>
                </ol>
            </nav>
        </div>
    </div>

    <br>

    <div class="card">
        <div class="card-header">
            <h5 class="mb-0">Add New Admin Document</h5>
        </div>
        <div class="card-body">
            
            <asp:Label ID="lblMessage" runat="server" Font-Bold="true" CssClass="d-block mb-3"></asp:Label>

            <div style="width: 40%;">
                
                <div class="form-group mb-3">
                    <label>Document Name</label>
                    <asp:TextBox ID="txtDocName" runat="server" CssClass="form-control" placeholder="e.g., Aadhar Card, Offer Letter"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDocName" runat="server" ControlToValidate="txtDocName" 
                        ErrorMessage="Document Name is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Add" OnClick="btnSubmit_Click" />

            </div>
        </div>
    </div>

</asp:Content>