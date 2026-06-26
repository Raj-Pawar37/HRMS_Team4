<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Leave.aspx.cs" Inherits="HRMS_Team4.User.Leave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <script>
$(function () {
    $('#<%= gvLeaveRequests.ClientID %>').DataTable({
        pageLength: 5,
        lengthMenu: [[5, 10, 25, -1], [5, 10, 25, "All"]]
    });
});
      </script>

    <div class="card">
    <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
        <h5 class="mb-0">My Leave Requests</h5>
        

    <a href="ApplyLeave.aspx" class="btn btn-primary">
        Apply Leave
    </a>
    </div>

    <div class="card-body">

        <asp:GridView ID="gvLeaveRequests"
            runat="server"
            CssClass="table table-bordered mt-4"
            AutoGenerateColumns="False"
            ClientIDMode="Static" >

            <Columns>

                <asp:BoundField DataField="LeaveRequestId"
                    HeaderText="Leave ID" />

                <asp:BoundField DataField="LeaveType"
                    HeaderText="Leave Type" />

                <asp:BoundField DataField="StartDate"
                    HeaderText="Start Date"
                    DataFormatString="{0:dd-MM-yyyy}" />

                <asp:BoundField DataField="EndDate"
                    HeaderText="End Date"
                    DataFormatString="{0:dd-MM-yyyy}" />

                <asp:BoundField DataField="Reason"
                    HeaderText="Reason" />

                <asp:BoundField DataField="NumberOfDays"
                    HeaderText="No of Days" />

                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <span class='<%# Eval("Status").ToString() == "Approved" ? "badge bg-success" :
                           Eval("Status").ToString() == "Rejected" ? "badge bg-danger" :
                           "badge bg-warning text-dark" %>'>

            <%# Eval("Status") %>

        </span> 
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

        </asp:GridView>

    </div>
</div>

</asp:Content>
