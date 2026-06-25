<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddMasterEvent.aspx.cs" Inherits="HRMS_Team4.Admin.AddMasterEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
        <div class="my-auto mb-2">
            <h2 class="mb-1">Event Types</h2>
            <nav>
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item">
                        <a href="#">
                            <i class="ti ti-smart-home"></i>
                        </a>
                    </li>
                    <li class="breadcrumb-item">Event</li>
                    <li class="breadcrumb-item active">Event Types</li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="container-fluid">

        <div class="row">
 
            <div class="col-md-5">

                <div class="card">

                    <div class="card-header">
                        <h5 class="card-title mb-0">Add Event Type</h5>
                    </div>

                    <div class="card-body">

                        <div class="mb-3">
                            <label class="form-label">Event Type Name</label>

                            <asp:TextBox ID="txtEventTypeName" runat="server"  CssClass="form-control" placeholder="Enter Event Type"> </asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Color</label>

                            <asp:TextBox ID="txtColor" runat="server" TextMode="Color" CssClass="form-control form-control-color"> </asp:TextBox>
                        </div>

                        <asp:Button ID="btnSave" runat="server" Text="Add Event Type" CssClass="btn btn-primary" OnClick="btnSave_Click" />

                    </div>

                </div>

            </div>
          <div class="col-md-7">

                <div class="card">

                    <div class="card-header">
                        <h5 class="card-title mb-0"> Existing Event Types </h5>
                    </div>

                    <div class="card-body">

                        <div class="table-responsive">

                            <asp:GridView ID="gvEventTypes" runat="server" AutoGenerateColumns="False" CssClass="table table-hover" GridLines="None" OnRowCommand="gvEventTypes_RowCommand">

                                <Columns>

                                    <asp:BoundField DataField="Name" HeaderText="Name" />

                                    <asp:BoundField DataField="Color" HeaderText="Color" />

                                    <asp:TemplateField HeaderText="Sample">
                                        <ItemTemplate>

                                            <div style='width:30px; height:30px; border-radius:4px; background-color:<%# Eval("Color") %>'> </div>

                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>

                                            <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger btn-sm" Text="Delete" CommandName="DeleteType" 
                                                CommandArgument='<%# Eval("Id") %>' OnClientClick="return confirm('Are you sure you want to delete this Event Type?');"> </asp:LinkButton>

                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>

                            </asp:GridView>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>


</asp:Content>
