<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminProfile.aspx.cs" Inherits="Yatrikapp.AdminProfile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Profile - Yatrik Admin</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet" />

    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { background-color: #FAF7F2; font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, sans-serif; color: #2C1A0E; min-height: 100vh; }

        /* ADMIN TOPBAR */
        .yt-admin-topbar { background-color: #FAF7F2; border-bottom: 1px solid #ECE4DC; width: 100%; }
        .yt-admin-topbar-inner { max-width: 1120px; margin: 0 auto; padding: 14px 24px; display: flex; align-items: center; justify-content: space-between; }
        .yt-admin-brand { display: flex; align-items: center; gap: 10px; }
        .yt-admin-logo-circle { width: 28px; height: 28px; border-radius: 50%; background-color: #A0522D; color: #FFFFFF; display: flex; align-items: center; justify-content: center; font-size: 0.82rem; font-weight: 700; }
        .yt-admin-logo-text { font-size: 1rem; font-weight: 700; color: #2C1A0E; }
        .yt-admin-nav-right { display: flex; align-items: center; gap: 20px; }
        .yt-admin-nav-item { color: #6E5E52; text-decoration: none; font-size: 0.86rem; font-weight: 500; padding: 6px 14px; border-radius: 9999px; transition: all 0.2s; }
        .yt-admin-nav-item:hover { color: #2C1A0E; }
        .yt-admin-nav-item.active { background-color: #A0522D; color: #FFFFFF !important; font-weight: 600; }
        .yt-admin-divider { width: 1px; height: 20px; background-color: #D9CFC4; margin: 0 4px; }

        /* USER DROPDOWN */
        .yt-admin-user-wrapper { position: relative; display: inline-block; }
        .yt-admin-user-badge { display: flex; align-items: center; gap: 8px; cursor: pointer; padding: 4px 8px; border-radius: 9999px; user-select: none; transition: background-color 0.2s; }
        .yt-admin-user-badge:hover { background-color: #F0EAE1; }
        .yt-admin-avatar { width: 28px; height: 28px; border-radius: 50%; background-color: #A0522D; color: #FFFFFF; font-size: 0.72rem; font-weight: 700; display: flex; align-items: center; justify-content: center; }
        .yt-admin-user-name { font-size: 0.86rem; font-weight: 600; color: #2C1A0E; }
        .yt-admin-caret { font-size: 0.7rem; color: #7A6B60; }
        .yt-admin-dropdown-menu { position: absolute; top: calc(100% + 8px); right: 0; width: 230px; background: #FFFFFF; border: 1px solid #EBE4DD; border-radius: 12px; box-shadow: 0 8px 24px rgba(44, 26, 14, 0.12); padding: 12px 0; display: none; z-index: 1000; }
        .yt-admin-dropdown-menu.show { display: block; }
        .yt-admin-dd-header { padding: 6px 18px 10px 18px; }
        .yt-admin-dd-name { font-size: 0.88rem; font-weight: 700; color: #2C1A0E; margin-bottom: 2px; }
        .yt-admin-dd-email { font-size: 0.74rem; color: #8C7C71; word-break: break-all; }
        .yt-admin-dd-divider { height: 1px; background-color: #F2ECE5; margin: 6px 0; }
        .yt-admin-dd-item { display: block; padding: 8px 18px; font-size: 0.82rem; color: #4A3E36; text-decoration: none; font-weight: 500; transition: background-color 0.15s; }
        .yt-admin-dd-item:hover { background-color: #FAF7F2; color: #2C1A0E; }
        .yt-admin-dd-signout { color: #D32F2F !important; }
        .yt-admin-dd-signout:hover { background-color: #FDF2F2 !important; }

        /* PROFILE LAYOUT */
        .yt-admin-profile-page { padding: 40px 0 70px 0; }
        .yt-admin-profile-container { max-width: 620px; margin: 0 auto; padding: 0 20px; }

        /* USER HEADER */
        .yt-profile-head { display: flex; align-items: center; gap: 18px; margin-bottom: 28px; }
        .yt-profile-big-avatar { width: 56px; height: 56px; border-radius: 14px; background-color: #A0522D; color: #FFFFFF; font-size: 1.25rem; font-weight: 700; display: flex; align-items: center; justify-content: center; }
        .yt-profile-eyebrow { font-size: 0.68rem; font-weight: 700; color: #A0522D; text-transform: uppercase; letter-spacing: 0.8px; margin-bottom: 2px; }
        .yt-profile-name { font-family: 'Playfair Display', Georgia, serif; font-size: 1.6rem; font-weight: 700; color: #2C1A0E; margin-bottom: 2px; }
        .yt-profile-role { font-size: 0.82rem; color: #7A6B60; }

        /* CARD */
        .yt-prof-card { background: #FFFFFF; border: 1px solid #EBE4DD; border-radius: 12px; padding: 24px 28px; margin-bottom: 24px; box-shadow: 0 1px 3px rgba(0,0,0,0.02); }
        .yt-prof-card-head { display: flex; align-items: center; justify-content: space-between; margin-bottom: 18px; }
        .yt-prof-card-title { font-size: 1.05rem; font-weight: 700; color: #2C1A0E; }
        .yt-btn-edit { background: #FFFFFF; border: 1px solid #EBE4DD; border-radius: 9999px; padding: 4px 16px; font-size: 0.78rem; font-weight: 600; color: #6E5E52; cursor: pointer; transition: all 0.2s; }
        .yt-btn-edit:hover { border-color: #A0522D; color: #2C1A0E; }

        /* DETAILS ROWS */
        .yt-prof-row { display: flex; align-items: center; justify-content: space-between; padding: 13px 0; border-bottom: 1px solid #F4EFEA; font-size: 0.84rem; }
        .yt-prof-row:last-child { border-bottom: none; }
        .yt-prof-label { width: 35%; color: #8C7C71; font-weight: 500; }
        .yt-prof-value { width: 65%; color: #2C1A0E; font-weight: 500; }

        /* EDIT INPUTS */
        .yt-prof-input { width: 100%; height: 38px; background: #FAF7F2; border: 1px solid #E5DDD5; border-radius: 8px; padding: 0 12px; font-size: 0.84rem; color: #2C1A0E; outline: none; }
        .yt-prof-input:focus { background: #FFFFFF; border-color: #A0522D; }
        .yt-edit-actions { display: flex; align-items: center; gap: 10px; margin-top: 18px; }
        .yt-btn-save { background-color: #A0522D; color: #FFFFFF; border: none; border-radius: 9999px; padding: 8px 24px; font-size: 0.8rem; font-weight: 600; cursor: pointer; }
        .yt-btn-cancel { background-color: #FFFFFF; color: #6E5E52; border: 1px solid #EBE4DD; border-radius: 9999px; padding: 8px 18px; font-size: 0.8rem; font-weight: 600; cursor: pointer; }

        /* PASSWORD CARD */
        .yt-pwd-field { display: flex; align-items: center; justify-content: space-between; margin-bottom: 14px; font-size: 0.84rem; }
        .yt-pwd-label { width: 35%; color: #8C7C71; font-weight: 500; }
        .yt-pwd-input-wrap { width: 65%; }
        .yt-pwd-input { width: 100%; height: 38px; background: #FAF7F2; border: 1px solid #E5DDD5; border-radius: 8px; padding: 0 12px; font-size: 0.84rem; outline: none; }
        .yt-pwd-input:focus { background: #FFFFFF; border-color: #A0522D; }
        .yt-pwd-btn-wrap { display: flex; justify-content: flex-end; margin-top: 18px; }
        .yt-btn-update-pwd { background-color: #A0522D; color: #FFFFFF; border: none; border-radius: 9999px; padding: 9px 26px; font-size: 0.82rem; font-weight: 600; cursor: pointer; }
        .yt-btn-update-pwd:hover { background-color: #8A4322; }

        /* ALERTS */
        .yt-alert { padding: 10px 14px; border-radius: 8px; font-size: 0.8rem; margin-bottom: 14px; }
        .yt-alert-success { background-color: #D9F7E5; color: #237844; }
        .yt-alert-danger { background-color: #FDE8E8; color: #E02424; }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- ADMIN TOPBAR -->
        <header class="yt-admin-topbar">
            <div class="yt-admin-topbar-inner">
                <div class="yt-admin-brand">
                    <span class="yt-admin-logo-circle">Y</span>
                    <span class="yt-admin-logo-text">Yatrik Admin</span>
                </div>

                <div class="yt-admin-nav-right">
                    <a href="AdminDashboard.aspx" class="yt-admin-nav-item">Dashboard</a>
                    <a href="AdminHotels.aspx" class="yt-admin-nav-item">Hotels</a>
                    <a href="AdminBookings.aspx" class="yt-admin-nav-item">Bookings</a>
                    <a href="AdminUsers.aspx" class="yt-admin-nav-item">Users</a>
                    <a href="AdminReviews.aspx" class="yt-admin-nav-item">Reviews</a>

                    <div class="yt-admin-divider"></div>

                    <!-- USER AVATAR & DROPDOWN -->
                    <div class="yt-admin-user-wrapper">
                        <div class="yt-admin-user-badge" onclick="toggleAdminMenu(event)">
                            <span class="yt-admin-avatar">AU</span>
                            <span class="yt-admin-user-name">Admin User</span>
                            <span class="yt-admin-caret">&#9662;</span>
                        </div>

                        <div id="adminDropdownMenu" class="yt-admin-dropdown-menu">
                            <div class="yt-admin-dd-header">
                                <div class="yt-admin-dd-name">Admin User</div>
                                <div class="yt-admin-dd-email">ibharmal793@university.edu</div>
                            </div>
                            <div class="yt-admin-dd-divider"></div>
                            <a href="AdminProfile.aspx" class="yt-admin-dd-item">My Profile</a>
                            <a href="Default.aspx" class="yt-admin-dd-item">View Website</a>
                            <div class="yt-admin-dd-divider"></div>
                            <a href="Admin.aspx" class="yt-admin-dd-item yt-admin-dd-signout">Sign out</a>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- PAGE CONTENT -->
        <div class="yt-admin-profile-page">
            <div class="yt-admin-profile-container">

                <!-- USER HEADER -->
                <div class="yt-profile-head">
                    <div class="yt-profile-big-avatar">AU</div>
                    <div>
                        <div class="yt-profile-eyebrow">ADMIN ACCOUNT</div>
                        <h1 class="yt-profile-name"><asp:Literal ID="litHeadName" runat="server">Admin User</asp:Literal></h1>
                        <div class="yt-profile-role">Super Administrator</div>
                    </div>
                </div>

                <!-- PROFILE DETAILS CARD -->
                <div class="yt-prof-card">
                    <div class="yt-prof-card-head">
                        <div class="yt-prof-card-title">Profile details</div>
                        <asp:Button ID="btnEditToggle" runat="server" Text="Edit" CssClass="yt-btn-edit" OnClick="btnEditToggle_Click" />
                    </div>

                    <asp:Panel ID="pnlAlertProfile" runat="server" Visible="false">
                        <div class="yt-alert yt-alert-success"><asp:Literal ID="litAlertProfile" runat="server"></asp:Literal></div>
                    </asp:Panel>

                    <!-- VIEW MODE -->
                    <asp:Panel ID="pnlViewMode" runat="server">
                        <div class="yt-prof-row">
                            <span class="yt-prof-label">Full name</span>
                            <span class="yt-prof-value"><asp:Literal ID="litFullName" runat="server">Admin User</asp:Literal></span>
                        </div>
                        <div class="yt-prof-row">
                            <span class="yt-prof-label">Email</span>
                            <span class="yt-prof-value"><asp:Literal ID="litEmail" runat="server">j@gmail.com</asp:Literal></span>
                        </div>
                        <div class="yt-prof-row">
                            <span class="yt-prof-label">Phone</span>
                            <span class="yt-prof-value"><asp:Literal ID="litPhone" runat="server">+91 98000 00001</asp:Literal></span>
                        </div>
                        <div class="yt-prof-row">
                            <span class="yt-prof-label">Role</span>
                            <span class="yt-prof-value">Super Administrator</span>
                        </div>
                        <div class="yt-prof-row">
                            <span class="yt-prof-label">Department</span>
                            <span class="yt-prof-value">Hotel Operations</span>
                        </div>
                        <div class="yt-prof-row">
                            <span class="yt-prof-label">Location</span>
                            <span class="yt-prof-value"><asp:Literal ID="litLocation" runat="server">Mumbai, Maharashtra</asp:Literal></span>
                        </div>
                    </asp:Panel>

                    <!-- EDIT MODE -->
                    <asp:Panel ID="pnlEditMode" runat="server" Visible="false">
                        <div class="yt-prof-row">
                            <span class="yt-prof-label">Full name</span>
                            <div class="yt-prof-value"><asp:TextBox ID="txtFullName" runat="server" CssClass="yt-prof-input"></asp:TextBox></div>
                        </div>
                        <div class="yt-prof-row">
                            <span class="yt-prof-label">Email</span>
                            <div class="yt-prof-value"><asp:TextBox ID="txtEmail" runat="server" CssClass="yt-prof-input"></asp:TextBox></div>
                        </div>
                        <div class="yt-prof-row">
                            <span class="yt-prof-label">Phone</span>
                            <div class="yt-prof-value"><asp:TextBox ID="txtPhone" runat="server" CssClass="yt-prof-input"></asp:TextBox></div>
                        </div>
                        <div class="yt-prof-row">
                            <span class="yt-prof-label">Location</span>
                            <div class="yt-prof-value"><asp:TextBox ID="txtLocation" runat="server" CssClass="yt-prof-input"></asp:TextBox></div>
                        </div>
                        <div class="yt-edit-actions">
                            <asp:Button ID="btnSaveProfile" runat="server" Text="Save" CssClass="yt-btn-save" OnClick="btnSaveProfile_Click" />
                            <asp:Button ID="btnCancelProfile" runat="server" Text="Cancel" CssClass="yt-btn-cancel" OnClick="btnCancelProfile_Click" />
                        </div>
                    </asp:Panel>
                </div>

                <!-- CHANGE PASSWORD CARD -->
                <div class="yt-prof-card">
                    <div class="yt-prof-card-head">
                        <div class="yt-prof-card-title">Change password</div>
                    </div>

                    <asp:Panel ID="pnlAlertPwd" runat="server" Visible="false">
                        <div class="yt-alert <%= AlertPwdClass %>"><asp:Literal ID="litAlertPwd" runat="server"></asp:Literal></div>
                    </asp:Panel>

                    <div class="yt-pwd-field">
                        <span class="yt-pwd-label">Current password</span>
                        <div class="yt-pwd-input-wrap">
                            <asp:TextBox ID="txtCurrPwd" runat="server" TextMode="Password" placeholder="••••••••" CssClass="yt-pwd-input"></asp:TextBox>
                        </div>
                    </div>

                    <div class="yt-pwd-field">
                        <span class="yt-pwd-label">New password</span>
                        <div class="yt-pwd-input-wrap">
                            <asp:TextBox ID="txtNewPwd" runat="server" TextMode="Password" placeholder="••••••••" CssClass="yt-pwd-input"></asp:TextBox>
                        </div>
                    </div>

                    <div class="yt-pwd-field">
                        <span class="yt-pwd-label">Confirm new</span>
                        <div class="yt-pwd-input-wrap">
                            <asp:TextBox ID="txtConfirmPwd" runat="server" TextMode="Password" placeholder="••••••••" CssClass="yt-pwd-input"></asp:TextBox>
                        </div>
                    </div>

                    <div class="yt-pwd-btn-wrap">
                        <asp:Button ID="btnUpdatePwd" runat="server" Text="Update password" CssClass="yt-btn-update-pwd" OnClick="btnUpdatePwd_Click" />
                    </div>
                </div>

            </div>
        </div>

        <script>
function toggleAdminMenu(e) {
    e.stopPropagation();
    var menu = document.getElementById('adminDropdownMenu');
    if (menu) menu.classList.toggle('show');
}
window.addEventListener('click', function () {
    var menu = document.getElementById('adminDropdownMenu');
    if (menu && menu.classList.contains('show')) menu.classList.remove('show');
});
</script>
    </form>
</body>
</html>