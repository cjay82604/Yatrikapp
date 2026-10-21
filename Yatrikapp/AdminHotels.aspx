<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHotels.aspx.cs" Inherits="Yatrikapp.AdminHotels" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Hotels - Yatrik Admin</title>
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

        .yt-admin-hotels-page { padding: 36px 0 60px 0; }
        .yt-admin-hotels-container { max-width: 1120px; margin: 0 auto; padding: 0 24px; }
        .yt-admin-hotels-header { display: flex; align-items: center; justify-content: space-between; margin-bottom: 24px; }
        .yt-admin-title { font-family: 'Playfair Display', Georgia, serif; font-size: 1.85rem; font-weight: 700; color: #2C1A0E; margin: 0 0 2px 0; }
        .yt-admin-sub { font-size: 0.84rem; color: #7A6B60; margin: 0; }
        .yt-admin-btn-primary { background-color: #A0522D; color: #FFFFFF; border: none; border-radius: 9999px; padding: 9px 22px; font-size: 0.82rem; font-weight: 600; cursor: pointer; transition: background-color 0.2s; }
        .yt-admin-btn-primary:hover { background-color: #8A4322; }
        .yt-admin-card { background: #FFFFFF; border: 1px solid #EBE4DD; border-radius: 12px; padding: 24px 28px; margin-bottom: 28px; box-shadow: 0 1px 3px rgba(0,0,0,0.03); }
        .yt-admin-card-title { font-size: 1.05rem; font-weight: 600; color: #2C1A0E; margin-bottom: 18px; }
        .yt-admin-form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 16px 20px; }
        .yt-admin-form-full { grid-column: span 2; }
        .yt-admin-field { display: flex; flex-direction: column; gap: 6px; }
        .yt-admin-field label { font-size: 0.76rem; font-weight: 600; color: #7A6B60; }
        .yt-admin-input { width: 100%; height: 40px; background: #FFFFFF; border: 1px solid #E5DDD5; border-radius: 8px; padding: 0 14px; font-size: 0.85rem; color: #2C1A0E; outline: none; transition: border-color 0.2s; }
        .yt-admin-input:focus { border-color: #A0522D; }
        .yt-admin-checkbox { display: flex; align-items: center; gap: 8px; font-size: 0.82rem; color: #2C1A0E; font-weight: 500; margin-top: 6px; }
        .yt-admin-form-actions { display: flex; align-items: center; gap: 12px; margin-top: 20px; }
        .yt-admin-btn-save { background-color: #A0522D; color: #FFFFFF; border: none; border-radius: 9999px; padding: 8px 26px; font-size: 0.82rem; font-weight: 600; cursor: pointer; }
        .yt-admin-btn-cancel { background-color: #FFFFFF; color: #555555; border: 1px solid #D9D1C9; border-radius: 9999px; padding: 8px 22px; font-size: 0.82rem; font-weight: 600; cursor: pointer; }
        .yt-admin-table-card { padding: 0; overflow: hidden; }
        .yt-admin-table { width: 100%; border-collapse: collapse; text-align: left; }
        .yt-admin-table th { background-color: #FFFFFF; font-size: 0.68rem; font-weight: 700; color: #8C7C71; text-transform: uppercase; letter-spacing: 0.5px; padding: 16px 20px; border-bottom: 1px solid #EBE4DD; }
        .yt-admin-table td { padding: 14px 20px; border-bottom: 1px solid #F2ECE5; vertical-align: middle; font-size: 0.82rem; }
        .yt-admin-table tr:last-child td { border-bottom: none; }
        .yt-hotel-cell { display: flex; align-items: center; gap: 12px; }
        .yt-hotel-thumb { width: 38px; height: 38px; border-radius: 50%; object-fit: cover; }
        .yt-hotel-info { display: flex; flex-direction: column; }
        .yt-hotel-name { font-weight: 600; color: #2C1A0E; font-size: 0.84rem; }
        .yt-hotel-loc { font-size: 0.74rem; color: #8C7C71; }
        .yt-cat-badge { display: inline-block; background-color: #F4EFEA; color: #5A4E45; font-size: 0.72rem; font-weight: 500; padding: 4px 12px; border-radius: 9999px; }
        .yt-price-val { font-weight: 600; color: #2C1A0E; }
        .yt-star-rating { color: #E59819; font-size: 0.76rem; letter-spacing: 1px; }
        .yt-rating-val { color: #2C1A0E; font-weight: 600; margin-left: 4px; }
        .yt-status-badge { display: inline-block; font-size: 0.72rem; font-weight: 600; padding: 4px 12px; border-radius: 9999px; }
        .yt-status-badge.available { background-color: #D9F7E5; color: #237844; }
        .yt-status-badge.unavailable { background-color: #FFE6E6; color: #D32F2F; }
        .yt-act-edit { color: #666666; text-decoration: none; font-weight: 500; margin-right: 12px; cursor: pointer; }
        .yt-act-delete { color: #D32F2F; text-decoration: none; font-weight: 500; cursor: pointer; }
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
                    <a href="AdminHotels.aspx" class="yt-admin-nav-item active">Hotels</a>
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
<<<<<<< HEAD
                                <div class="yt-admin-dd-email">ibharmal793@university.edu</div>
=======
                                <div class="yt-admin-dd-email">admin@yatrik.in</div>
>>>>>>> 8c058e2c69959a48730eb36c04586dbc3e20f10d
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

        <div class="yt-admin-hotels-page">
            <div class="yt-admin-hotels-container">

                <div class="yt-admin-hotels-header">
                    <div>
                        <h1 class="yt-admin-title">Manage Hotels</h1>
                        <p class="yt-admin-sub">
                            <asp:Literal ID="litCount" runat="server">12 properties</asp:Literal>
                        </p>
                    </div>
                    <asp:Button ID="btnToggleAdd" runat="server" Text="+ Add Hotel" CssClass="yt-admin-btn-primary" OnClick="btnToggleAdd_Click" />
                </div>

                <!-- ADD/EDIT FORM -->
                <asp:Panel ID="pnlAddHotelForm" runat="server" CssClass="yt-admin-card" Visible="true">
                    <div class="yt-admin-card-title">
                        <asp:Literal ID="litFormTitle" runat="server">Add Hotel</asp:Literal>
                    </div>

                    <asp:HiddenField ID="hfEditId" runat="server" Value="" />

                    <div class="yt-admin-form-grid">
                        <div class="yt-admin-field">
                            <label>Hotel Name</label>
                            <asp:TextBox ID="txtHotelName" runat="server" CssClass="yt-admin-input" placeholder="e.g. Haveli Palace"></asp:TextBox>
                        </div>
                        <div class="yt-admin-field">
                            <label>City</label>
                            <asp:TextBox ID="txtCity" runat="server" CssClass="yt-admin-input" placeholder="e.g. Udaipur"></asp:TextBox>
                        </div>
                        <div class="yt-admin-field">
                            <label>State</label>
                            <asp:TextBox ID="txtState" runat="server" CssClass="yt-admin-input" placeholder="e.g. Rajasthan"></asp:TextBox>
                        </div>
                        <div class="yt-admin-field">
                            <label>Price per night (₹)</label>
                            <asp:TextBox ID="txtPrice" runat="server" CssClass="yt-admin-input" placeholder="e.g. 8500"></asp:TextBox>
                        </div>
                        <div class="yt-admin-field yt-admin-form-full">
                            <label>Category</label>
                            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="yt-admin-input">
                                <asp:ListItem Value="Heritage" Selected="True">Heritage</asp:ListItem>
                                <asp:ListItem Value="Resort">Resort</asp:ListItem>
                                <asp:ListItem Value="Beach Resort">Beach Resort</asp:ListItem>
                                <asp:ListItem Value="Mountain Lodge">Mountain Lodge</asp:ListItem>
                                <asp:ListItem Value="City Hotel">City Hotel</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="yt-admin-form-full">
                            <asp:CheckBox ID="chkAvailable" runat="server" Text="Available for booking" Checked="true" CssClass="yt-admin-checkbox" />
                        </div>
                    </div>

                    <div class="yt-admin-form-actions">
                        <asp:Button ID="btnSaveHotel" runat="server" Text="Save" CssClass="yt-admin-btn-save" OnClick="btnSaveHotel_Click" />
                        <asp:Button ID="btnCancelHotel" runat="server" Text="Cancel" CssClass="yt-admin-btn-cancel" OnClick="btnCancelHotel_Click" />
                    </div>
                </asp:Panel>

                <!-- HOTELS TABLE -->
                <div class="yt-admin-card yt-admin-table-card">
                    <table class="yt-admin-table">
                        <thead>
                            <tr>
                                <th style="width: 32%;">HOTEL</th>
                                <th style="width: 15%;">CATEGORY</th>
                                <th style="width: 14%;">PRICE/NIGHT</th>
                                <th style="width: 14%;">RATING</th>
                                <th style="width: 13%;">STATUS</th>
                                <th style="width: 12%;">ACTIONS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptHotels" runat="server" OnItemCommand="rptHotels_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <div class="yt-hotel-cell">
                                                <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' class="yt-hotel-thumb" />
                                                <div class="yt-hotel-info">
                                                    <span class="yt-hotel-name"><%# Eval("Name") %></span>
                                                    <span class="yt-hotel-loc"><%# Eval("Location") %></span>
                                                </div>
                                            </div>
                                        </td>
                                        <td><span class="yt-cat-badge"><%# Eval("Category") %></span></td>
                                        <td><span class="yt-price-val">₹<%# Eval("Price", "{0:N0}") %></span></td>
                                        <td>
                                            <span class="yt-star-rating">★★★★★</span>
                                            <span class="yt-rating-val"><%# Eval("Rating", "{0:0.0}") %></span>
                                        </td>
                                        <td>
                                            <%# (bool)Eval("IsFullyBooked") 
                                                ? "<span class='yt-status-badge unavailable'>Unavailable</span>" 
                                                : "<span class='yt-status-badge available'>Available</span>" %>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditHotel" CommandArgument='<%# Eval("Id") %>' CssClass="yt-act-edit">Edit</asp:LinkButton>
                                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteHotel" CommandArgument='<%# Eval("Id") %>' CssClass="yt-act-delete" OnClientClick="return confirm('Are you sure you want to delete this hotel?');">Delete</asp:LinkButton>
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