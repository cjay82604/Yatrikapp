<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="YourWebFormsProject.Default" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="~/Content/css/home.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- 1. HERO SECTION -->
    <section class="yt-hero">
        <div class="yt-hero-overlay"></div>
        <div class="yt-hero-content">
            <span class="yt-hero-tag">DISCOVER INDIA</span>
            <h1 class="yt-hero-title">
                Your perfect <em>Indian</em><br />stay
            </h1>
            <p class="yt-hero-subtitle">
                Heritage havelis, hill stations, beach resorts and more &mdash; all across India.
            </p>

            <!-- Search Form -->
            <div class="yt-search-container">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="yt-search-input" Placeholder="Search city, state or hotel..." />
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="yt-search-btn" OnClick="btnSearch_Click" />
            </div>
        </div>
    </section>

    <!-- 2. FILTER PILLS BAR -->
    <section class="yt-filter-bar">
        <div class="yt-filter-container">
            <asp:LinkButton ID="btnFilterAll" runat="server" CssClass="yt-filter-pill active" OnClick="FilterCategory_Click" CommandArgument="All">All</asp:LinkButton>
            <asp:LinkButton ID="btnFilterHeritage" runat="server" CssClass="yt-filter-pill" OnClick="FilterCategory_Click" CommandArgument="Heritage">Heritage</asp:LinkButton>
            <asp:LinkButton ID="btnFilterResort" runat="server" CssClass="yt-filter-pill" OnClick="FilterCategory_Click" CommandArgument="Resort">Resort</asp:LinkButton>
            <asp:LinkButton ID="btnFilterBeach" runat="server" CssClass="yt-filter-pill" OnClick="FilterCategory_Click" CommandArgument="Beach Resort">Beach Resort</asp:LinkButton>
            <asp:LinkButton ID="btnFilterMountain" runat="server" CssClass="yt-filter-pill" OnClick="FilterCategory_Click" CommandArgument="Mountain Lodge">Mountain Lodge</asp:LinkButton>
            <asp:LinkButton ID="btnFilterCity" runat="server" CssClass="yt-filter-pill" OnClick="FilterCategory_Click" CommandArgument="City Hotel">City Hotel</asp:LinkButton>
        </div>
    </section>

    <!-- 3. FEATURED STAYS & POPULAR DESTINATIONS -->
    <section class="yt-main-content">
        <div class="yt-section-container">
            
            <!-- Featured Stays Header -->
            <div class="yt-section-eyebrow">CURATED PICKS</div>
            <div class="yt-section-header">
                <h2 class="yt-section-title">Featured stays</h2>
                <a href="Hotels.aspx" class="yt-view-all">View all &rarr;</a>
            </div>

            <!-- Stays Grid (3 Cards with Clickable Links) -->
            <div class="yt-stays-grid">
                
                <!-- Card 1: Haveli by the Lake -->
                <div class="yt-stay-card">
                    <a href="HotelDetails.aspx?id=1" style="text-decoration:none; color:inherit;">
                        <div class="yt-stay-image-box">
                            <img src="https://images.unsplash.com/photo-1599661046289-e31897846e41?auto=format&fit=crop&w=600&q=80" alt="Haveli by the Lake" class="yt-stay-image" />
                            <span class="yt-stay-badge">Heritage</span>
                        </div>
                        <div class="yt-stay-body">
                            <div class="yt-stay-name">Haveli by the Lake</div>
                            <div class="yt-stay-location">
                                <span class="yt-stay-location-icon">&#128205;</span>
                                <span>Udaipur, Rajasthan</span>
                            </div>
                            <div class="yt-stay-footer">
                                <div class="yt-stay-rating">
                                    <span class="yt-stay-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
                                    <span class="yt-stay-score">4.9</span>
                                    <span class="yt-stay-reviews">(204)</span>
                                </div>
                                <div class="yt-stay-price">&#8377;8,500<span>/night</span></div>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Card 2: Spice Garden Resort -->
                <div class="yt-stay-card">
                    <a href="HotelDetails.aspx?id=7" style="text-decoration:none; color:inherit;">
                        <div class="yt-stay-image-box">
                            <img src="https://images.unsplash.com/photo-1514933651103-005eec06c04b?auto=format&fit=crop&w=600&q=80" alt="Spice Garden Resort" class="yt-stay-image" />
                            <span class="yt-stay-badge">Resort</span>
                        </div>
                        <div class="yt-stay-body">
                            <div class="yt-stay-name">Spice Garden Resort</div>
                            <div class="yt-stay-location">
                                <span class="yt-stay-location-icon">&#128205;</span>
                                <span>Munnar, Kerala</span>
                            </div>
                            <div class="yt-stay-footer">
                                <div class="yt-stay-rating">
                                    <span class="yt-stay-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
                                    <span class="yt-stay-score">4.7</span>
                                    <span class="yt-stay-reviews">(196)</span>
                                </div>
                                <div class="yt-stay-price">&#8377;5,200<span>/night</span></div>
                            </div>
                        </div>
                    </a>
                </div>

                <!-- Card 3: Royal Sands Goa -->
                <div class="yt-stay-card">
                    <a href="HotelDetails.aspx?id=10" style="text-decoration:none; color:inherit;">
                        <div class="yt-stay-image-box">
                            <img src="https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=600&q=80" alt="Royal Sands Goa" class="yt-stay-image" />
                            <span class="yt-stay-badge">Beach Resort</span>
                        </div>
                        <div class="yt-stay-body">
                            <div class="yt-stay-name">Royal Sands Goa</div>
                            <div class="yt-stay-location">
                                <span class="yt-stay-location-icon">&#128205;</span>
                                <span>Calangute, Goa</span>
                            </div>
                            <div class="yt-stay-footer">
                                <div class="yt-stay-rating">
                                    <span class="yt-stay-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
                                    <span class="yt-stay-score">4.6</span>
                                    <span class="yt-stay-reviews">(312)</span>
                                </div>
                                <div class="yt-stay-price">&#8377;6,800<span>/night</span></div>
                            </div>
                        </div>
                    </a>
                </div>

            </div>

            <!-- Popular Destinations Header -->
            <div class="yt-section-header" style="margin-bottom: 14px;">
                <h2 class="yt-section-title">Popular destinations</h2>
            </div>

            <!-- Destinations Grid (4 Cards) -->
            <div class="yt-destinations-grid">
                
                <!-- Destination 1: Rajasthan -->
                <div class="yt-dest-card">
                    <img src="https://images.unsplash.com/photo-1599661046289-e31897846e41?auto=format&fit=crop&w=400&q=80" alt="Rajasthan" class="yt-dest-img" />
                    <div class="yt-dest-overlay">
                        <span class="yt-dest-name">Rajasthan</span>
                    </div>
                </div>

                <!-- Destination 2: Kerala -->
                <div class="yt-dest-card">
                    <img src="https://images.unsplash.com/photo-1514933651103-005eec06c04b?auto=format&fit=crop&w=400&q=80" alt="Kerala" class="yt-dest-img" />
                    <div class="yt-dest-overlay">
                        <span class="yt-dest-name">Kerala</span>
                    </div>
                </div>

                <!-- Destination 3: Goa -->
                <div class="yt-dest-card">
                    <img src="https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?auto=format&fit=crop&w=400&q=80" alt="Goa" class="yt-dest-img" />
                    <div class="yt-dest-overlay">
                        <span class="yt-dest-name">Goa</span>
                    </div>
                </div>

                <!-- Destination 4: Himachal -->
                <div class="yt-dest-card">
                    <img src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80" alt="Himachal" class="yt-dest-img" />
                    <div class="yt-dest-overlay">
                        <span class="yt-dest-name">Himachal</span>
                    </div>
                </div>

            </div>

        </div>
    </section>

    <!-- 4. WHY YATRIK? SECTION -->
    <section class="yt-why-section">
        <div class="yt-why-container">
            <h2 class="yt-why-title">Why Yatrik?</h2>
            <div class="yt-why-grid">
                
                <!-- Box 1 -->
                <div class="yt-why-card">
                    <span class="yt-why-icon">&#10022;</span>
                    <div class="yt-why-heading">Only Indian Properties</div>
                    <p class="yt-why-desc">
                        Every hotel is hand-verified across India &mdash; from Himalayas to backwaters.
                    </p>
                </div>

                <!-- Box 2 -->
                <div class="yt-why-card">
                    <span class="yt-why-icon">&#10022;</span>
                    <div class="yt-why-heading">Best Price Promise</div>
                    <p class="yt-why-desc">
                        Find it cheaper within 24 hours and we match the price, no questions asked.
                    </p>
                </div>

                <!-- Box 3 -->
                <div class="yt-why-card">
                    <span class="yt-why-icon">&#10022;</span>
                    <div class="yt-why-heading">Hindi &amp; English Support</div>
                    <p class="yt-why-desc">
                        Our support team is available 24&times;7 in Hindi and English.
                    </p>
                </div>

            </div>
        </div>
    </section>

</asp:Content>