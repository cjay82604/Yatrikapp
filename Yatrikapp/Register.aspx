<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="YourWebFormsProject.Register" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create account - Yatrik</title>
    <link href="~/Content/Site.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        // Client-side validation for Terms checkbox
        function validateTerms(source, args) {
            var chk = document.getElementById('<%= chkTerms.ClientID %>');
            args.IsValid = chk && chk.checked;
        }
    </script>
</head>
<body>
    <form id="formRegister" runat="server">

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

        <!-- CENTERED REGISTRATION WRAPPER -->
        <main class="yt-auth-wrapper">

            <!-- Title & Avatar -->
            <div class="yt-auth-header-section">
                <div class="yt-auth-avatar">Y</div>
                <h1 class="yt-auth-title">Create account</h1>
                <p class="yt-auth-subtitle">Join Yatrik and start exploring India</p>
            </div>

            <!-- Card Box -->
            <div class="yt-auth-card">

                <!-- Success / Error Alert Message -->
                <asp:Panel ID="pnlAlert" runat="server" Visible="false">
                    <asp:Literal ID="litAlertMessage" runat="server" />
                </asp:Panel>

                <!-- 1. FULL NAME -->
                <div class="yt-form-group">
                    <label class="yt-form-label">Full name <span class="yt-req">*</span></label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="yt-input-pill" Placeholder="Arjun Sharma" MaxLength="60" />
                    <asp:RequiredFieldValidator ID="rfvFullName" runat="server" 
                        ControlToValidate="txtFullName" 
                        ValidationGroup="RegisterGroup" 
                        ErrorMessage="Please enter your full name" 
                        CssClass="yt-val-error" 
                        Display="Dynamic" />
                </div>

                <!-- 2. EMAIL ADDRESS -->
                <div class="yt-form-group">
                    <label class="yt-form-label">Email address <span class="yt-req">*</span></label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="yt-input-pill" Placeholder="you@example.com" TextMode="Email" MaxLength="100" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ValidationGroup="RegisterGroup" 
                        ErrorMessage="Please enter your email address" 
                        CssClass="yt-val-error" 
                        Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ValidationGroup="RegisterGroup" 
                        ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$" 
                        ErrorMessage="Please enter a valid email address" 
                        CssClass="yt-val-error" 
                        Display="Dynamic" />
                </div>

                <!-- 3. MOBILE NUMBER -->
                <div class="yt-form-group">
                    <label class="yt-form-label">Mobile number <span class="yt-req">*</span></label>
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="yt-input-pill" Placeholder="+91 98765 43210" MaxLength="16" />
                    <asp:RequiredFieldValidator ID="rfvMobile" runat="server" 
                        ControlToValidate="txtMobile" 
                        ValidationGroup="RegisterGroup" 
                        ErrorMessage="Please enter your mobile number" 
                        CssClass="yt-val-error" 
                        Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revMobile" runat="server" 
                        ControlToValidate="txtMobile" 
                        ValidationGroup="RegisterGroup" 
                        ValidationExpression="^(\+91[\s\-]?)?[6789]\d{9}$" 
                        ErrorMessage="Please enter a valid 10-digit Indian mobile number" 
                        CssClass="yt-val-error" 
                        Display="Dynamic" />
                </div>

                <!-- 4. PASSWORD -->
                <div class="yt-form-group">
                    <label class="yt-form-label">Password <span class="yt-req">*</span></label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="yt-input-pill" Placeholder="Min 6 characters" />
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                        ControlToValidate="txtPassword" 
                        ValidationGroup="RegisterGroup" 
                        ErrorMessage="Please enter a password" 
                        CssClass="yt-val-error" 
                        Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revPassword" runat="server" 
                        ControlToValidate="txtPassword" 
                        ValidationGroup="RegisterGroup" 
                        ValidationExpression=".{6,}" 
                        ErrorMessage="Password must be at least 6 characters" 
                        CssClass="yt-val-error" 
                        Display="Dynamic" />
                </div>

                <!-- 5. CONFIRM PASSWORD -->
                <div class="yt-form-group">
                    <label class="yt-form-label">Confirm password <span class="yt-req">*</span></label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="yt-input-pill" Placeholder="Repeat password" />
                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" 
                        ControlToValidate="txtConfirmPassword" 
                        ValidationGroup="RegisterGroup" 
                        ErrorMessage="Please confirm your password" 
                        CssClass="yt-val-error" 
                        Display="Dynamic" />
                    <asp:CompareValidator ID="cvConfirmPassword" runat="server" 
                        ControlToValidate="txtConfirmPassword" 
                        ControlToCompare="txtPassword" 
                        ValidationGroup="RegisterGroup" 
                        ErrorMessage="Passwords do not match" 
                        CssClass="yt-val-error" 
                        Display="Dynamic" />
                </div>

                <!-- 6. TERMS CHECKBOX -->
                <div class="yt-terms-group">
                    <asp:CheckBox ID="chkTerms" runat="server" />
                    <span>
                        I agree to Yatrik's <a href="#" class="yt-link-accent">Terms</a> and <a href="#" class="yt-link-accent">Privacy Policy</a>
                    </span>
                </div>
                <asp:CustomValidator ID="cvTerms" runat="server" 
                    ClientValidationFunction="validateTerms" 
                    OnServerValidate="cvTerms_ServerValidate" 
                    ValidationGroup="RegisterGroup" 
                    ErrorMessage="You must agree to the Terms and Privacy Policy" 
                    CssClass="yt-val-error" 
                    Display="Dynamic" />

                <!-- 7. SUBMIT BUTTON -->
                <asp:Button ID="btnCreateAccount" runat="server" 
                    Text="Create account" 
                    CssClass="yt-btn-pill-block" 
                    ValidationGroup="RegisterGroup" 
                    OnClick="btnCreateAccount_Click" />

                <!-- 8. BOTTOM SIGN IN LINK -->
                <div class="yt-auth-footer-text">
                    Already have an account? <a href="Login.aspx" class="yt-link-accent">Sign in</a>
                </div>

            </div>
        </main>

    </form>
</body>
</html>