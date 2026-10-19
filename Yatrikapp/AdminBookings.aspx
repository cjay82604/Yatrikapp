<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminBookings.aspx.cs" Inherits="Yatrikapp.AdminBookings" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Bookings - Yatrik Admin</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet" />

    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { background-color: #FAF7F2; font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, sans-serif; color: #2C1A0E; min-height: 100vh; }

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

        .yt-admin-page { padding: 36px 0 60px 0; }
        .yt-admin-container { max-width: 1120px; margin: 0 auto; padding: 0 24px; }
        .yt-page-header { margin-bottom: 22px; }
        .yt-page-title { font-family: 'Playfair Display', Georgia, serif; font-size: 1.85rem; font-weight: 700; color: #2C1A0E; margin-bottom: 4px; }
        .yt-page-sub { font-size: 0.84rem; color: #7A6B60; }
        .yt-filter-row { display: flex; gap: 10px; margin-bottom: 24px; }
        .yt-filter-btn { background: #FFFFFF; border: 1px solid #EBE4DD; border-radius: 9999px; padding: 6px 18px; font-size: 0.82rem; font-weight: 600; color: #6E5E52; cursor: pointer; transition: all 0.2s; }
        .yt-filter-btn:hover { border-color: #A0522D; color: #2C1A0E; }
        .yt-filter-btn.active { background-color: #A0522D !important; color: #FFFFFF !important; border-color: #A0522D !important; }
        .yt-admin-card { background: #FFFFFF; border: 1px solid #EBE4DD; border-radius: 12px; overflow: hidden; box-shadow: 0 1px 3px rgba(0,0,0,0.02); }
        .yt-booking-table { width: 100%; border-collapse: collapse; text-align: left; }
        .yt-booking-table th { background-color: #FFFFFF; font-size: 0.68rem; font-weight: 700; color: #8C7C71; text-transform: uppercase; letter-spacing: 0.5px; padding: 16px 20px; border-bottom: 1px solid #EBE4DD; }
        .yt-booking-table td { padding: 15px 20px; border-bottom: 1px solid #F4EFEA; vertical-align: middle; font-size: 0.82rem; }
        .yt-booking-table tr:last-child td { border-bottom: none; }
        .yt-booking-id { color: #7A6B60; font-size: 0.78rem; font-family: monospace; }
        .yt-guest-name { font-weight: 600; color: #2C1A0E; font-size: 0.84rem; margin-bottom: 2px; }
        .yt-guest-email { font-size: 0.74rem; color: #8C7C71; }
        .yt-hotel-col { font-weight: 500; color: #2C1A0E; }
        .yt-dates-col { font-size: 0.76rem; color: #6E5E52; line-height: 1.45; }
        .yt-guests-col { color: #6E5E52; }
        .yt-total-col { font-weight: 600; color: #2C1A0E; }
        .yt-status-badge { font-size: 0.72rem; font-weight: 600; padding: 4px 12px; border-radius: 9999px; display: inline-block; }
        .yt-status-badge.confirmed { background-color: #D9F7E5; color: #237844; }
        .yt-status-badge.pending { background-color: #FFF3CD; color: #B57D00; }
        .yt-status-badge.cancelled { background-color: #FFE6E6; color: #D32F2F; }
        .yt-actions-cell { display: flex; align-items: center; gap: 10px; }
        .yt-btn-act-confirm { color: #0E9F6E; text-decoration: none; font-weight: 600; font-size: 0.76rem; cursor: pointer; }
        .yt-btn-act-cancel { color: #D32F2F; text-decoration: none; font-weight: 600; font-size: 0.76rem; cursor: pointer; }
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
                    <a href="AdminDashboard.aspx" class="yt-admin-nav-item">Dashboard</a>
                    <a href="AdminHotels.aspx" class="yt-admin-nav-item">Hotels</a>
                    <a href="AdminBookings.aspx" class="yt-admin-nav-item active">Bookings</a>
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

        <div class="yt-admin-page">
            <div class="yt-admin-container">
                <div class="yt-page-header">
                    <h1 class="yt-page-title">Manage Bookings</h1>
                    <p class="yt-page-sub"><asp:Literal ID="litTotalSubtitle" runat="server">6 total bookings</asp:Literal></p>
                </div>

                <div class="yt-filter-row">
                    <asp:Button ID="btnFilterAll" runat="server" Text="All (6)" CssClass="yt-filter-btn active" OnClick="Filter_Click" CommandArgument="All" />
                    <asp:Button ID="btnFilterConfirmed" runat="server" Text="Confirmed (4)" CssClass="yt-filter-btn" OnClick="Filter_Click" CommandArgument="Confirmed" />
                    <asp:Button ID="btnFilterPending" runat="server" Text="Pending (1)" CssClass="yt-filter-btn" OnClick="Filter_Click" CommandArgument="Pending" />
                    <asp:Button ID="btnFilterCancelled" runat="server" Text="Cancelled (1)" CssClass="yt-filter-btn" OnClick="Filter_Click" CommandArgument="Cancelled" />
                </div>

                <div class="yt-admin-card">
                    <table class="yt-booking-table">
                        <thead>
                            <tr>
                                <th style="width: 10%;">ID</th>
                                <th style="width: 20%;">GUEST</th>
                                <th style="width: 22%;">HOTEL</th>
                                <th style="width: 17%;">DATES</th>
                                <th style="width: 8%;">GUESTS</th>
                                <th style="width: 10%;">TOTAL</th>
                                <th style="width: 11%;">STATUS</th>
                                <th style="width: 12%;">ACTIONS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptBookings" runat="server" OnItemCommand="rptBookings_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td class="yt-booking-id"><%# Eval("Id") %></td>
                                        <td>
                                            <div class="yt-guest-name"><%# Eval("GuestName") %></div>
                                            <div class="yt-guest-email"><%# Eval("Email") %></div>
                                        </td>
                                        <td class="yt-hotel-col"><%# Eval("HotelName") %></td>
                                        <td class="yt-dates-col"><%# Eval("Dates") %></td>
                                        <td class="yt-guests-col"><%# Eval("Guests") %></td>
                                        <td class="yt-total-col">₹<%# Eval("Amount", "{0:N0}") %></td>
                                        <td>
                                            <span class='yt-status-badge <%# Eval("Status").ToString().ToLower() %>'><%# Eval("Status") %></span>
                                        </td>
                                        <td>
                                            <div class="yt-actions-cell">
                                                <asp:LinkButton ID="btnConfirm" runat="server" CommandName="Confirm" CommandArgument='<%# Eval("Id") %>' 
                                                    CssClass="yt-btn-act-confirm" Visible='<%# Eval("Status").ToString() != "Confirmed" %>'>Confirm</asp:LinkButton>
                                                
                                                <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" CommandArgument='<%# Eval("Id") %>' 
                                                    CssClass="yt-btn-act-cancel" Visible='<%# Eval("Status").ToString() != "Cancelled" %>'>Cancel</asp:LinkButton>
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
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