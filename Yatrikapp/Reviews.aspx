<%@ Page Title="Reviews" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="Yatrikapp.Reviews" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="~/Content/css/reviews.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="yt-reviews-page">
        <div class="yt-reviews-container">

            <!-- Page Top Header -->
            <div class="yt-reviews-header">
                <div>
                    <div class="yt-section-eyebrow">GUEST VOICES</div>
                    <h1 class="yt-section-title" style="margin-bottom:0;">Reviews</h1>
                </div>
                <div>
                    <!-- Shown if user is LOGGED IN -->
                    <asp:PlaceHolder ID="phLoggedInReviewBtn" runat="server" Visible="false">
                        <asp:Button ID="btnToggleForm" runat="server" CssClass="yt-btn-toggle-form" Text="Add review" OnClick="btnToggleForm_Click" />
                    </asp:PlaceHolder>

                    <!-- Shown if user is NOT LOGGED IN -->
                    <asp:PlaceHolder ID="phAnonymousReviewBtn" runat="server" Visible="true">
                        <a href="Login.aspx?returnUrl=Reviews.aspx" class="yt-btn-toggle-form">Sign in to review</a>
                    </asp:PlaceHolder>
                </div>
            </div>

            <!-- GREEN APPROVAL NOTICE BANNER (Screenshot) -->
            <asp:Panel ID="pnlApprovalNotice" runat="server" Visible="false" CssClass="yt-approval-banner">
                Thank you. Your review was submitted and is awaiting admin approval.
            </asp:Panel>

            <!-- CARD 1: SHARE YOUR STAY FORM (Hidden by default or toggled) -->
            <asp:Panel ID="pnlReviewForm" runat="server" CssClass="yt-review-form-card" Visible="false">
                <div class="yt-review-form-title">Share your stay</div>
                <div class="yt-review-form-sub">Tell other Yatrik travellers about your experience.</div>

                <!-- Hotel Selector -->
                <div class="yt-form-group">
                    <label class="yt-form-label">Hotel</label>
                    <asp:DropDownList ID="ddlHotels" runat="server" CssClass="yt-input-field" style="height:38px; border-radius:10px;">
                        <asp:ListItem Value="Haveli by the Lake · Udaipur">Haveli by the Lake · Udaipur</asp:ListItem>
                        <asp:ListItem Value="Royal Sands Goa · Calangute">Royal Sands Goa · Calangute</asp:ListItem>
                        <asp:ListItem Value="Spice Garden Resort · Munnar">Spice Garden Resort · Munnar</asp:ListItem>
                        <asp:ListItem Value="Rann Desert Camp · Bhuj">Rann Desert Camp · Bhuj</asp:ListItem>
                        <asp:ListItem Value="Marina Heritage Mumbai · Colaba">Marina Heritage Mumbai · Colaba</asp:ListItem>
                        <asp:ListItem Value="Himalayan Nest · Manali">Himalayan Nest · Manali</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <!-- Star Rating Selector -->
                <div class="yt-form-group">
                    <label class="yt-form-label">Your rating</label>
                    <div class="yt-rating-stars-input">
                        <asp:LinkButton ID="star1" runat="server" OnClick="SetRating_Click" CommandArgument="1" style="color:var(--brand-terracotta); text-decoration:none;">&#9733;</asp:LinkButton>
                        <asp:LinkButton ID="star2" runat="server" OnClick="SetRating_Click" CommandArgument="2" style="color:var(--brand-terracotta); text-decoration:none;">&#9733;</asp:LinkButton>
                        <asp:LinkButton ID="star3" runat="server" OnClick="SetRating_Click" CommandArgument="3" style="color:var(--brand-terracotta); text-decoration:none;">&#9733;</asp:LinkButton>
                        <asp:LinkButton ID="star4" runat="server" OnClick="SetRating_Click" CommandArgument="4" style="color:var(--brand-terracotta); text-decoration:none;">&#9733;</asp:LinkButton>
                        <asp:LinkButton ID="star5" runat="server" OnClick="SetRating_Click" CommandArgument="5" style="color:var(--brand-terracotta); text-decoration:none;">&#9733;</asp:LinkButton>
                    </div>
                    <asp:HiddenField ID="hfRating" runat="server" Value="5" />
                </div>

                <!-- Review Textarea -->
                <div class="yt-form-group">
                    <label class="yt-form-label">Your review</label>
                    <asp:TextBox ID="txtReview" runat="server" TextMode="MultiLine" CssClass="yt-textarea-field" Placeholder="What did you enjoy about your stay?" />
                </div>

                <!-- Submit Button -->
                <asp:Button ID="btnSubmitReview" runat="server" Text="Submit review" CssClass="yt-btn-submit-review active" OnClick="btnSubmitReview_Click" />
            </asp:Panel>

            <!-- CARD 2: RATING SCORE SUMMARY CARD -->
            <div class="yt-review-summary-card">
                <div class="yt-summary-score-side">
                    <div class="yt-summary-big-score"><%= AvgRatingText %></div>
                    <div class="yt-summary-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <div class="yt-summary-count"><%= TotalReviewsCount %> reviews</div>
                </div>
                <div class="yt-rating-bars-side">
                    <!-- 5 Stars Bar -->
                    <div class="yt-bar-row">
                        <span>5 &#9733;</span>
                        <div class="yt-bar-track">
                            <div class="yt-bar-fill" style='width: <%= Pct5 %>%;'></div>
                        </div>
                        <span class="yt-bar-num"><%= Count5 %></span>
                    </div>
                    <!-- 4 Stars Bar -->
                    <div class="yt-bar-row">
                        <span>4 &#9733;</span>
                        <div class="yt-bar-track">
                            <div class="yt-bar-fill" style='width: <%= Pct4 %>%;'></div>
                        </div>
                        <span class="yt-bar-num"><%= Count4 %></span>
                    </div>
                    <!-- 3 Stars Bar -->
                    <div class="yt-bar-row">
                        <span>3 &#9733;</span>
                        <div class="yt-bar-track">
                            <div class="yt-bar-fill" style='width: <%= Pct3 %>%;'></div>
                        </div>
                        <span class="yt-bar-num"><%= Count3 %></span>
                    </div>
                </div>
            </div>

            <!-- CARD 3: INDIVIDUAL REVIEW CARDS (Approved Only) -->
            <asp:Repeater ID="rptReviews" runat="server" OnItemCommand="rptReviews_ItemCommand">
                <ItemTemplate>
                    <div class="yt-user-review-card">
                        <div class="yt-ur-header">
                            <div class="yt-ur-avatar"><%# Eval("AvatarInitial") %></div>
                            <div>
                                <div class="yt-ur-name">
                                    <span><%# Eval("AuthorName") %></span>
                                    <span class="yt-ur-stars"><%# GetStars((int)Eval("Rating")) %></span>
                                </div>
                                <div class="yt-ur-date"><%# Eval("Date") %></div>
                            </div>
                        </div>

                        <!-- Hotel Tag Line -->
                        <div class="yt-ur-hotel-tag">
                            <span>&#127976;</span>
                            <span><%# Eval("HotelName") %> &middot; <%# Eval("Location") %></span>
                        </div>

                        <!-- Review Text -->
                        <p class="yt-ur-text"><%# Eval("ReviewText") %></p>

                        <!-- Helpful Button -->
                        <asp:LinkButton ID="btnHelpful" runat="server" CssClass="yt-btn-helpful" CommandName="Helpful" CommandArgument='<%# Eval("Id") %>'>
                            &#128077; Helpful <%# (int)Eval("HelpfulCount") > 0 ? "(" + Eval("HelpfulCount") + ")" : "" %>
                        </asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
</asp:Content>