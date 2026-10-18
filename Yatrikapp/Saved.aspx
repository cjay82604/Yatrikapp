<%@ Page Title="Saved Stays" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Saved.aspx.cs" Inherits="Yatrikapp.Saved" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="~/Content/css/saved.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="yt-wishlist-page">
        <div class="yt-wishlist-container">

            <div class="yt-section-eyebrow">SAVED STAYS</div>
            <div class="yt-wishlist-header">
                <h1 class="yt-section-title" style="margin-bottom:0;">My Wishlist</h1>
                <div class="yt-wishlist-count">
                    <asp:Literal ID="litSavedCount" runat="server">2 saved</asp:Literal>
                </div>
            </div>

            <!-- 2-COLUMN SAVED CARDS GRID -->
            <asp:Repeater ID="rptSavedHotels" runat="server" OnItemCommand="rptSavedHotels_ItemCommand">
                <HeaderTemplate>
                    <div class="yt-wishlist-grid">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="yt-hotel-card">
                        <div class="yt-hotel-image-wrap">
                            <a href='HotelDetails.aspx?id=<%# Eval("Id") %>'>
                                <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' class="yt-hotel-img" />
                            </a>
                            <span class="yt-hotel-category-badge"><%# Eval("Category") %></span>

                            <!-- Active Terracotta Heart Button -->
                            <asp:LinkButton ID="btnUnsave" runat="server" 
                                CommandName="Unsave" 
                                CommandArgument='<%# Eval("Id") %>' 
                                CssClass="yt-hotel-fav-btn saved" 
                                ToolTip="Remove from wishlist">
                                &#9829;
                            </asp:LinkButton>
                        </div>
                        <div class="yt-hotel-info">
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
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>

            <!-- EMPTY STATE -->
            <asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="yt-no-saved">
                <p style="margin-bottom:12px;">You haven't saved any stays yet.</p>
                <a href="Hotels.aspx" class="yt-filter-tag active" style="padding:6px 20px; font-size:0.8rem;">Browse Hotels</a>
            </asp:Panel>

        </div>
    </div>
</asp:Content>