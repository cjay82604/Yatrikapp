<%@ Page Title="My Trips" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyTrips.aspx.cs" Inherits="YourWebFormsProject.MyTrips" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="~/Content/css/trips.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="yt-trips-page">
        <div class="yt-trips-container">

            <div class="yt-section-eyebrow">YOUR JOURNEYS</div>
            <h1 class="yt-section-title" style="margin-bottom: 14px;">My Trips</h1>

            <!-- DYNAMIC TABS (No nested literals so they never collapse) -->
            <div class="yt-trips-tabs">
                <asp:LinkButton ID="tabUpcoming" runat="server" CssClass="yt-tab-pill active" OnClick="Tab_Click" CommandArgument="Upcoming" />
                <asp:LinkButton ID="tabPast" runat="server" CssClass="yt-tab-pill" OnClick="Tab_Click" CommandArgument="Past" />
                <asp:LinkButton ID="tabCancelled" runat="server" CssClass="yt-tab-pill" OnClick="Tab_Click" CommandArgument="Cancelled" />
            </div>

            <!-- TRIP CARDS LIST -->
            <asp:Repeater ID="rptTrips" runat="server">
                <ItemTemplate>
                    <div class="yt-trip-card">
                        <div class="yt-trip-img-wrap">
                            <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("HotelName") %>' class="yt-trip-img" />
                        </div>
                        <div>
                            <div class="yt-trip-header-line">
                                <span class="yt-trip-code"><%# Eval("BookingId") %></span>
                                <span class='<%# GetBadgeClass(Eval("Status").ToString()) %>'>
                                    <%# Eval("Status").ToString() == "Upcoming" ? "Confirmed" : Eval("Status") %>
                                </span>
                            </div>
                            <div class="yt-trip-name"><%# Eval("HotelName") %></div>
                            <div class="yt-trip-detail-line">
                                <span>&#128197;</span>
                                <span><%# Eval("DateRangeText") %></span>
                            </div>
                            <div class="yt-trip-detail-line">
                                <span>&#128100;</span>
                                <span><%# Eval("Guests") %> guests</span>
                            </div>
                        </div>
                        <div class="yt-trip-price-col">
                            <div class="yt-trip-price">&#8377;<%# Eval("TotalPrice") %></div>
<a href='TripDetails.aspx?id=<%# Eval("BookingId") %>' class="yt-btn-pill-details">View details</a>                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <!-- EMPTY STATE IF CATEGORY HAS NO TRIPS -->
            <asp:Panel ID="pnlNoTrips" runat="server" Visible="false" CssClass="yt-no-trips">
                No trips found in this category.d
            </asp:Panel>

        </div>
    </div>
</asp:Content>