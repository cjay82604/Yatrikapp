<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Yatrikapp.Contact" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="~/Content/css/contact.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="yt-contact-page">
        <div class="yt-contact-container">
            
            <!-- Page Header -->
            <div class="yt-contact-header">
                <div class="yt-contact-eyebrow">GET IN TOUCH</div>
                <h1 class="yt-contact-title">Contact Us</h1>
                <p class="yt-contact-sub">We'd love to hear from you. Our team typically responds within 24 hours.</p>
            </div>

            <!-- Two-Column Grid -->
            <div class="yt-contact-grid">
                
                <!-- Left Column: Contact Information Cards -->
                <div class="yt-contact-info-col">
                    
                    <!-- 1. Call Us Card -->
                    <div class="yt-contact-card">
                        <div class="yt-contact-card-icon">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
                            </svg>
                        </div>
                        <div class="yt-contact-card-title">Call us</div>
                        <div class="yt-contact-card-val">+91 1800 202 0101</div>
                        <div class="yt-contact-card-sub">Mon–Sat, 9 am – 7 pm IST</div>
                    </div>

                    <!-- 2. Email Us Card -->
                    <div class="yt-contact-card">
                        <div class="yt-contact-card-icon">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="2" y="4" width="20" height="16" rx="2"></rect>
                                <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"></path>
                            </svg>
                        </div>
                        <div class="yt-contact-card-title">Email us</div>
                        <div class="yt-contact-card-val">support@yatrik.in</div>
                        <div class="yt-contact-card-sub">help@yatrik.in</div>
                    </div>

                    <!-- 3. Office Card -->
                    <div class="yt-contact-card">
                        <div class="yt-contact-card-icon">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                <circle cx="12" cy="10" r="3"></circle>
                            </svg>
                        </div>
                        <div class="yt-contact-card-title">Office</div>
                        <div class="yt-contact-card-val">Yatrik India Pvt Ltd</div>
                        <div class="yt-contact-card-sub">12th Floor, Platina Building</div>
                        <div class="yt-contact-card-sub">Bandra Kurla Complex, Mumbai – 400051</div>
                    </div>

                    <!-- 4. Follow Us Card -->
                    <div class="yt-contact-card">
                        <div class="yt-contact-card-title">Follow us</div>
                        <div class="yt-contact-social-row">
                            <a href="https://instagram.com" target="_blank" class="yt-contact-social-pill">Instagram</a>
                            <a href="https://facebook.com" target="_blank" class="yt-contact-social-pill">Facebook</a>
                            <a href="https://twitter.com" target="_blank" class="yt-contact-social-pill">Twitter</a>
                        </div>
                    </div>

                </div>

                <!-- Right Column: Contact Form / Success Message Card -->
                <div class="yt-contact-form-card">
                    
                    <!-- FORM PANEL (Screenshots 1 & 2) -->
                    <asp:Panel ID="pnlContactForm" runat="server">
                        <h2 class="yt-contact-form-heading">Send us a message</h2>

                        <asp:Label ID="lblError" runat="server" CssClass="yt-contact-error" Visible="false"></asp:Label>

                        <div class="yt-contact-row">
                            <div class="yt-contact-group">
                                <label class="yt-contact-label">Full name <span class="yt-req">*</span></label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="yt-contact-input" placeholder="Arjun Sharma" />
                            </div>
                            <div class="yt-contact-group">
                                <label class="yt-contact-label">Email <span class="yt-req">*</span></label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="yt-contact-input" placeholder="you@example.com" TextMode="Email" />
                            </div>
                        </div>

                        <div class="yt-contact-row">
                            <div class="yt-contact-group">
                                <label class="yt-contact-label">Phone (optional)</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="yt-contact-input" placeholder="+91 98765 43210" />
                            </div>
                            <div class="yt-contact-group">
                                <label class="yt-contact-label">Subject</label>
                                <asp:DropDownList ID="ddlSubject" runat="server" CssClass="yt-contact-select">
                                    <asp:ListItem Text="General enquiry" Value="General enquiry" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Booking assistance" Value="Booking assistance"></asp:ListItem>
                                    <asp:ListItem Text="Feedback" Value="Feedback"></asp:ListItem>
                                    <asp:ListItem Text="Partnership" Value="Partnership"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="yt-contact-group" style="margin-bottom: 24px;">
                            <label class="yt-contact-label">Message <span class="yt-req">*</span></label>
                            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="yt-contact-textarea" placeholder="How can we help you?" />
                        </div>

                        <asp:Button ID="btnSendMessage" runat="server" Text="Send message" CssClass="yt-contact-submit-btn" OnClick="btnSendMessage_Click" />
                    </asp:Panel>

                    <!-- SUCCESS CONFIRMATION PANEL (Screenshot 3) -->
                    <asp:Panel ID="pnlContactSuccess" runat="server" Visible="false" CssClass="yt-contact-success-box">
                        <div class="yt-contact-success-icon">&#10003;</div>
                        <h2 class="yt-contact-success-title">Message sent!</h2>
                        <p class="yt-contact-success-desc">
                            Thank you for reaching out, <asp:Literal ID="litSentName" runat="server"></asp:Literal>. We'll get back to you at <asp:Literal ID="litSentEmail" runat="server"></asp:Literal> within 24 hours.
                        </p>
                        <asp:Button ID="btnSendAnother" runat="server" Text="Send another message" CssClass="yt-contact-another-btn" OnClick="btnSendAnother_Click" />
                    </asp:Panel>

                </div>

            </div>

        </div>
    </div>
</asp:Content>