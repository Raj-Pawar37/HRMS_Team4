<%@ Page Title="Edit Employee Document" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeBehind="EditEmployeeDocName.aspx.cs" Inherits="HRMS_Team4.Admin.EditEmployeeDocName" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
        <div class="my-auto mb-2">
            <h2 class="mb-1">Edit Employee Document Type</h2>
            <nav>
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="Default.aspx"><i class="ti ti-smart-home"></i></a></li>
                    <li class="breadcrumb-item">Admin</li>
                    <li class="breadcrumb-item"><a href="FetchEmployeeDocName.aspx">Employee Document List</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Edit Document</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="card w-100">
        <div class="card-header">
            <h5 class="mb-0">Update Document Details</h5>
        </div>
        <div class="card-body">
            
            <asp:Label ID="lblMessage" runat="server" CssClass="d-block mb-3 fw-bold"></asp:Label>
            
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label fw-semibold">Document Name <span class="text-danger">*</span></label>
                    <asp:TextBox ID="txtDocName" runat="server" CssClass="form-control" placeholder="Enter document name"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="rfvDocName" runat="server" ControlToValidate="txtDocName" 
                        ErrorMessage="Document name is required." CssClass="text-danger mt-1 d-block" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="mt-4">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn me-2" style="background-color: #0d6efd; border-color: #0d6efd; color: white;" OnClick="btnUpdate_Click" />
                <a href="FetchEmployeeDocName.aspx" class="btn btn-secondary">Cancel</a>
            </div>

        </div>
    </div>
</asp:Content>