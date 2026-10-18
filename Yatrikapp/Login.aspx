<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="YourWebFormsProject.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Welcome back - Yatrik</title>
    <link href="~/Content/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="formLogin" runat="server">

        <!-- FOCUSED HEADER -->
        <header class="yt-auth-header">
            <div class="yt-auth-header-container">
                <a href="Default.aspx" class="yt-logo">
                    <span class="yt-logo-badge">&#9670;</span>
                    <span>Yatrik</span>
                </a>
                <a href="Default.aspx" class="yt-back-home">&larr; Back to home</a>
            </div>
        </header>

        <!-- CENTERED LOGIN WRAPPER -->
        <main class="yt-auth-wrapper">

            <!-- Title & Avatar -->
            <div class="yt-auth-header-section">
                <div class="yt-auth-avatar">Y</div>
                <h1 class="yt-auth-title">Welcome back</h1>
                <p class="yt-auth-subtitle">Sign in to your Yatrik account</p>
            </div>

            <!-- Card Box -->
            <div class="yt-auth-card">

                <!-- Alert Message -->
                <asp:Panel ID="pnlAlert" runat="server" Visible="false">
                    <asp:Literal ID="litAlertMessage" runat="server" />
                </asp:Panel>

                <!-- 1. EMAIL ADDRESS -->
                <div class="yt-form-group">
                    <label class="yt-form-label">Email address <span class="yt-req">*</span></label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="yt-input-pill" Placeholder="you@example.com" TextMode="Email" MaxLength="100" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ValidationGroup="LoginGroup" 
                        ErrorMessage="Please enter your email address" 
                        CssClass="yt-val-error" 
                        Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ValidationGroup="LoginGroup" 
                        ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$" 
                        ErrorMessage="Please enter a valid email address" 
                        CssClass="yt-val-error" 
                        Display="Dynamic" />
                </div>

                <!-- 2. PASSWORD WITH FORGOT LINK -->
                <div class="yt-form-group">
                    <div class="yt-label-row">
                        <label class="yt-form-label" style="margin-bottom:0;">Password <span class="yt-req">*</span></label>
                        <a href="ForgotPassword.aspx" class="yt-link-forgot">Forgot password?</a>
                    </div>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="yt-input-pill" Placeholder="Min 6 characters" />
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                        ControlToValidate="txtPassword" 
                        ValidationGroup="LoginGroup" 
                        ErrorMessage="Please enter your password" 
                        CssClass="yt-val-error" 
                        Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revPassword" runat="server" 
                        ControlToValidate="txtPassword" 
                        ValidationGroup="LoginGroup" 
                        ValidationExpression=".{6,}" 
                        ErrorMessage="Password must be at least 6 characters" 
                        CssClass="yt-val-error" 
                        Display="Dynamic" />
                </div>

                <!-- 3. SIGN IN BUTTON -->
                <asp:Button ID="btnSignIn" runat="server" 
                    Text="Sign in" 
                    CssClass="yt-btn-pill-block" 
                    ValidationGroup="LoginGroup" 
                    OnClick="btnSignIn_Click" />

                <!-- 4. BOTTOM REGISTER LINK -->
                <div class="yt-auth-footer-text">
                    New to Yatrik? <a href="Register.aspx" class="yt-link-accent">Create account</a>
                </div>

                <!-- 5. DIVIDER -->
                <hr class="yt-auth-divider-line" />

                <!-- 6. ADMIN PORTAL LINK -->
                <a href="Admin.aspx" class="yt-admin-portal-link">Admin portal &rarr;</a>

            </div>
        </main>

    </form>
</body>
</html>