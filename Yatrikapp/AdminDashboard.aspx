<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Yatrikapp.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard - Yatrik Admin</title>
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

        /* DASHBOARD CONTENT */
        .yt-admin-dash-page { padding: 36px 0 60px 0; }
        .yt-admin-dash-container { max-width: 1120px; margin: 0 auto; padding: 0 24px; }
        .yt-dash-header { margin-bottom: 28px; }
        .yt-dash-title { font-family: 'Playfair Display', Georgia, serif; font-size: 2.1rem; font-weight: 700; color: #2C1A0E; margin-bottom: 4px; }
        .yt-dash-sub { font-size: 0.88rem; color: #7A6B60; }
        .yt-dash-kpi-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 18px; margin-bottom: 28px; }
        .yt-dash-kpi-card { background: #FFFFFF; border: 1px solid #EBE4DD; border-radius: 12px; padding: 20px; box-shadow: 0 1px 3px rgba(0,0,0,0.02); }
        .yt-dash-kpi-label { font-size: 0.68rem; font-weight: 700; color: #8C7C71; letter-spacing: 0.6px; margin-bottom: 8px; text-transform: uppercase; }
        .yt-dash-kpi-value { font-size: 1.7rem; font-weight: 700; color: #2C1A0E; margin-bottom: 4px; }
        .yt-dash-kpi-sub { font-size: 0.75rem; color: #9C8C81; }
        .yt-dash-two-col { display: grid; grid-template-columns: 1.4fr 1fr; gap: 22px; margin-bottom: 24px; }
        .yt-dash-panel { background: #FFFFFF; border: 1px solid #EBE4DD; border-radius: 12px; padding: 22px; box-shadow: 0 1px 3px rgba(0,0,0,0.02); }
        .yt-dash-panel-header { display: flex; align-items: center; justify-content: space-between; margin-bottom: 18px; }
        .yt-dash-panel-title { font-size: 1.05rem; font-weight: 700; color: #2C1A0E; }
        .yt-dash-view-all { font-size: 0.8rem; color: #7A6B60; text-decoration: none; font-weight: 500; }
        .yt-dash-view-all:hover { color: #A0522D; }
        .yt-dash-booking-list { display: flex; flex-direction: column; }
        .yt-dash-booking-item { display: flex; align-items: center; justify-content: space-between; padding: 13px 0; border-bottom: 1px solid #F4EFEA; }
        .yt-dash-booking-item:last-child { border-bottom: none; }
        .yt-dash-guest-name { font-weight: 600; color: #2C1A0E; font-size: 0.88rem; margin-bottom: 3px; }
        .yt-dash-hotel-date { font-size: 0.75rem; color: #8C7C71; }
        .yt-dash-booking-right { text-align: right; display: flex; flex-direction: column; align-items: flex-end; gap: 4px; }
        .yt-dash-booking-amount { font-weight: 700; color: #2C1A0E; font-size: 0.88rem; }
        .yt-dash-status-pill { font-size: 0.68rem; font-weight: 600; padding: 2px 10px; border-radius: 9999px; display: inline-block; }
        .yt-dash-status-pill.confirmed { background-color: #D9F7E5; color: #237844; }
        .yt-dash-status-pill.pending { background-color: #FFF3CD; color: #856404; }
        .yt-dash-status-pill.cancelled { background-color: #FFE6E6; color: #D32F2F; }
        .yt-dash-hotel-list { display: flex; flex-direction: column; }
        .yt-dash-hotel-item { display: flex; align-items: center; gap: 12px; padding: 11px 0; border-bottom: 1px solid #F4EFEA; }
        .yt-dash-hotel-item:last-child { border-bottom: none; }
        .yt-dash-hotel-img { width: 44px; height: 44px; border-radius: 8px; object-fit: cover; }
        .yt-dash-hotel-info { flex: 1; }
        .yt-dash-hotel-title { font-weight: 600; color: #2C1A0E; font-size: 0.85rem; margin-bottom: 2px; }
        .yt-dash-hotel-location { font-size: 0.74rem; color: #8C7C71; }
        .yt-dash-hotel-price { font-weight: 700; color: #2C1A0E; font-size: 0.85rem; text-align: right; }
        .yt-per-night { font-size: 0.72rem; font-weight: 400; color: #8C7C71; }
        .yt-dash-banner { background-color: #FEF9E7; border: 1px solid #F3E3B5; border-radius: 10px; padding: 14px 20px; display: flex; align-items: center; gap: 12px; font-size: 0.84rem; color: #795548; }
        .yt-dash-banner-icon { font-size: 1.1rem; color: #D9822B; }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <header class="yt-admin-topbar">
            <div class="yt-admin-topbar-inner">
                <div class="yt-admin-brand">
                    <span class="yt-admin-logo-circle">Y</span>
                    <span class="yt-admin-logo-text">Yatrik Admin</span>
                </div>

                <div class="yt-admin-nav-right">
                    <a href="AdminDashboard.aspx" class="yt-admin-nav-item active">Dashboard</a>
                    <a href="AdminHotels.aspx" class="yt-admin-nav-item">Hotels</a>
                    <a href="AdminBookings.aspx" class="yt-admin-nav-item">Bookings</a>
                    <a href="AdminUsers.aspx" class="yt-admin-nav-item">Users</a>
                    <a href="AdminReviews.aspx" class="yt-admin-nav-item">Reviews</a>

                    <div class="yt-admin-divider"></div>

                    <!-- DROPDOWN -->
                    <div class="yt-admin-user-wrapper">
                        <div class="yt-admin-user-badge" onclick="toggleAdminMenu(event)">
                            <span class="yt-admin-avatar">AU</span>
                            <span class="yt-admin-user-name">Admin User</span>
                            <span class="yt-admin-caret">&#9662;</span>
                        </div>

                        <div id="adminDropdownMenu" class="yt-admin-dropdown-menu">
                            <div class="yt-admin-dd-header">
                                <div class="yt-admin-dd-name">Admin User</div>
                                <div class="yt-admin-dd-email">admin@yatrik.in</div>
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

        <div class="yt-admin-dash-page">
            <div class="yt-admin-dash-container">
                <div class="yt-dash-header">
                    <h1 class="yt-dash-title">Dashboard</h1>
                    <p class="yt-dash-sub">Welcome back, Admin. Here is what is happening today.</p>
                </div>

                <div class="yt-dash-kpi-grid">
                    <div class="yt-dash-kpi-card">
                        <div class="yt-dash-kpi-label">TOTAL REVENUE</div>
                        <div class="yt-dash-kpi-value"><asp:Literal ID="litRevenue" runat="server">₹1,22,040</asp:Literal></div>
                        <div class="yt-dash-kpi-sub">Across all bookings</div>
                    </div>
                    <div class="yt-dash-kpi-card">
                        <div class="yt-dash-kpi-label">TOTAL BOOKINGS</div>
                        <div class="yt-dash-kpi-value"><asp:Literal ID="litBookings" runat="server">6</asp:Literal></div>
                        <div class="yt-dash-kpi-sub">All time</div>
                    </div>
                    <div class="yt-dash-kpi-card">
                        <div class="yt-dash-kpi-label">HOTELS LISTED</div>
                        <div class="yt-dash-kpi-value"><asp:Literal ID="litHotelsCount" runat="server">12</asp:Literal></div>
                        <div class="yt-dash-kpi-sub">Across India</div>
                    </div>
                    <div class="yt-dash-kpi-card">
                        <div class="yt-dash-kpi-label">CONFIRMED STAYS</div>
                        <div class="yt-dash-kpi-value"><asp:Literal ID="litConfirmedStays" runat="server">4</asp:Literal></div>
                        <div class="yt-dash-kpi-sub">Ready to check in</div>
                    </div>
                </div>

                <div class="yt-dash-two-col">
                    <div class="yt-dash-panel">
                        <div class="yt-dash-panel-header">
                            <h2 class="yt-dash-panel-title">Recent Bookings</h2>
                            <a href="AdminBookings.aspx" class="yt-dash-view-all">View all &rarr;</a>
                        </div>
                        <div class="yt-dash-booking-list">
                            <asp:Repeater ID="rptRecentBookings" runat="server">
                                <ItemTemplate>
                                    <div class="yt-dash-booking-item">
                                        <div class="yt-dash-booking-info">
                                            <div class="yt-dash-guest-name"><%# Eval("GuestName") %></div>
                                            <div class="yt-dash-hotel-date"><%# Eval("HotelName") %> &bull; <%# Eval("Dates") %></div>
                                        </div>
                                        <div class="yt-dash-booking-right">
                                            <div class="yt-dash-booking-amount">₹<%# Eval("Amount", "{0:N0}") %></div>
                                            <div class="yt-dash-status-pill <%# Eval("Status").ToString().ToLower() %>"><%# Eval("Status") %></div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <div class="yt-dash-panel">
                        <div class="yt-dash-panel-header">
                            <h2 class="yt-dash-panel-title">Hotels</h2>
                            <a href="AdminHotels.aspx" class="yt-dash-view-all">View all &rarr;</a>
                        </div>
                        <div class="yt-dash-hotel-list">
                            <asp:Repeater ID="rptDashHotels" runat="server">
                                <ItemTemplate>
                                    <div class="yt-dash-hotel-item">
                                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' class="yt-dash-hotel-img" />
                                        <div class="yt-dash-hotel-info">
                                            <div class="yt-dash-hotel-title"><%# Eval("Name") %></div>
                                            <div class="yt-dash-hotel-location"><%# Eval("ShortLocation") %></div>
                                        </div>
                                        <div class="yt-dash-hotel-price">
                                            ₹<%# Eval("Price", "{0:N0}") %><span class="yt-per-night">/night</span>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>

                <div class="yt-dash-banner">
                    <span class="yt-dash-banner-icon">&#9888;</span>
                    <span class="yt-dash-banner-text">
                        <strong><asp:Literal ID="litPendingCount" runat="server">1</asp:Literal> booking pending your review.</strong> Check the bookings tab to confirm or cancel.
                    </span>
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