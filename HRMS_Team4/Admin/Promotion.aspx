<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Promotion.aspx.cs" Inherits="HRMS_Team4.Admin.Promotion1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container mt-4">

   
    <div class="d-flex justify-content-between align-items-center">
        <h2>Promotion</h2>
      
        <button type="button" class="btn btn-primary" onclick="openModal();">
            <i class="ti ti-circle-plus me-2"></i>Add Promotion
        </button>
    </div>
    <br />

    <div class="card">
        <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
            <h5>Promotion List</h5>

          
            <div class="d-flex align-items-center flex-wrap row-gap-3">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control me-2" placeholder="Search Employee..."  AutoPostBack="true" OnTextChanged="txtSearch_TextChanged" Width="200px">
                </asp:TextBox>
            </div>
        </div>

     
        <div class="table-responsive">
            <asp:GridView ID="GridPromotion" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="PromotionId" OnRowCommand="gvPromotion_RowCommand">

                <Columns>
                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
                    <asp:BoundField DataField="DesignationFrom" HeaderText="Designation From" />
                    <asp:BoundField DataField="DesignationTo" HeaderText="Designation To" />
                    <asp:BoundField DataField="Date"  HeaderText="Promotion Date" DataFormatString="{0:yyyy-MM-dd}" />

                  
                  <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName ="EditRow"  CommandArgument='<%# Eval("PromotionId") %>'  CausesValidation="false" Text="✏️"> </asp:LinkButton>
                     &nbsp;
                 <asp:LinkButton ID="lnkDelete" runat="server"  CommandName="DeleteRow" CommandArgument='<%# Eval("PromotionId") %>' CausesValidation="false" Text="🗑️"> </asp:LinkButton>
                     </ItemTemplate>
                </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>

    </div>
</div>

<div class="modal fade" id="promotionModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="promotionModalLabel">Add Promotion</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">
            <asp:HiddenField ID="hfPromotionId" runat="server" />

              <div class="mb-3">
   <label class="form-label">User ID</label>
<asp:TextBox ID="txtUserID" runat="server" CssClass="form-control"> </asp:TextBox>
    
    <small id="empMsg" class="text-danger"></small>
</div>

                <div class="mb-3">
                    <label class="form-label">Designation From</label>
                    <asp:DropDownList ID="ddlDesignationFrom" runat="server" CssClass="form-select">
                    </asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label class="form-label">Designation To</label>
                    <asp:DropDownList ID="ddlDesignationTo" runat="server" CssClass="form-select">
                    </asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label class="form-label">Promotion Date</label>
                    <asp:TextBox ID="txtPromotionDate" runat="server"
                        TextMode="Date" CssClass="form-control">
                    </asp:TextBox>
                </div>
            </div>

           
            <div class="modal-footer">
                <asp:Button ID="btnSavePromotion" runat="server" Text="Save"
                    CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>

        </div>  
    </div>  
</div>  
   <script>
       function openModal() {
           document.getElementById('promotionModalLabel').innerText = 'Add Promotion';

           var existingModal = bootstrap.Modal.getInstance(document.getElementById('promotionModal'));
           if (existingModal) {
               existingModal.dispose();
           }

           var modal = new bootstrap.Modal(document.getElementById('promotionModal'));
           modal.show();
       }
   </script>



</asp:Content>