<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Yatrikapp.Admin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Sign In - Yatrik</title>
    <link href="~/Content/Site.css" rel="stylesheet" type="text/css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body class="yt-admin-page-body">
    <form id="formAdmin" runat="server">

        <!-- HEADER -->
        <header class="yt-admin-header">
            <div class="yt-admin-header-container">
                <a href="Default.aspx" class="yt-admin-brand">
                    <span class="yt-admin-brand-badge">Y</span>
                    <span class="yt-admin-brand-text">Yatrik</span>
                </a>
                <a href="Default.aspx" class="yt-admin-back">&larr; Back to home</a>
            </div>
        </header>

        <!-- MAIN ADMIN SIGN IN CONTENT -->
        <main class="yt-admin-main">
            <div class="yt-admin-box">

                <!-- Badge -->
                <div class="yt-admin-icon-circle">Y</div>

                <!-- Eyebrow & Title -->
                <div class="yt-admin-eyebrow">ADMIN PORTAL</div>
                <h1 class="yt-admin-title">Admin Sign In</h1>
                <div class="yt-admin-subtitle">Yatrik hotel management system</div>

                <!-- Card Box -->
                <div class="yt-admin-card">

                    <asp:Label ID="lblError" runat="server" CssClass="yt-admin-error" Visible="false"></asp:Label>

                    <!-- Email Field -->
                    <div style="margin-bottom: 4px;">
                        <label class="yt-admin-label">Admin email <span class="yt-req">*</span></label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="yt-admin-input" placeholder="admin@yatrik.in" TextMode="Email" />
                    </div>

                    <!-- Password Field -->
                    <div class="yt-admin-label-row">
                        <label class="yt-admin-label" style="margin: 0;">Password <span class="yt-req">*</span></label>
                        <a href="javascript:void(0);" onclick="alert('Demo password: any 4+ characters (e.g. admin123)');" class="yt-admin-forgot">Forgot?</a>
                    </div>
<<<<<<< HEAD
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="yt-admin-input" TextMode="Password" placeholder="••••••••" />
=======
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="yt-admin-input" TextMode="Password" placeholder="Min 4 characters" />
>>>>>>> 8c058e2c69959a48730eb36c04586dbc3e20f10d

                    <!-- Demo Helper Notice -->
                    <div class="yt-admin-demo-box">
                        Demo: any valid email + 4+ character password
                    </div>

                    <!-- Submit Button -->
                    <asp:Button ID="btnSignIn" runat="server" Text="Sign in to Admin" CssClass="yt-admin-btn-submit" OnClick="btnSignIn_Click" />

                    <!-- Switch Link -->
                    <div class="yt-admin-switch-row">
                        Not admin? <a href="Login.aspx" class="yt-admin-switch-link">User login &rarr;</a>
                    </div>

                </div>

            </div>
        </main>

    </form>
</body>
</html>