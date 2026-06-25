<%@ Page Title="Leave Approval"
    Language="C#"
    MasterPageFile="~/Manager/Manager.Master"
    AutoEventWireup="true"
    CodeBehind="LeaveApproval.aspx.cs"
    Inherits="HRMS_Team4.Manager.LeaveApproval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   
    <style>
        .badge-status {
            font-size: 12px;
            padding: 5px 10px;
            border-radius: 6px;
        }

        .action-btns button {
            margin-right: 5px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <script>
$(function () {
    $('#<%= gvLeaveApproval.ClientID %>').DataTable({
        pageLength: 5,
        lengthMenu: [[5, 10, 25, -1], [5, 10, 25, "All"]]
    });
});
</script>
    <div class="container-fluid mt-3">

        <!-- PAGE HEADER -->
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3>Leave Approval</h3>
        </div>

        <!-- GRID CARD -->
        <div class="card">
            <div class="card-body table-responsive">

                <asp:GridView ID="gvLeaveApproval" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table table-bordered table-striped"
                    DataKeyNames="LeaveRequestId"
                    OnRowCommand="gvLeaveApproval_RowCommand">

                    <Columns>

                       
                        <asp:BoundField DataField="LeaveRequestId" HeaderText="Leave" />

                        <asp:BoundField DataField="LeaveTypeName" HeaderText="Leave Type" />

                       
                        <asp:BoundField DataField="EmployeeName" HeaderText="Employee" />

                        
                        <asp:BoundField DataField="ApprovedByName" HeaderText="Approved By" />

                       
                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:dd-MM-yyyy}" />

                        
                        <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:dd-MM-yyyy}" />

                        
                        <asp:BoundField DataField="Reason" HeaderText="Reason" />

                        
                        <asp:BoundField DataField="NumberOfDays" HeaderText="No of Day" />

                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <span class='<%# GetStatusClass(Eval("Status").ToString()) %>'>
                                    <%# Eval("Status") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>

                                <div class="action-btns">
<asp:Button ID="btnApprove" runat="server"
    Text="Approve"
    CssClass="btn btn-sm btn-success"
    CommandName="Approve"
    CommandArgument='<%# Eval("LeaveRequestId") %>'
    Enabled='<%# Eval("Status").ToString() == "Pending" %>' />

<asp:Button ID="btnReject" runat="server"
    Text="Reject"
    CssClass="btn btn-sm btn-danger"
    CommandName="Reject"
    CommandArgument='<%# Eval("LeaveRequestId") %>'
    Enabled='<%# Eval("Status").ToString() == "Pending" %>' />

                                </div>

                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>
        </div>

    </div>


 

</asp:Content>