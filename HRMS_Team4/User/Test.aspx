<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="HRMS_Team4.User.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>
    .container {
        width: 900px;
        margin: auto;
        background: #fff;
        padding: 25px;
        font-family: Arial;
    }

    .title {
        text-align: center;
        font-size: 22px;
        font-weight: bold;
        color: #1f3b64;
    }

    .month {
        text-align: center;
        font-weight: bold;
        margin-top: 5px;
    }

    .row {
        display: flex;
        justify-content: space-between;
        margin-top: 25px;
    }

    .box {
        width: 45%;
    }

    .info {
        font-size: 13px;
        color: gray;
    }

    .center-info {
        text-align: center;
        margin-top: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
    }

    table th {
        background: #1f2328;
        color: white;
        padding: 10px;
    }

    table td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }

    .two-col {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
    }

    .section-title {
        font-weight: bold;
        margin-bottom: 5px;
    }

    .net {
        text-align: center;
        margin-top: 25px;
        font-size: 20px;
        color: orangered;
        font-weight: bold;
    }

    .net small {
        display: block;
        color: black;
        font-size: 14px;
    }
</style>

<div class="container">

    <!-- TITLE FROM DB -->
    <div class="title">
        <asp:Label ID="lblCompanyName" runat="server" />
    </div>

    <div class="month">
        Month: <asp:Label ID="lblMonth" runat="server" />
    </div>

    <div class="row">

        <div class="box">
            <h4>From:</h4>
            <div class="info">Email: <asp:Label ID="lblCompanyEmail" runat="server" /></div>
            <div class="info">Phone: <asp:Label ID="lblCompanyPhone" runat="server" /></div>
        </div>

        <div class="box" style="text-align:right;">
            <h4>To: <asp:Label ID="lblName" runat="server" /></h4>
            <div class="info"><asp:Label ID="lblDesignation" runat="server" /></div>
            <div class="info">Email: <asp:Label ID="lblEmail" runat="server" /></div>
            <div class="info">Phone: <asp:Label ID="lblPhone" runat="server" /></div>
        </div>

    </div>

    <div class="center-info">
        <b>Total Working Hours:</b><br />
        Worked Hours: <asp:Label ID="lblHours" runat="server" /><br />
        Hourly Rate: ₹<asp:Label ID="lblRate" runat="server" />
    </div>

    <div class="two-col">

        <div style="width:48%;">
            <div class="section-title">Earnings</div>

            <table>
                <tr>
                    <th>Description</th>
                    <th>Amount</th>
                </tr>

                <tr>
                    <td>Bonus</td>
                    <td><asp:Label ID="lblBonus" runat="server" /></td>
                </tr>

                <tr>
                    <td><b>Total Earnings</b></td>
                    <td><asp:Label ID="lblTotalEarning" runat="server" /></td>
                </tr>
            </table>
        </div>

        <div style="width:48%;">
            <div class="section-title">Deductions</div>

            <table>
                <tr>
                    <th>Description</th>
                    <th>Amount</th>
                </tr>

                <tr>
                    <td>Tax</td>
                    <td><asp:Label ID="lblTax" runat="server" /></td>
                </tr>

                <tr>
                    <td><b>Total Deductions</b></td>
                    <td><asp:Label ID="lblTotalDeduction" runat="server" /></td>
                </tr>
            </table>
        </div>

    </div>

    <div class="net">
        Net Salary: ₹<asp:Label ID="lblNetSalary" runat="server" />
        <small>(₹<asp:Label ID="lblNetText" runat="server" />)</small>
    </div>

</div>

</asp:Content>
