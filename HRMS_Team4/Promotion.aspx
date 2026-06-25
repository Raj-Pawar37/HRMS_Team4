<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Site1.master"CodeBehind="Promotion.aspx.cs"Inherits="HRMS_Team4.Admin.Promotion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2"
ContentPlaceHolderID="ContentPlaceHolder1"
runat="server">
    <div class="page-wrapper">
    <div class="content">

        <div class="d-flex justify-content-between mb-3">

            <h3>Promotion</h3>

            <asp:Button ID="btnAddPromotion"
                runat="server"
                Text="Add Promotion"
                CssClass="btn btn-primary"
                OnClick="btnAddPromotion_Click" />

        </div>

        Search :

        <asp:TextBox ID="txtSearch"
            runat="server"
            AutoPostBack="true"
            CssClass="form-control"
            OnTextChanged="txtSearch_TextChanged">
        </asp:TextBox>

        <br />

        <asp:GridView ID="gvPromotion"
            runat="server"
            CssClass="table table-bordered"
            AutoGenerateColumns="False"
            DataKeyNames="PromotionId"
            OnRowCommand="gvPromotion_RowCommand">

            <Columns>

                <asp:BoundField DataField="EmployeeName"
                    HeaderText="Employee Name" />

                <asp:BoundField DataField="DesignationFrom"
                    HeaderText="Designation From" />

                <asp:BoundField DataField="DesignationTo"
                    HeaderText="Designation To" />

                <asp:BoundField DataField="Date"
                    HeaderText="Promotion Date"
                    DataFormatString="{0:dd-MM-yyyy}" />

                <asp:TemplateField HeaderText="Action">

                    <ItemTemplate>

                        <asp:LinkButton ID="lnkEdit"
                            runat="server"
                            Text="✏️"
                            CommandName="EditRow"
                            CommandArgument='<%# Eval("PromotionId") %>'>
                        </asp:LinkButton>

                        &nbsp;

                        <asp:LinkButton ID="lnkDelete"
                            runat="server"
                            Text="🗑️"
                            CommandName="DeleteRow"
                            CommandArgument='<%# Eval("PromotionId") %>'
                            OnClientClick="return confirm('Delete Record?');">
                        </asp:LinkButton>

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>

        <asp:Panel ID="pnlPromotion"
            runat="server"
            Visible="false"
            CssClass="card p-3">

            <h4>Add Promotion</h4>

            <asp:HiddenField ID="hfPromotionId"
                runat="server" />

            Employee

            <asp:DropDownList ID="ddlEmployee"
                runat="server"
                CssClass="form-control">
            </asp:DropDownList>

            <br />

            Designation From

            <asp:DropDownList ID="ddlFrom"
                runat="server"
                CssClass="form-control">
            </asp:DropDownList>

            <br />

            Designation To

            <asp:DropDownList ID="ddlTo"
                runat="server"
                CssClass="form-control">
            </asp:DropDownList>

            <br />

            Promotion Date

            <asp:TextBox ID="txtDate"
                runat="server"
                TextMode="Date"
                CssClass="form-control">
            </asp:TextBox>

            <br />

            <asp:Button ID="btnSubmit"
                runat="server"
                Text="Submit"
                CssClass="btn btn-success"
                OnClick="btnSubmit_Click" />

        </asp:Panel>

    </div>
</div>

</asp:Content>