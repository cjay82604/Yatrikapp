<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Yatrikapp.Profile" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="~/Content/css/profile.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="yt-profile-page">
        <div class="yt-profile-container">

            <!-- 1. USER HEADER (Avatar & Name/Email) -->
            <div class="yt-profile-header">
                <div class="yt-profile-avatar">
                    <asp:Literal ID="litAvatarInitials" runat="server">AS</asp:Literal>
                </div>
                <div class="yt-profile-header-info">
                    <h1 class="yt-profile-header-name">
                        <asp:Literal ID="litHeaderName" runat="server">Arjun Sharma</asp:Literal>
                    </h1>
                    <div class="yt-profile-header-email">
                        <asp:Literal ID="litHeaderEmail" runat="server">j@gmail.com</asp:Literal>
                    </div>
                </div>
            </div>

            <!-- 2. THREE STATS CARDS -->
            <div class="yt-profile-stats-grid">
                <!-- Trips taken -->
                <div class="yt-profile-stat-card">
                    <div class="yt-profile-stat-val">
                        <asp:Literal ID="litTripsCount" runat="server">4</asp:Literal>
                    </div>
                    <div class="yt-profile-stat-lbl">Trips taken</div>
                </div>

                <!-- Saved hotels -->
                <a href="Saved.aspx" class="yt-profile-stat-card">
                    <div class="yt-profile-stat-icon">&#9825;</div>
                    <div class="yt-profile-stat-lbl">Saved hotels</div>
                </a>

                <!-- Total spent -->
                <div class="yt-profile-stat-card">
                    <div class="yt-profile-stat-val">
                        <asp:Literal ID="litTotalSpent" runat="server">&#8377;1,22,040</asp:Literal>
                    </div>
                    <div class="yt-profile-stat-lbl">Total spent</div>
                </div>
            </div>

            <!-- 3. PROFILE DETAILS CARD -->
            <div class="yt-profile-card">
                <!-- Card Header with Title and Actions -->
                <div class="yt-profile-card-header">
                    <h2 class="yt-profile-card-title">Profile details</h2>

                    <div class="yt-profile-actions">
                        <!-- View mode button (Screenshot 1) -->
                        <asp:PlaceHolder ID="phViewActions" runat="server">
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="yt-profile-btn-edit" OnClick="btnEdit_Click" />
                        </asp:PlaceHolder>

                        <!-- Edit mode buttons (Screenshot 2) -->
                        <asp:PlaceHolder ID="phEditActions" runat="server" Visible="false">
                            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="yt-profile-btn-save" OnClick="btnSave_Click" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="yt-profile-btn-cancel" OnClick="btnCancel_Click" />
                        </asp:PlaceHolder>
                    </div>
                </div>

                <!-- Feedback message if any -->
                <asp:Label ID="lblMsg" runat="server" Visible="false" CssClass="yt-profile-msg"></asp:Label>

                <!-- VIEW MODE PANEL (Screenshot 1) -->
                <asp:Panel ID="pnlViewDetails" runat="server">
                    <div class="yt-profile-view-row">
                        <div class="yt-profile-lbl">Name</div>
                        <div class="yt-profile-val">
                            <asp:Literal ID="litDetailsName" runat="server">Arjun Sharma</asp:Literal>
                        </div>
                    </div>

                    <div class="yt-profile-view-row">
                        <div class="yt-profile-lbl">Email</div>
                        <div class="yt-profile-val">
                            <asp:Literal ID="litDetailsEmail" runat="server">j@gmail.com</asp:Literal>
                        </div>
                    </div>

                    <div class="yt-profile-view-row">
                        <div class="yt-profile-lbl">Phone</div>
                        <div class="yt-profile-val">
                            <asp:Literal ID="litDetailsPhone" runat="server">&mdash;</asp:Literal>
                        </div>
                    </div>

                    <div class="yt-profile-view-row">
                        <div class="yt-profile-lbl">Location</div>
                        <div class="yt-profile-val">
                            <asp:Literal ID="litDetailsLocation" runat="server">India</asp:Literal>
                        </div>
                    </div>
                </asp:Panel>

                <!-- EDIT MODE PANEL (Screenshot 2) -->
                <asp:Panel ID="pnlEditDetails" runat="server" Visible="false">
                    <div class="yt-profile-edit-row">
                        <div class="yt-profile-lbl">Name</div>
                        <asp:TextBox ID="txtEditName" runat="server" CssClass="yt-profile-edit-input" />
                    </div>

                    <div class="yt-profile-edit-row">
                        <div class="yt-profile-lbl">Email</div>
                        <asp:TextBox ID="txtEditEmail" runat="server" CssClass="yt-profile-edit-input" TextMode="Email" />
                    </div>

                    <div class="yt-profile-edit-row">
                        <div class="yt-profile-lbl">Phone</div>
                        <asp:TextBox ID="txtEditPhone" runat="server" CssClass="yt-profile-edit-input" placeholder="+91 98765 43210" />
                    </div>

                    <div class="yt-profile-edit-row">
                        <div class="yt-profile-lbl">Location</div>
                        <asp:TextBox ID="txtEditLocation" runat="server" CssClass="yt-profile-edit-input" />
                    </div>
                </asp:Panel>

            </div>

        </div>
    </div>
</asp:Content>