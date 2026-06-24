<%@ Page Title="Admin File Upload" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminFileUpload.aspx.cs" Inherits="HRMS_Team4.Admin.AdminFileUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        .removeInput { color: #dc3545; transition: 0.2s; }
        .removeInput:hover { color: #a71d2a; transform: scale(1.1); }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
        <div class="my-auto mb-2">
            <h2 class="mb-1">Upload Admin Document</h2>
            <nav>
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="Default.aspx"><i class="ti ti-smart-home"></i></a></li>
                    <li class="breadcrumb-item">Documents</li>
                    <li class="breadcrumb-item active" aria-current="page">Upload Document</li>
                </ol>
            </nav>
        </div>
    </div>

    <br>

    <div class="card">
        <div class="card-header">
            <h5 class="mb-0">Upload New Documents</h5>
        </div>
        <div class="card-body">
            
            <asp:Label ID="lblMessage" runat="server" Font-Bold="true" CssClass="d-block mb-3"></asp:Label>

            <div style="width: 70%;">
    
                <div class="form-group mb-4">
                    <label class="fw-bold">Employee Email</label>
                    <asp:DropDownList ID="ddlEmail" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="ddlEmail" 
                        InitialValue="0" ErrorMessage="Please select an employee email." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <label class="fw-bold mb-2">Documents to Upload</label>

                <div id="fileInputs">
                    <div class="row align-items-center mb-3 file-input-row">
                        
                        <div class="col-md-5">
                            <select name="DocumentTypes" class="form-control" required>
                                <%= DocTypeOptions %>
                            </select>
                        </div>
                        
                        <div class="col-md-5">
                            <input type="file" name="Files" class="form-control" required />
                        </div>
                        
                        <div class="col-md-2 mt-2 mt-md-0">
                            <button type="button" class="btn btn-sm btn-primary addMore" title="Add another document"><i class="bi bi-plus-lg"></i></button>
                            <button type="button" style="background:none;border:none" class="removeInput" title="Remove"><i class="bi bi-trash3" style="font-size: 1.2rem;"></i></button>
                        </div>

                    </div>
                </div>

                <div class="mt-4">
                    <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="btnUpload_Click"  />
                </div>
            </div>

        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {

            $(document).on('click', '.addMore', function () {
                const newRow = $('#fileInputs .file-input-row:first').clone();
                newRow.find('input[type="file"]').val('');
                $('#fileInputs').append(newRow);
            });

            $(document).on('click', '.removeInput', function () {
                if ($('#fileInputs .file-input-row').length > 1) {
                    $(this).closest('.file-input-row').remove();
                } else {
                    alert("You must upload at least one document.");
                }
            });
        });
    </script>
</asp:Content>