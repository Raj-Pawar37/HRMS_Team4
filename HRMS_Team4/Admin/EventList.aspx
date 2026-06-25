<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EventList.aspx.cs" Inherits="HRMS_Team4.Admin.EventList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="container-fluid">

        <div class="row mb-3">
            <div class="col-md-6">
                <h3>Event Management</h3>
            </div>
            <div class="col-md-6 text-end">
                <button type="button" class="btn btn-primary"
                    data-bs-toggle="modal"
                    data-bs-target="#addEventModal">
                    Add Event
                </button>
            </div>
        </div>

        <!-- Add Event Modal -->
        <div class="modal fade" id="addEventModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Add Event</h5>
                        <button type="button" class="btn-close"
                            data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body">

                        <div class="mb-3">
                            <label>Event Title</label>
                            <asp:TextBox ID="txtEventTitle"
                                runat="server"
                                CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label>Event Date</label>
                            <asp:TextBox ID="txtEventDate"
                                runat="server"
                                TextMode="Date"
                                CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label>Event Type</label>
                            <asp:DropDownList ID="ddlEventType"
                                runat="server"
                                CssClass="form-control">
                            </asp:DropDownList>
                        </div>

                        <asp:Button ID="btnSave"
                            runat="server"
                            Text="Save"
                            CssClass="btn btn-success"
                            OnClick="btnSave_Click" />

                    </div>

                </div>
            </div>
        </div>

        <!-- Edit Event Modal -->
        <div class="modal fade" id="editEventModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Edit Event</h5>
                        <button type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"></button>
                    </div>

                    <div class="modal-body">

                        <asp:HiddenField ID="hfEventId"
                            runat="server" />

                        <div class="mb-3">
                            <label>Event Title</label>
                            <asp:TextBox ID="txtEditTitle"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label>Event Date</label>
                            <asp:TextBox ID="txtEditDate"
                                runat="server"
                                TextMode="Date"
                                CssClass="form-control">
                            </asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label>Event Type</label>
                            <asp:DropDownList ID="ddlEditType"
                                runat="server"
                                CssClass="form-control">
                            </asp:DropDownList>
                        </div>

                        <asp:Button ID="btnUpdate"
                            runat="server"
                            Text="Update"
                            CssClass="btn btn-primary"
                            OnClick="btnUpdate_Click" />

                    </div>

                </div>
            </div>
        </div>

        <!-- Grid -->
        <div class="card">
            <div class="card-header">
                <h4>Event List</h4>
            </div>

            <div class="card-body">

                <asp:GridView ID="gvEvents"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table table-bordered table-striped">

                    <Columns>

                        <asp:BoundField DataField="Id"
                            HeaderText="ID" />

                        <asp:BoundField DataField="Title"
                            HeaderText="Title" />

                        <asp:BoundField DataField="Status"
                            HeaderText="Status" />

                        <asp:BoundField DataField="Date"
                            HeaderText="Date"
                            DataFormatString="{0:dd-MMM-yyyy}" />

                        <asp:TemplateField HeaderText="Actions">

                            <ItemTemplate>

                                <asp:LinkButton ID="btnEdit"
                                    runat="server"
                                    Text="Edit"
                                    CssClass="btn btn-warning btn-sm"
                                    CommandArgument='<%# Eval("Id") %>'
                                    OnClick="btnEdit_Click">
                                </asp:LinkButton>

                                <asp:LinkButton ID="btnDelete"
                                    runat="server"
                                    Text="Delete"
                                    CssClass="btn btn-danger btn-sm"
                                    CommandArgument='<%# Eval("Id") %>'
                                    OnClick="btnDelete_Click"
                                    OnClientClick="return confirm('Are you sure?');">
                                </asp:LinkButton>

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>
        </div>

    </div>
</asp:Content>
