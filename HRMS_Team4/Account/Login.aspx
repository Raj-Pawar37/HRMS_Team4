<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HRMS_Team4.Accounts.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title>Login</title>
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/icons.css" rel="stylesheet" />
    <link href="../assets/css/main.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-wrapper">
            <div class="container-fluid">
                <div class="w-100 overflow-hidden position-relative flex-wrap d-block vh-100">
                    <div class="row">
                        <div class="col-lg-5">
                            <div class="d-lg-flex align-items-center justify-content-center d-none flex-wrap vh-100 bg-primary-transparent">
                                <div>
                                    <img src="../assets/img/bg/authentication-bg-03.svg" alt="Img" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-12 col-sm-12">
                            <div class="row justify-content-center align-items-center vh-100 overflow-auto flex-wrap">
                                <div class="col-md-7 mx-auto vh-100">
                                    <div class="vh-100 d-flex flex-column justify-content-between p-4 pb-0">
                                        <div class="mx-auto mb-5 text-center">
                                            <img src="../Uploads/logos/17d7a359-585b-436b-a0c0-55e10f8eff3d.png" height="200" width="200" class="img-fluid" alt="Logo" />
                                        </div>
                                        <div>
                                            <div class="text-center mb-3">
                                                <h2 class="mb-2">Sign In</h2>
                                                <p class="mb-0">Please enter your details to sign in</p>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Email Address</label>
                                                <div class="input-group">
                                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control border-end-0" placeholder="Enter Email ID"> </asp:TextBox>
                                                    <span class="input-group-text border-start-0"><i class="ti ti-mail"></i></span></div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Password</label>
                                                <div class="pass-group">
                                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="pass-input form-control" placeholder="Enter Password"> </asp:TextBox>
                                                    <span class="ti toggle-password ti-eye-off"></span></div>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mb-3">
                                                <div class="form-check form-check-md mb-0">
                                                    <asp:CheckBox ID="chkRememberMe" runat="server" CssClass="form-check-input" />
                                                    <label class="form-check-label mt-0">Remember Me </label>
                                                </div>
                                                <div class="text-end"><a href="ForgotPassword.aspx" class="link-danger">Forgot Password? </a></div>
                                            </div>
                                            <div class="mb-3">
                                                <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn btn-primary w-100" OnClick="btnLogin_Click" />
                                            </div>
                                            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                                            <div class="login-or"><span class="span-or">Or</span> </div>
                                            <div class="mt-2">
                                                <div class="d-flex align-items-center justify-content-center flex-wrap">
                                                    <asp:LinkButton ID="btnGoogleLogin" runat="server" CssClass="br-10 p-2 btn btn-outline-light border d-flex align-items-center justify-content-center" OnClick="btnGoogleLogin_Click"> <img class="img-fluid me-2" src="../assets/img/icons/google-logo.svg" alt="Google" /> <span>Sign in with Google</span> </asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt-5 pb-4 text-center">
                                            <p class="mb-0 text-gray-9">Copyright © 2025 - Pal Software</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
