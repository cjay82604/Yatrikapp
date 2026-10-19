<%@ Page Title="All Hotels" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Hotels.aspx.cs" Inherits="Yatrikapp.Hotels" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="~/Content/css/hotels.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="yt-hotels-page">
        <div class="yt-hotels-container">

            <div class="yt-hotels-count">
                <asp:Literal ID="litPropertyCount" runat="server">12 properties found</asp:Literal>
            </div>
            <h1 class="yt-hotels-title">All Hotels</h1>

            <div class="yt-hotels-layout">

                <!-- LEFT FILTERS SIDEBAR -->
                <aside class="yt-filter-card">
                    <div class="yt-filter-heading">Filters</div>

                    <!-- Search Input -->
                    <div class="yt-filter-group">
                        <label class="yt-filter-label">Search</label>
                        <asp:TextBox ID="txtDestination" runat="server" CssClass="yt-filter-input" Placeholder="Destination..." AutoPostBack="true" OnTextChanged="FilterChanged" />
                    </div>

                    <!-- Category Pills -->
                    <div class="yt-filter-group">
                        <label class="yt-filter-label">Category</label>
                        <div class="yt-filter-pills-wrap">
                            <asp:LinkButton ID="catAll" runat="server" CssClass="yt-filter-tag active" OnClick="CategoryTag_Click" CommandArgument="All">All</asp:LinkButton>
                            <asp:LinkButton ID="catHeritage" runat="server" CssClass="yt-filter-tag" OnClick="CategoryTag_Click" CommandArgument="Heritage">Heritage</asp:LinkButton>
                            <asp:LinkButton ID="catResort" runat="server" CssClass="yt-filter-tag" OnClick="CategoryTag_Click" CommandArgument="Resort">Resort</asp:LinkButton>
                            <asp:LinkButton ID="catBeach" runat="server" CssClass="yt-filter-tag" OnClick="CategoryTag_Click" CommandArgument="Beach Resort">Beach Resort</asp:LinkButton>
                            <asp:LinkButton ID="catMountain" runat="server" CssClass="yt-filter-tag" OnClick="CategoryTag_Click" CommandArgument="Mountain Lodge">Mountain Lodge</asp:LinkButton>
                            <asp:LinkButton ID="catCity" runat="server" CssClass="yt-filter-tag" OnClick="CategoryTag_Click" CommandArgument="City Hotel">City Hotel</asp:LinkButton>
                        </div>
                    </div>

                    <!-- Max Price Slider -->
                    <div class="yt-filter-group">
                        <label class="yt-filter-label">
                            Max price: <span id="lblPriceValue">&#8377;20,000/night</span>
                        </label>
                        <input type="range" id="rngPrice" min="3000" max="20000" step="500" value="20000" class="yt-price-slider" oninput="document.getElementById('lblPriceValue').innerText = '₹' + Number(this.value).toLocaleString('en-IN') + '/night';" />
                    </div>

                    <!-- Sort By DropDown -->
                    <div class="yt-filter-group" style="margin-bottom:0;">
                        <label class="yt-filter-label">Sort by</label>
                        <asp:DropDownList ID="ddlSort" runat="server" CssClass="yt-sort-select" AutoPostBack="true" OnSelectedIndexChanged="FilterChanged">
                            <asp:ListItem Value="TopRated">Top rated</asp:ListItem>
                            <asp:ListItem Value="PriceLowHigh">Price: Low to High</asp:ListItem>
                            <asp:ListItem Value="PriceHighLow">Price: High to Low</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </aside>

                <!-- RIGHT HOTELS 2-COLUMN GRID -->
                <main class="yt-hotels-2col-grid">
                    <asp:Repeater ID="rptHotels" runat="server" OnItemCommand="rptHotels_ItemCommand">
                        <ItemTemplate>
                            <div class="yt-hotel-card">
                                <div class="yt-hotel-image-wrap">
                                    <a href='HotelDetails.aspx?id=<%# Eval("Id") %>'>
                                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' class="yt-hotel-img" />
                                    </a>
                                    <span class="yt-hotel-category-badge"><%# Eval("Category") %></span>

                                    <!-- Favorite / Saved Heart Icon -->
                                    <asp:LinkButton ID="btnSave" runat="server" 
                                        CommandName="ToggleSave" 
                                        CommandArgument='<%# Eval("Id") %>' 
                                        CssClass='<%# (bool)Eval("IsSaved") ? "yt-hotel-fav-btn saved" : "yt-hotel-fav-btn" %>'>
                                        <%# (bool)Eval("IsSaved") ? "&#9829;" : "&#9825;" %>
                                    </asp:LinkButton>

                                    <!-- Fully Booked Overlay -->
                                    <asp:Panel ID="pnlBooked" runat="server" Visible='<%# Eval("IsFullyBooked") %>' CssClass="yt-hotel-booked-overlay">
                                        Fully Booked
                                    </asp:Panel>
                                </div>
                                <div class="yt-hotel-info">
                                    <!-- Clickable link to Details -->
                                    <a href='HotelDetails.aspx?id=<%# Eval("Id") %>' style="text-decoration:none; color:inherit;">
                                        <div class="yt-hotel-name"><%# Eval("Name") %></div>
                                    </a>
                                    <div class="yt-hotel-loc">
                                        <span style="color:var(--brand-terracotta);">&#128205;</span>
                                        <span><%# Eval("Location") %></span>
                                    </div>
                                    <div class="yt-hotel-bottom">
                                        <div class="yt-hotel-rating">
                                            <span style="color:var(--brand-terracotta);">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
                                            <span style="font-weight:600; color:var(--text-primary);"><%# Eval("Rating") %></span>
                                            <span style="color:var(--text-muted);">(<%# Eval("Reviews") %>)</span>
                                        </div>
                                        <div class="yt-hotel-price">
                                            &#8377;<%# string.Format("{0:N0}", Eval("Price")) %><span>/night</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </main>

            </div>

        </div>
    </div>
</asp:Content>