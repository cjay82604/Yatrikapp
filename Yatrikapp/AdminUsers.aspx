<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminUsers.aspx.cs" Inherits="Yatrikapp.AdminUsers" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All Users - Yatrik Admin</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet" />

    <style>
<<<<<<< HEAD
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
=======
        * { box-sizing: border-box; margin: 0; padding: 0; }
>>>>>>> 8c058e2c69959a48730eb36c04586dbc3e20f10d

        body {
            background-color: #FAF7F2;
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, sans-serif;
            color: #2C1A0E;
            min-height: 100vh;
        }

        /* ADMIN TOPBAR */
<<<<<<< HEAD
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

        .yt-admin-user-badge {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
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

        /* PAGE CONTAINER */
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

        /* 3 KPI CARDS */
        .yt-users-kpi-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 24px;
        }

        .yt-users-kpi-card {
            background: #FFFFFF;
            border: 1px solid #EBE4DD;
            border-radius: 12px;
            padding: 22px 24px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.02);
        }

        .yt-users-kpi-icon {
            font-size: 1.15rem;
            margin-bottom: 12px;
            display: inline-block;
        }

        .yt-users-kpi-val {
            font-size: 1.7rem;
            font-weight: 700;
            color: #2C1A0E;
            margin-bottom: 3px;
        }

        .yt-users-kpi-label {
            font-size: 0.76rem;
            color: #8C7C71;
        }

        /* SEARCH & FILTER ROW */
        .yt-users-search-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            margin-bottom: 24px;
        }

        .yt-users-search-input {
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

        .yt-users-search-input:focus {
            background: #FFFFFF;
            border-color: #A0522D;
        }

        .yt-users-filter-group {
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

        /* USERS TABLE CARD */
        .yt-admin-card {
            background: #FFFFFF;
            border: 1px solid #EBE4DD;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0,0,0,0.02);
        }

        .yt-users-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        .yt-users-table th {
            background-color: #FFFFFF;
            font-size: 0.68rem;
            font-weight: 700;
            color: #8C7C71;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            padding: 16px 20px;
            border-bottom: 1px solid #EBE4DD;
        }

        .yt-users-table td {
            padding: 14px 20px;
            border-bottom: 1px solid #F4EFEA;
            vertical-align: middle;
            font-size: 0.82rem;
        }

        .yt-users-table tr:last-child td {
            border-bottom: none;
        }

        /* USER COLUMN */
        .yt-user-cell {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .yt-user-avatar-circle {
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

        .yt-user-info {
            display: flex;
            flex-direction: column;
        }

        .yt-user-fullname {
            font-weight: 600;
            color: #2C1A0E;
            font-size: 0.84rem;
            margin-bottom: 2px;
        }

        .yt-user-email {
            font-size: 0.74rem;
            color: #8C7C71;
        }

        .yt-phone-col {
            color: #555555;
            font-size: 0.82rem;
        }

        .yt-loc-col {
            color: #2C1A0E;
            font-size: 0.82rem;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .yt-loc-pin {
            color: #D32F2F;
            font-size: 0.85rem;
        }

        .yt-joined-col {
            color: #6E5E52;
            font-size: 0.78rem;
        }

        /* BOOKINGS COUNT PILL */
        .yt-booking-count-badge {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            background-color: #F4EFEA;
            color: #6E5E52;
            font-size: 0.74rem;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        /* STATUS BADGE */
        .yt-status-badge {
            font-size: 0.72rem;
            font-weight: 600;
            padding: 4px 12px;
            border-radius: 9999px;
            display: inline-block;
        }

        .yt-status-badge.active {
            background-color: #D9F7E5;
            color: #237844;
        }

        .yt-status-badge.inactive {
            background-color: #EFE9E2;
            color: #7A6B60;
        }

        /* ACTIONS */
        .yt-actions-cell {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .yt-btn-deactivate {
            color: #C07A38;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.76rem;
            cursor: pointer;
        }

        .yt-btn-deactivate:hover {
            text-decoration: underline;
        }

        .yt-btn-activate {
            color: #237844;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.76rem;
            cursor: pointer;
        }

        .yt-btn-activate:hover {
            text-decoration: underline;
        }

        .yt-btn-delete {
            color: #E02424;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.76rem;
            cursor: pointer;
        }

        .yt-btn-delete:hover {
            text-decoration: underline;
        }
        /* ADMIN USER DROPDOWN */
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

.yt-admin-dropdown-menu {
    position: absolute;
    top: calc(100% + 8px);
    right: 0;
    width: 220px;
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
=======
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

        /* ADMIN USER DROPDOWN */
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

        /* PAGE CONTAINER */
        .yt-admin-page { padding: 36px 0 60px 0; }
        .yt-admin-container { max-width: 1120px; margin: 0 auto; padding: 0 24px; }
        .yt-page-header { margin-bottom: 24px; }
        .yt-page-title { font-family: 'Playfair Display', Georgia, serif; font-size: 1.85rem; font-weight: 700; color: #2C1A0E; margin-bottom: 4px; }
        .yt-page-sub { font-size: 0.84rem; color: #7A6B60; }

        /* 3 KPI CARDS */
        .yt-users-kpi-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-bottom: 24px; }
        .yt-users-kpi-card { background: #FFFFFF; border: 1px solid #EBE4DD; border-radius: 12px; padding: 22px 24px; box-shadow: 0 1px 3px rgba(0,0,0,0.02); }
        .yt-users-kpi-icon { font-size: 1.15rem; margin-bottom: 12px; display: inline-block; }
        .yt-users-kpi-val { font-size: 1.7rem; font-weight: 700; color: #2C1A0E; margin-bottom: 3px; }
        .yt-users-kpi-label { font-size: 0.76rem; color: #8C7C71; }

        /* SEARCH & FILTER ROW */
        .yt-users-search-row { display: flex; align-items: center; justify-content: space-between; gap: 16px; margin-bottom: 24px; }
        .yt-users-search-input { flex: 1; height: 42px; background: #FAF7F2; border: 1px solid #E5DDD5; border-radius: 9999px; padding: 0 20px; font-size: 0.84rem; color: #2C1A0E; outline: none; transition: all 0.2s; }
        .yt-users-search-input:focus { background: #FFFFFF; border-color: #A0522D; }
        .yt-users-filter-group { display: flex; align-items: center; gap: 8px; }
        .yt-filter-btn { background: #FFFFFF; border: 1px solid #EBE4DD; border-radius: 9999px; padding: 6px 18px; font-size: 0.82rem; font-weight: 600; color: #6E5E52; cursor: pointer; transition: all 0.2s; }
        .yt-filter-btn:hover { border-color: #A0522D; color: #2C1A0E; }
        .yt-filter-btn.active { background-color: #A0522D !important; color: #FFFFFF !important; border-color: #A0522D !important; }

        /* USERS TABLE CARD */
        .yt-admin-card { background: #FFFFFF; border: 1px solid #EBE4DD; border-radius: 12px; overflow: hidden; box-shadow: 0 1px 3px rgba(0,0,0,0.02); }
        .yt-users-table { width: 100%; border-collapse: collapse; text-align: left; }
        .yt-users-table th { background-color: #FFFFFF; font-size: 0.68rem; font-weight: 700; color: #8C7C71; text-transform: uppercase; letter-spacing: 0.5px; padding: 16px 20px; border-bottom: 1px solid #EBE4DD; }
        .yt-users-table td { padding: 14px 20px; border-bottom: 1px solid #F4EFEA; vertical-align: middle; font-size: 0.82rem; }
        .yt-users-table tr:last-child td { border-bottom: none; }

        /* USER COLUMN */
        .yt-user-cell { display: flex; align-items: center; gap: 12px; }
        .yt-user-avatar-circle { width: 36px; height: 36px; border-radius: 50%; background-color: #A0522D; color: #FFFFFF; font-size: 0.76rem; font-weight: 700; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
        .yt-user-info { display: flex; flex-direction: column; }
        .yt-user-fullname { font-weight: 600; color: #2C1A0E; font-size: 0.84rem; margin-bottom: 2px; }
        .yt-user-email { font-size: 0.74rem; color: #8C7C71; }
        .yt-phone-col { color: #555555; font-size: 0.82rem; }
        .yt-loc-col { color: #2C1A0E; font-size: 0.82rem; display: flex; align-items: center; gap: 6px; }
        .yt-loc-pin { color: #D32F2F; font-size: 0.85rem; }
        .yt-joined-col { color: #6E5E52; font-size: 0.78rem; }

        /* BOOKINGS COUNT PILL */
        .yt-booking-count-badge { width: 24px; height: 24px; border-radius: 50%; background-color: #F4EFEA; color: #6E5E52; font-size: 0.74rem; font-weight: 600; display: inline-flex; align-items: center; justify-content: center; }

        /* STATUS BADGE */
        .yt-status-badge { font-size: 0.72rem; font-weight: 600; padding: 4px 12px; border-radius: 9999px; display: inline-block; }
        .yt-status-badge.active { background-color: #D9F7E5; color: #237844; }
        .yt-status-badge.inactive { background-color: #EFE9E2; color: #7A6B60; }

        /* ACTIONS */
        .yt-actions-cell { display: flex; align-items: center; gap: 10px; }
        .yt-btn-deactivate { color: #C07A38; text-decoration: none; font-weight: 500; font-size: 0.76rem; cursor: pointer; }
        .yt-btn-deactivate:hover { text-decoration: underline; }
        .yt-btn-activate { color: #237844; text-decoration: none; font-weight: 500; font-size: 0.76rem; cursor: pointer; }
        .yt-btn-activate:hover { text-decoration: underline; }
        .yt-btn-delete { color: #E02424; text-decoration: none; font-weight: 500; font-size: 0.76rem; cursor: pointer; }
        .yt-btn-delete:hover { text-decoration: underline; }
>>>>>>> 8c058e2c69959a48730eb36c04586dbc3e20f10d
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
                    <a href="AdminUsers.aspx" class="yt-admin-nav-item active">Users</a>
                    <a href="AdminReviews.aspx" class="yt-admin-nav-item">Reviews</a>

                    <div class="yt-admin-divider"></div>

<<<<<<< HEAD
                    <div class="yt-admin-user-badge">
                        <span class="yt-admin-avatar">AU</span>
                        <span class="yt-admin-user-name">Admin User</span>
                        <span class="yt-admin-caret">&#9662;</span>
=======
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
>>>>>>> 8c058e2c69959a48730eb36c04586dbc3e20f10d
                    </div>
                </div>
            </div>
        </header>

        <!-- MAIN PAGE -->
        <div class="yt-admin-page">
            <div class="yt-admin-container">

                <div class="yt-page-header">
                    <h1 class="yt-page-title">All Users</h1>
                    <p class="yt-page-sub"><asp:Literal ID="litSubCount" runat="server">6 registered users</asp:Literal></p>
                </div>

                <!-- 3 KPI CARDS -->
                <div class="yt-users-kpi-grid">
                    <div class="yt-users-kpi-card">
                        <div class="yt-users-kpi-icon" style="color: #6A3CBC;">👤</div>
                        <div class="yt-users-kpi-val"><asp:Literal ID="litTotalUsers" runat="server">6</asp:Literal></div>
                        <div class="yt-users-kpi-label">Total Users</div>
                    </div>

                    <div class="yt-users-kpi-card">
                        <div class="yt-users-kpi-icon" style="color: #2C1A0E;">✓</div>
                        <div class="yt-users-kpi-val"><asp:Literal ID="litActiveUsers" runat="server">5</asp:Literal></div>
                        <div class="yt-users-kpi-label">Active</div>
                    </div>

                    <div class="yt-users-kpi-card">
                        <div class="yt-users-kpi-icon" style="color: #D9822B;">📋</div>
                        <div class="yt-users-kpi-val"><asp:Literal ID="litTotalBookings" runat="server">11</asp:Literal></div>
                        <div class="yt-users-kpi-label">Total Bookings</div>
                    </div>
                </div>

                <!-- SEARCH & FILTER ROW -->
                <div class="yt-users-search-row">
<<<<<<< HEAD
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="yt-users-search-input" 
=======
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="yt-users-search-input"
>>>>>>> 8c058e2c69959a48730eb36c04586dbc3e20f10d
                        placeholder="Search by name, email, city..." AutoPostBack="true" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>

                    <div class="yt-users-filter-group">
                        <asp:Button ID="btnFilterAll" runat="server" Text="All" CssClass="yt-filter-btn active" OnClick="Filter_Click" CommandArgument="All" />
                        <asp:Button ID="btnFilterActive" runat="server" Text="Active" CssClass="yt-filter-btn" OnClick="Filter_Click" CommandArgument="Active" />
                        <asp:Button ID="btnFilterInactive" runat="server" Text="Inactive" CssClass="yt-filter-btn" OnClick="Filter_Click" CommandArgument="Inactive" />
                    </div>
                </div>

                <!-- USERS TABLE -->
                <div class="yt-admin-card">
                    <table class="yt-users-table">
                        <thead>
                            <tr>
                                <th style="width: 25%;">USER</th>
                                <th style="width: 18%;">PHONE</th>
                                <th style="width: 15%;">LOCATION</th>
                                <th style="width: 12%;">JOINED</th>
                                <th style="width: 10%;">BOOKINGS</th>
                                <th style="width: 10%;">STATUS</th>
                                <th style="width: 10%;">ACTIONS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptUsers" runat="server" OnItemCommand="rptUsers_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <!-- User avatar & info -->
                                        <td>
                                            <div class="yt-user-cell">
                                                <div class="yt-user-avatar-circle"><%# Eval("Initials") %></div>
                                                <div class="yt-user-info">
                                                    <span class="yt-user-fullname"><%# Eval("FullName") %></span>
                                                    <span class="yt-user-email"><%# Eval("Email") %></span>
                                                </div>
                                            </div>
                                        </td>

                                        <!-- Phone -->
                                        <td class="yt-phone-col"><%# Eval("Phone") %></td>

                                        <!-- Location -->
                                        <td>
                                            <div class="yt-loc-col">
                                                <span class="yt-loc-pin">📍</span>
                                                <span><%# Eval("City") %></span>
                                            </div>
                                        </td>

                                        <!-- Joined Date -->
                                        <td class="yt-joined-col"><%# Eval("JoinedDate") %></td>

                                        <!-- Bookings Count -->
                                        <td>
                                            <span class="yt-booking-count-badge"><%# Eval("BookingsCount") %></span>
                                        </td>

                                        <!-- Status Badge -->
                                        <td>
                                            <span class='yt-status-badge <%# Eval("Status").ToString().ToLower() %>'><%# Eval("Status") %></span>
                                        </td>

                                        <!-- Actions -->
                                        <td>
                                            <div class="yt-actions-cell">
<<<<<<< HEAD
                                                <asp:LinkButton ID="btnToggleStatus" runat="server" 
=======
                                                <asp:LinkButton ID="btnToggleStatus" runat="server"
>>>>>>> 8c058e2c69959a48730eb36c04586dbc3e20f10d
                                                    CommandName="ToggleStatus" CommandArgument='<%# Eval("Email") %>'
                                                    CssClass='<%# Eval("Status").ToString() == "Active" ? "yt-btn-deactivate" : "yt-btn-activate" %>'>
                                                    <%# Eval("Status").ToString() == "Active" ? "Deactivate" : "Activate" %>
                                                </asp:LinkButton>

                                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteUser" CommandArgument='<%# Eval("Email") %>'
                                                    CssClass="yt-btn-delete" OnClientClick="return confirm('Are you sure you want to delete this user?');">
                                                    Delete
                                                </asp:LinkButton>
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

<<<<<<< HEAD
=======
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
>>>>>>> 8c058e2c69959a48730eb36c04586dbc3e20f10d
    </form>
</body>
</html>