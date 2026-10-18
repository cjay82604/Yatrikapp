<%@ Page Title="Hotel Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HotelDetails.aspx.cs" Inherits="YourWebFormsProject.HotelDetails" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="~/Content/css/hotel-details.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="yt-details-page">
        <div class="yt-details-container">

            <!-- Back Link -->
            <a href="Hotels.aspx" class="yt-back-link">&larr; Back</a>

            <div class="yt-details-layout">

                <!-- LEFT COLUMN: GALLERY & DETAILS -->
                <div class="yt-details-left">
                    
                    <!-- Photos Gallery -->
                    <div class="yt-gallery-main">
                        <asp:Image ID="imgMain" runat="server" CssClass="yt-main-photo" />
                    </div>
                    <div class="yt-gallery-thumbs">
                        <div class="yt-gallery-thumb-item">
                            <asp:Image ID="imgThumb1" runat="server" />
                        </div>
                        <div class="yt-gallery-thumb-item">
                            <asp:Image ID="imgThumb2" runat="server" />
                        </div>
                        <div class="yt-gallery-thumb-item">
                            <asp:Image ID="imgThumb3" runat="server" />
                        </div>
                    </div>

                    <!-- Hotel Title & Pricing Header -->
                    <div class="yt-details-badge">
                        <asp:Literal ID="litCategory" runat="server">Heritage</asp:Literal>
                    </div>

                    <div class="yt-details-title-row">
                        <div>
                            <h1 class="yt-details-title">
                                <asp:Literal ID="litHotelName" runat="server">Rann Desert Camp</asp:Literal>
                            </h1>
                            <div class="yt-details-loc">
                                <span style="color:var(--brand-terracotta);">&#128205;</span>
                                <asp:Literal ID="litLocation" runat="server">Bhuj, Gujarat</asp:Literal>
                            </div>
                            <div class="yt-details-rating">
                                <span style="color:var(--brand-terracotta);">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
                                <span style="font-weight:600; color:var(--text-primary);"><asp:Literal ID="litRating" runat="server">4.9</asp:Literal></span>
                                <span style="color:var(--text-muted);">(<asp:Literal ID="litReviews" runat="server">112</asp:Literal> reviews)</span>
                            </div>
                        </div>

                        <div class="yt-details-price-wrap">
                            <button type="button" class="yt-fav-circle-btn">&#9825;</button>
                            <div class="yt-details-price">
                                &#8377;<asp:Literal ID="litPrice" runat="server">12,000</asp:Literal>
                                <small>per night</small>
                            </div>
                        </div>
                    </div>

                    <hr class="yt-details-divider" />

                    <!-- About This Property -->
                    <div class="yt-details-subheading">About this property</div>
                    <p class="yt-details-desc">
                        <asp:Literal ID="litDescription" runat="server">
                            Luxury tents on the Great Rann of Kutch, the world's largest salt desert. Spend nights under a blanket of stars, attend the vibrant Rann Utsav festival, and explore the ancient crafts of Kutch with guided village tours.
                        </asp:Literal>
                    </p>

                    <!-- Amenities -->
                    <div class="yt-details-subheading">Amenities</div>
                    <div class="yt-amenities-wrap">
                        <span class="yt-amenity-pill">&#10003; Desert View</span>
                        <span class="yt-amenity-pill">&#10003; Cultural Shows</span>
                        <span class="yt-amenity-pill">&#10003; Camel Safari</span>
                        <span class="yt-amenity-pill">&#10003; Bonfire</span>
                        <span class="yt-amenity-pill">&#10003; Free WiFi</span>
                        <span class="yt-amenity-pill">&#10003; Craft Workshops</span>
                    </div>

                </div>

                <!-- RIGHT COLUMN: BOOKING CARD -->
                <aside class="yt-booking-card">
                    <div class="yt-booking-title">Book your stay</div>
                    <div class="yt-booking-sub">Free cancellation up to 48 hrs before arrival</div>

                    <!-- Check-in -->
                    <div class="yt-booking-field">
                        <label class="yt-booking-label">Check-in</label>
                        <asp:TextBox ID="txtCheckIn" runat="server" TextMode="Date" CssClass="yt-booking-input" />
                    </div>

                    <!-- Check-out -->
                    <div class="yt-booking-field">
                        <label class="yt-booking-label">Check-out</label>
                        <asp:TextBox ID="txtCheckOut" runat="server" TextMode="Date" CssClass="yt-booking-input" />
                    </div>

                    <!-- Guests & Rooms -->
                    <div class="yt-booking-row">
                        <div>
                            <label class="yt-booking-label">Guests</label>
                            <asp:DropDownList ID="ddlGuests" runat="server" CssClass="yt-booking-input">
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2" Selected="True">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div>
                            <label class="yt-booking-label">Rooms</label>
                            <asp:DropDownList ID="ddlRooms" runat="server" CssClass="yt-booking-input">
                                <asp:ListItem Value="1" Selected="True">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <!-- Price Breakdown -->
                    <div class="yt-price-breakdown">
                        <div class="yt-price-line">
                            <span>&#8377;<asp:Literal ID="litCalcBaseRate" runat="server">12,000</asp:Literal> &times; 1 night</span>
                            <span>&#8377;<asp:Literal ID="litCalcSubTotal" runat="server">12,000</asp:Literal></span>
                        </div>
                        <div class="yt-price-line">
                            <span>Taxes (12%)</span>
                            <span>&#8377;<asp:Literal ID="litCalcTax" runat="server">1,440</asp:Literal></span>
                        </div>
                        <div class="yt-price-line total">
                            <span>Total</span>
                            <span>&#8377;<asp:Literal ID="litCalcTotal" runat="server">13,440</asp:Literal></span>
                        </div>
                    </div>

                    <!-- CONDITIONAL ACTION BUTTON -->
                    <!-- 1. If User is LOGGED IN: Shows "Reserve now" -->
                    <asp:PlaceHolder ID="phLoggedInAction" runat="server" Visible="false">
                        <asp:Button ID="btnReserveNow" runat="server" Text="Reserve now" CssClass="yt-btn-pill-block" OnClick="btnReserveNow_Click" />
                        <ul class="yt-booking-features">
                            <li>No booking fees</li>
                            <li>Secure payment</li>
                            <li>Instant confirmation</li>
                        </ul>
                    </asp:PlaceHolder>

                    <!-- 2. If User is NOT LOGGED IN: Shows "Sign in to book" -->
                    <asp:PlaceHolder ID="phAnonymousAction" runat="server" Visible="true">
                        <asp:Button ID="btnSignInToBook" runat="server" Text="Sign in to book" CssClass="yt-btn-pill-block" OnClick="btnSignInToBook_Click" />
                        <ul class="yt-booking-features">
                            <li>No booking fees</li>
                            <li>Pay at the hotel</li>
                            <li>Instant confirmation</li>
                        </ul>
                    </asp:PlaceHolder>

                </aside>

            </div>

        </div>
    </div>
</asp:Content>