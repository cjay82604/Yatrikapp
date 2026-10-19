<%@ Page Title="Trip Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TripDetails.aspx.cs" Inherits="YourWebFormsProject.TripDetails" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="~/Content/css/trips.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="yt-trip-details-page">
        <div class="yt-trip-details-container">

            <!-- Back Link -->
            <a href="MyTrips.aspx" class="yt-back-link" style="margin-bottom:14px; display:inline-block;">&larr; Back to My Trips</a>

            <!-- Hero Image Banner with Hotel Info & Status Badge -->
            <div class="yt-td-banner">
                <asp:Image ID="imgBanner" runat="server" CssClass="yt-td-banner-img" />
                <div class="yt-td-banner-overlay">
                    <div>
                        <h1 class="yt-td-hotel-name">
                            <asp:Literal ID="litHotelName" runat="server">Haveli by the Lake</asp:Literal>
                        </h1>
                        <div class="yt-td-hotel-loc">
                            <asp:Literal ID="litLocation" runat="server">Udaipur, Rajasthan</asp:Literal>
                        </div>
                    </div>
                    <div>
                        <span id="badgeStatus" runat="server" class="yt-td-badge confirmed">
                            <asp:Literal ID="litBadgeText" runat="server">Confirmed</asp:Literal>
                        </span>
                    </div>
                </div>
            </div>

            <!-- Details Card -->
            <div class="yt-td-card">

                <!-- 4 Metrics: Booking ID, Nights, Guests, Rooms -->
                <div class="yt-td-metrics-grid">
                    <div class="yt-td-metric-box">
                        <div class="yt-td-metric-lbl">Booking ID</div>
                        <div class="yt-td-metric-val"><asp:Literal ID="litBookingId" runat="server">YT-6530</asp:Literal></div>
                    </div>
                    <div class="yt-td-metric-box">
                        <div class="yt-td-metric-lbl">Nights</div>
                        <div class="yt-td-metric-val"><asp:Literal ID="litNights" runat="server">15</asp:Literal></div>
                    </div>
                    <div class="yt-td-metric-box">
                        <div class="yt-td-metric-lbl">Guests</div>
                        <div class="yt-td-metric-val"><asp:Literal ID="litGuests" runat="server">2</asp:Literal></div>
                    </div>
                    <div class="yt-td-metric-box">
                        <div class="yt-td-metric-lbl">Rooms</div>
                        <div class="yt-td-metric-val"><asp:Literal ID="litRooms" runat="server">1</asp:Literal></div>
                    </div>
                </div>

                <!-- 2 Date Boxes: Check-in, Check-out -->
                <div class="yt-td-dates-grid">
                    <div class="yt-td-date-box">
                        <div class="yt-td-date-lbl">Check-in</div>
                        <div class="yt-td-date-val"><asp:Literal ID="litCheckIn" runat="server">2026-10-08</asp:Literal></div>
                    </div>
                    <div class="yt-td-date-box">
                        <div class="yt-td-date-lbl">Check-out</div>
                        <div class="yt-td-date-val"><asp:Literal ID="litCheckOut" runat="server">2026-10-23</asp:Literal></div>
                    </div>
                </div>

                <!-- Pricing Breakdown -->
                <div class="yt-td-pricing-box">
                    <div class="yt-td-price-row">
                        <span>&#8377;<asp:Literal ID="litBaseRate" runat="server">8,500</asp:Literal> &times; <asp:Literal ID="litCalcFormula" runat="server">15N &times; 1 room</asp:Literal></span>
                        <span>&#8377;<asp:Literal ID="litSubTotal" runat="server">1,27,500</asp:Literal></span>
                    </div>
                    <div class="yt-td-price-row">
                        <span>GST (12%)</span>
                        <span>&#8377;<asp:Literal ID="litTax" runat="server">15,280</asp:Literal></span>
                    </div>

                    <!-- Payment Method Line (Shown for Upcoming) -->
                    <asp:PlaceHolder ID="phPaymentMethodRow" runat="server">
                        <div class="yt-td-price-row">
                            <span>Payment method</span>
                            <span><asp:Literal ID="litPaymentMethod" runat="server">Pay at hotel</asp:Literal></span>
                        </div>
                    </asp:PlaceHolder>

                    <!-- Total / Amount Due -->
                    <div class="yt-td-price-row total">
                        <span><asp:Literal ID="litTotalLabel" runat="server">Amount due at hotel</asp:Literal></span>
                        <span>&#8377;<asp:Literal ID="litTotal" runat="server">1,42,800</asp:Literal></span>
                    </div>
                </div>

            </div>

            <!-- DYNAMIC BOTTOM ACTION BUTTONS (Different for each of the 3 states) -->

            <!-- 1. UPCOMING ACTIONS (Screenshot 1) -->
            <asp:PlaceHolder ID="phUpcomingActions" runat="server">
                <div class="yt-td-actions-row">
                    <asp:LinkButton ID="btnCancelBooking" runat="server" CssClass="yt-btn-cancel-booking" OnClick="btnCancelBooking_Click" OnClientClick="return confirm('Are you sure you want to cancel this booking?');">
                        Cancel booking
                    </asp:LinkButton>
                    <button type="button" class="yt-btn-receipt" onclick="window.print();">
                        &#128196; Receipt
                    </button>
                </div>
            </asp:PlaceHolder>

            <!-- 2. PAST ACTIONS (Screenshot 2) -->
            <asp:PlaceHolder ID="phPastActions" runat="server" Visible="false">
                <div class="yt-td-actions-row">
<a href='Reviews.aspx?hotel=<%= Server.UrlEncode(litHotelName.Text) %>' class="yt-btn-leave-review">
    &#9733; Leave a Review
</a>                        &#9733; Leave a Review
                    </button>
                    <button type="button" class="yt-btn-receipt" onclick="window.print();">
                        &#128196; Receipt
                    </button>
                </div>
            </asp:PlaceHolder>

            <!-- 3. CANCELLED ACTIONS (Screenshot 3) -->
            <asp:PlaceHolder ID="phCancelledActions" runat="server" Visible="false">
                <button type="button" class="yt-btn-receipt center-only" onclick="window.print();">
                    &#128196; Receipt
                </button>
            </asp:PlaceHolder>

        </div>
    </div>
</asp:Content>