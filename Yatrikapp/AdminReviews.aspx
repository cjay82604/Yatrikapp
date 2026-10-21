<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminReviews.aspx.cs" Inherits="Yatrikapp.AdminReviews" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Review Ratings - Yatrik Admin</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet" />

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            background-color: #FAF7F2;
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, sans-serif;
            color: #2C1A0E;
            min-height: 100vh;
        }

        /* ADMIN TOPBAR */
        .yt-admin-topbar {
            background-color: #FAF7F2;
            border-bottom: 1px solid #ECE4DC;
            width: 100%;
        }

        .yt-admin-topbar-inner {
            max-width: 1120px;
            margin: 0 auto;
            padding: 14px 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .yt-admin-brand {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .yt-admin-logo-circle {
            width: 28px;
            height: 28px;
            border-radius: 50%;
            background-color: #A0522D;
            color: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.82rem;
            font-weight: 700;
        }

        .yt-admin-logo-text {
            font-size: 1rem;
            font-weight: 700;
            color: #2C1A0E;
        }

        .yt-admin-nav-right {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .yt-admin-nav-item {
            color: #6E5E52;
            text-decoration: none;
            font-size: 0.86rem;
            font-weight: 500;
            padding: 6px 14px;
            border-radius: 9999px;
            transition: all 0.2s;
        }

        .yt-admin-nav-item:hover {
            color: #2C1A0E;
        }

        .yt-admin-nav-item.active {
            background-color: #A0522D;
            color: #FFFFFF !important;
            font-weight: 600;
        }

        .yt-admin-divider {
            width: 1px;
            height: 20px;
            background-color: #D9CFC4;
            margin: 0 4px;
        }

        /* USER DROPDOWN */
        .yt-admin-user-wrapper {
            position: relative;
            display: inline-block;
        }

        .yt-admin-user-badge {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            padding: 4px 8px;
            border-radius: 9999px;
            user-select: none;
            transition: background-color 0.2s;
        }

        .yt-admin-user-badge:hover {
            background-color: #F0EAE1;
        }

        .yt-admin-avatar {
            width: 28px;
            height: 28px;
            border-radius: 50%;
            background-color: #A0522D;
            color: #FFFFFF;
            font-size: 0.72rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .yt-admin-user-name {
            font-size: 0.86rem;
            font-weight: 600;
            color: #2C1A0E;
        }

        .yt-admin-caret {
            font-size: 0.7rem;
            color: #7A6B60;
        }

        .yt-admin-dropdown-menu {
            position: absolute;
            top: calc(100% + 8px);
            right: 0;
            width: 230px;
            background: #FFFFFF;
            border: 1px solid #EBE4DD;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(44, 26, 14, 0.12);
            padding: 12px 0;
            display: none;
            z-index: 1000;
        }

        .yt-admin-dropdown-menu.show {
            display: block;
        }

        .yt-admin-dd-header {
            padding: 6px 18px 10px 18px;
        }

        .yt-admin-dd-name {
            font-size: 0.88rem;
            font-weight: 700;
            color: #2C1A0E;
            margin-bottom: 2px;
        }

        .yt-admin-dd-email {
            font-size: 0.74rem;
            color: #8C7C71;
            word-break: break-all;
        }

        .yt-admin-dd-divider {
            height: 1px;
            background-color: #F2ECE5;
            margin: 6px 0;
        }

        .yt-admin-dd-item {
            display: block;
            padding: 8px 18px;
            font-size: 0.82rem;
            color: #4A3E36;
            text-decoration: none;
            font-weight: 500;
            transition: background-color 0.15s;
        }

        .yt-admin-dd-item:hover {
            background-color: #FAF7F2;
            color: #2C1A0E;
        }

        .yt-admin-dd-signout {
            color: #D32F2F !important;
        }

        .yt-admin-dd-signout:hover {
            background-color: #FDF2F2 !important;
        }

        /* PAGE CONTENT */
        .yt-admin-page {
            padding: 36px 0 60px 0;
        }

        .yt-admin-container {
            max-width: 1120px;
            margin: 0 auto;
            padding: 0 24px;
        }

        .yt-page-header {
            margin-bottom: 24px;
        }

        .yt-page-title {
            font-family: 'Playfair Display', Georgia, serif;
            font-size: 1.85rem;
            font-weight: 700;
            color: #2C1A0E;
            margin-bottom: 4px;
        }

        .yt-page-sub {
            font-size: 0.84rem;
            color: #7A6B60;
        }

        /* 4 KPI CARDS */
        .yt-kpi-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 18px;
            margin-bottom: 22px;
        }

        .yt-kpi-card {
            background: #FFFFFF;
            border: 1px solid #EBE4DD;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.02);
        }

        .yt-kpi-icon {
            font-size: 1rem;
            margin-bottom: 10px;
        }

        .yt-kpi-val {
            font-size: 1.6rem;
            font-weight: 700;
            color: #2C1A0E;
            margin-bottom: 2px;
        }

        .yt-kpi-label {
            font-size: 0.76rem;
            color: #8C7C71;
        }

        /* RATING DISTRIBUTION CARD */
        .yt-dist-card {
            background: #FFFFFF;
            border: 1px solid #EBE4DD;
            border-radius: 12px;
            padding: 22px 26px;
            margin-bottom: 24px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.02);
        }

        .yt-dist-title {
            font-size: 0.95rem;
            font-weight: 700;
            color: #2C1A0E;
            margin-bottom: 16px;
        }

        .yt-dist-row {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 10px;
            font-size: 0.8rem;
        }

        .yt-dist-row:last-child {
            margin-bottom: 0;
        }

        .yt-dist-star-label {
            width: 28px;
            color: #6E5E52;
            font-weight: 600;
        }

        .yt-dist-track {
            flex: 1;
            height: 7px;
            background-color: #F0EAE1;
            border-radius: 9999px;
            overflow: hidden;
        }

        .yt-dist-bar {
            height: 100%;
            background-color: #A0522D;
            border-radius: 9999px;
        }

        .yt-dist-count {
            width: 20px;
            text-align: right;
            font-size: 0.78rem;
            color: #8C7C71;
        }

        /* SEARCH & FILTER ROW */
        .yt-search-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            margin-bottom: 22px;
        }

        .yt-search-input {
            flex: 1;
            height: 42px;
            background: #FAF7F2;
            border: 1px solid #E5DDD5;
            border-radius: 9999px;
            padding: 0 20px;
            font-size: 0.84rem;
            color: #2C1A0E;
            outline: none;
            transition: all 0.2s;
        }

        .yt-search-input:focus {
            background: #FFFFFF;
            border-color: #A0522D;
        }

        .yt-filter-group {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .yt-filter-btn {
            background: #FFFFFF;
            border: 1px solid #EBE4DD;
            border-radius: 9999px;
            padding: 6px 18px;
            font-size: 0.82rem;
            font-weight: 600;
            color: #6E5E52;
            cursor: pointer;
            transition: all 0.2s;
        }

        .yt-filter-btn:hover {
            border-color: #A0522D;
            color: #2C1A0E;
        }

        .yt-filter-btn.active {
            background-color: #A0522D !important;
            color: #FFFFFF !important;
            border-color: #A0522D !important;
        }

        /* REVIEWS LIST CARDS */
        .yt-review-card {
            background: #FFFFFF;
            border: 1px solid #EBE4DD;
            border-radius: 12px;
            padding: 22px 24px;
            margin-bottom: 16px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.02);
        }

        .yt-review-top {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            margin-bottom: 12px;
        }

        .yt-review-user {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .yt-review-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background-color: #A0522D;
            color: #FFFFFF;
            font-size: 0.76rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .yt-review-user-name {
            font-weight: 600;
            color: #2C1A0E;
            font-size: 0.88rem;
        }

        .yt-review-user-meta {
            font-size: 0.74rem;
            color: #8C7C71;
            margin-top: 2px;
        }

        .yt-rev-badge {
            font-size: 0.72rem;
            font-weight: 600;
            padding: 3px 12px;
            border-radius: 9999px;
            display: inline-block;
        }

        .yt-rev-badge.published {
            background-color: #D9F7E5;
            color: #237844;
        }

        .yt-rev-badge.pending {
            background-color: #FEF3D6;
            color: #B57D00;
        }

        .yt-rev-badge.flagged {
            background-color: #FDE8E8;
            color: #E02424;
        }

        .yt-review-hotel-row {
            font-size: 0.78rem;
            color: #7A6B60;
            margin-bottom: 6px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .yt-review-stars-row {
            display: flex;
            align-items: center;
            gap: 6px;
            font-size: 0.78rem;
            margin-bottom: 10px;
        }

        .yt-review-stars {
            color: #E59819;
            letter-spacing: 1px;
        }

        .yt-review-score {
            color: #8C7C71;
            font-size: 0.74rem;
        }

        .yt-review-text {
            font-size: 0.85rem;
            color: #4A3E36;
            line-height: 1.55;
            margin-bottom: 16px;
        }

        .yt-review-actions {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .yt-btn-pill-action {
            background: #FFFFFF;
            border: 1px solid #EBE4DD;
            border-radius: 9999px;
            padding: 5px 14px;
            font-size: 0.74rem;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 4px;
            transition: all 0.2s;
        }

        .yt-btn-pill-action.publish {
            color: #0E9F6E;
            border-color: #BCF0DA;
            background-color: #F3FBF7;
        }

        .yt-btn-pill-action.pending {
            color: #B57D00;
            border-color: #FCE9B2;
            background-color: #FEFAF0;
        }

        .yt-btn-pill-action.flag {
            color: #E02424;
            border-color: #FBD5D5;
            background-color: #FDF4F4;
        }

        .yt-btn-delete-link {
            color: #E02424;
            text-decoration: none;
            font-size: 0.74rem;
            font-weight: 500;
            margin-left: 6px;
            cursor: pointer;
        }

        .yt-btn-delete-link:hover {
            text-decoration: underline;
        }
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
                    <a href="AdminReviews.aspx" class="yt-admin-nav-item active">Reviews</a>

                    <div class="yt-admin-divider"></div>

                    <!-- USER AVATAR & DROPDOWN -->
                    <div class="yt-admin-user-wrapper">
                        <div class="yt-admin-user-badge" onclick="toggleAdminMenu(event)">
                            <span class="yt-admin-avatar">AU</span>
                            <span class="yt-admin-user-name">Admin User</span>
                            <span class="yt-admin-caret">&#9662;</span>
                        </div>

                        <!-- DROPDOWN CONTENT -->
                        <div id="adminDropdownMenu" class="yt-admin-dropdown-menu">
                            <div class="yt-admin-dd-header">
                                <div class="yt-admin-dd-name">Admin User</div>
<<<<<<< HEAD
                                <div class="yt-admin-dd-email">ibharmal793@university.edu</div>
=======
                                <div class="yt-admin-dd-email">admin@yatrik.in</div>
>>>>>>> 8c058e2c69959a48730eb36c04586dbc3e20f10d
                            </div>

                            <div class="yt-admin-dd-divider"></div>

<<<<<<< HEAD
                            <a href="Profile.aspx" class="yt-admin-dd-item">My Profile</a>
=======
                            <a href="AdminProfile.aspx" class="yt-admin-dd-item">My Profile</a>
>>>>>>> 8c058e2c69959a48730eb36c04586dbc3e20f10d
                            <a href="Default.aspx" class="yt-admin-dd-item">View Website</a>

                            <div class="yt-admin-dd-divider"></div>

                            <a href="Admin.aspx" class="yt-admin-dd-item yt-admin-dd-signout">Sign out</a>
                        </div>
                    </div>

                </div>
            </div>
        </header>

        <!-- MAIN PAGE -->
        <div class="yt-admin-page">
            <div class="yt-admin-container">

                <div class="yt-page-header">
                    <h1 class="yt-page-title">Review Ratings</h1>
                    <p class="yt-page-sub"><asp:Literal ID="litSubCount" runat="server">6 reviews across all properties</asp:Literal></p>
                </div>

                <!-- 4 KPI CARDS -->
                <div class="yt-kpi-grid">
                    <div class="yt-kpi-card">
                        <div class="yt-kpi-icon" style="color: #E59819;">⭐</div>
                        <div class="yt-kpi-val"><asp:Literal ID="litAvgRating" runat="server">4.0 ★</asp:Literal></div>
                        <div class="yt-kpi-label">Avg Rating</div>
                    </div>

                    <div class="yt-kpi-card">
                        <div class="yt-kpi-icon" style="color: #237844;">✓</div>
                        <div class="yt-kpi-val"><asp:Literal ID="litPublishedCount" runat="server">3</asp:Literal></div>
                        <div class="yt-kpi-label">Published</div>
                    </div>

                    <div class="yt-kpi-card">
                        <div class="yt-kpi-icon" style="color: #B57D00;">⌛</div>
                        <div class="yt-kpi-val"><asp:Literal ID="litPendingCount" runat="server">2</asp:Literal></div>
                        <div class="yt-kpi-label">Pending</div>
                    </div>

                    <div class="yt-kpi-card">
                        <div class="yt-kpi-icon" style="color: #E02424;">⚑</div>
                        <div class="yt-kpi-val"><asp:Literal ID="litFlaggedCount" runat="server">1</asp:Literal></div>
                        <div class="yt-kpi-label">Flagged</div>
                    </div>
                </div>

                <!-- RATING DISTRIBUTION -->
                <div class="yt-dist-card">
                    <div class="yt-dist-title">Rating Distribution</div>

                    <div class="yt-dist-row">
                        <span class="yt-dist-star-label">5 ★</span>
                        <div class="yt-dist-track"><div class="yt-dist-bar" style='width: <%= Pct5 %>%'></div></div>
                        <span class="yt-dist-count"><asp:Literal ID="litCount5" runat="server">3</asp:Literal></span>
                    </div>

                    <div class="yt-dist-row">
                        <span class="yt-dist-star-label">4 ★</span>
                        <div class="yt-dist-track"><div class="yt-dist-bar" style='width: <%= Pct4 %>%'></div></div>
                        <span class="yt-dist-count"><asp:Literal ID="litCount4" runat="server">1</asp:Literal></span>
                    </div>

                    <div class="yt-dist-row">
                        <span class="yt-dist-star-label">3 ★</span>
                        <div class="yt-dist-track"><div class="yt-dist-bar" style='width: <%= Pct3 %>%'></div></div>
                        <span class="yt-dist-count"><asp:Literal ID="litCount3" runat="server">1</asp:Literal></span>
                    </div>

                    <div class="yt-dist-row">
                        <span class="yt-dist-star-label">2 ★</span>
                        <div class="yt-dist-track"><div class="yt-dist-bar" style='width: <%= Pct2 %>%'></div></div>
                        <span class="yt-dist-count"><asp:Literal ID="litCount2" runat="server">1</asp:Literal></span>
                    </div>

                    <div class="yt-dist-row">
                        <span class="yt-dist-star-label">1 ★</span>
                        <div class="yt-dist-track"><div class="yt-dist-bar" style='width: <%= Pct1 %>%'></div></div>
                        <span class="yt-dist-count"><asp:Literal ID="litCount1" runat="server">0</asp:Literal></span>
                    </div>
                </div>

                <!-- SEARCH & FILTER ROW -->
                <div class="yt-search-row">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="yt-search-input" 
                        placeholder="Search by guest name, hotel, or review text..." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>

                    <div class="yt-filter-group">
                        <asp:Button ID="btnFilterAll" runat="server" Text="All" CssClass="yt-filter-btn active" OnClick="Filter_Click" CommandArgument="All" />
                        <asp:Button ID="btnFilterPublished" runat="server" Text="Published" CssClass="yt-filter-btn" OnClick="Filter_Click" CommandArgument="Published" />
                        <asp:Button ID="btnFilterPending" runat="server" Text="Pending" CssClass="yt-filter-btn" OnClick="Filter_Click" CommandArgument="Pending" />
                        <asp:Button ID="btnFilterFlagged" runat="server" Text="Flagged" CssClass="yt-filter-btn" OnClick="Filter_Click" CommandArgument="Flagged" />
                    </div>
                </div>

                <!-- REVIEW CARDS -->
                <asp:Repeater ID="rptReviews" runat="server" OnItemCommand="rptReviews_ItemCommand">
                    <ItemTemplate>
                        <div class="yt-review-card">
                            <div class="yt-review-top">
                                <div class="yt-review-user">
                                    <div class="yt-review-avatar"><%# Eval("Initials") %></div>
                                    <div>
                                        <div class="yt-review-user-name"><%# Eval("GuestName") %></div>
                                        <div class="yt-review-user-meta"><%# Eval("Email") %> &bull; <%# Eval("ReviewDate") %></div>
                                    </div>
                                </div>
                                <span class='yt-rev-badge <%# Eval("Status").ToString().ToLower() %>'><%# Eval("Status") %></span>
                            </div>

                            <div class="yt-review-hotel-row">
                                <span>🏨</span>
                                <span><%# Eval("HotelName") %></span>
                            </div>

                            <div class="yt-review-stars-row">
                                <span class="yt-review-stars"><%# Eval("StarSymbols") %></span>
                                <span class="yt-review-score"><%# Eval("Rating") %>/5</span>
                            </div>

                            <div class="yt-review-text">
                                "<%# Eval("Comment") %>"
                            </div>

                            <div class="yt-review-actions">
                                <asp:LinkButton ID="btnPublish" runat="server" CommandName="Publish" CommandArgument='<%# Eval("Id") %>' 
                                    CssClass="yt-btn-pill-action publish" Visible='<%# Eval("Status").ToString() != "Published" %>'>
                                    ✓ Publish
                                </asp:LinkButton>

                                <asp:LinkButton ID="btnPending" runat="server" CommandName="Pending" CommandArgument='<%# Eval("Id") %>' 
                                    CssClass="yt-btn-pill-action pending" Visible='<%# Eval("Status").ToString() != "Pending" %>'>
                                    ⌛ Move to Pending
                                </asp:LinkButton>

                                <asp:LinkButton ID="btnFlag" runat="server" CommandName="Flag" CommandArgument='<%# Eval("Id") %>' 
                                    CssClass="yt-btn-pill-action flag" Visible='<%# Eval("Status").ToString() != "Flagged" %>'>
                                    ⚑ Flag
                                </asp:LinkButton>

                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("Id") %>' 
                                    CssClass="yt-btn-delete-link" OnClientClick="return confirm('Are you sure you want to delete this review?');">
                                    Delete
                                </asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>

        <!-- DROPDOWN TOGGLE SCRIPT -->
        <script>
function toggleAdminMenu(e) {
    e.stopPropagation();
    var menu = document.getElementById('adminDropdownMenu');
    if (menu) {
        menu.classList.toggle('show');
    }
}

window.addEventListener('click', function (e) {
    var menu = document.getElementById('adminDropdownMenu');
    if (menu && menu.classList.contains('show')) {
        menu.classList.remove('show');
    }
});
</script>

    </form>
</body>
</html>