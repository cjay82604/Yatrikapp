<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Yatrikapp.About" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="~/Content/css/about.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- 1. HERO BANNER -->
    <section class="yt-about-hero">
        <div class="yt-about-hero-overlay"></div>
        <div class="yt-about-hero-content">
            <span class="yt-about-hero-tag">OUR STORY</span>
            <h1 class="yt-about-hero-title">About Yatrik</h1>
        </div>
    </section>

    <div class="yt-about-page">
        <div class="yt-about-container">

            <!-- 2. OUR MISSION -->
            <div class="yt-mission-section">
                <div class="yt-section-eyebrow">OUR MISSION</div>
                <h2 class="yt-mission-title">Bringing India's finest stays to you</h2>
                <p class="yt-mission-desc">
                    Yatrik was born out of a simple belief &mdash; that India has some of the world's most extraordinary
                    places to stay, and every traveller deserves to find them easily. From royal Rajput havelis to
                    misty Kerala homestays, we hand-pick and verify every property so you can book with
                    confidence.
                </p>
            </div>

            <!-- 3. STATS 4-CARD GRID -->
            <div class="yt-about-stats-grid">
                <div class="yt-about-stat-card">
                    <div class="yt-about-stat-num">1,200+</div>
                    <div class="yt-about-stat-lbl">Properties listed</div>
                </div>
                <div class="yt-about-stat-card">
                    <div class="yt-about-stat-num">28</div>
                    <div class="yt-about-stat-lbl">States covered</div>
                </div>
                <div class="yt-about-stat-card">
                    <div class="yt-about-stat-num">50,000+</div>
                    <div class="yt-about-stat-lbl">Happy guests</div>
                </div>
                <div class="yt-about-stat-card">
                    <div class="yt-about-stat-num">4.8 &#9733;</div>
                    <div class="yt-about-stat-lbl">Average rating</div>
                </div>
            </div>

            <!-- 4. HOW IT STARTED -->
            <div class="yt-about-story-grid">
                <div class="yt-about-story-img-box">
                    <img src="https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&amp;fit=crop&amp;w=800&amp;q=80" alt="How it started" class="yt-about-story-img" />
                </div>
                <div>
                    <h2 class="yt-about-story-title">How it started</h2>
                    <p class="yt-about-story-p">
                        In 2022, our founder spent three months travelling through Rajasthan and fell in love with a small, family-run haveli that had no online presence. He struggled to find it and almost missed it entirely. That experience sparked Yatrik.
                    </p>
                    <p class="yt-about-story-p">
                        Today we work directly with property owners across 28 states to bring you honest listings, fair prices, and an experience that feels as warm as Indian hospitality itself.
                    </p>
                </div>
            </div>

            <!-- 5. WHAT WE STAND FOR -->
            <div class="yt-about-stand-section">
                <h2 class="yt-about-sec-heading">What we stand for</h2>
                <div class="yt-about-values-grid">
                    <div class="yt-about-value-card">
                        <span class="yt-about-val-icon">&#10022;</span>
                        <div class="yt-about-val-title">Authenticity</div>
                        <p class="yt-about-val-desc">
                            Every hotel is personally visited and verified by our team before it is listed.
                        </p>
                    </div>
                    <div class="yt-about-value-card">
                        <span class="yt-about-val-icon">&#10022;</span>
                        <div class="yt-about-val-title">Transparency</div>
                        <p class="yt-about-val-desc">
                            No hidden fees, no fake reviews. What you see is exactly what you get.
                        </p>
                    </div>
                    <div class="yt-about-value-card">
                        <span class="yt-about-val-icon">&#10022;</span>
                        <div class="yt-about-val-title">Local First</div>
                        <p class="yt-about-val-desc">
                            We prioritise independent, family-run properties over large international chains.
                        </p>
                    </div>
                </div>
            </div>

            <!-- 6. MEET THE TEAM -->
            <div class="yt-about-team-section">
                <h2 class="yt-about-sec-heading">Meet the team</h2>
                <div class="yt-about-team-grid">
                    
                    <!-- Member 1 -->
                    <div class="yt-about-member-card">
                        <div class="yt-about-avatar-box">AV</div>
                        <div class="yt-about-member-name">Arjun Verma</div>
                        <div class="yt-about-member-role">Founder &amp; CEO</div>
                        <p class="yt-about-member-bio">
                            Former travel writer who spent 10 years exploring every corner of India before building Yatrik.
                        </p>
                    </div>

                    <!-- Member 2 -->
                    <div class="yt-about-member-card">
                        <div class="yt-about-avatar-box">PI</div>
                        <div class="yt-about-member-name">Priya Iyer</div>
                        <div class="yt-about-member-role">Head of Curation</div>
                        <p class="yt-about-member-bio">
                            Personally visits every property before listing. Passionate about authentic Indian hospitality.
                        </p>
                    </div>

                    <!-- Member 3 -->
                    <div class="yt-about-member-card">
                        <div class="yt-about-avatar-box">RK</div>
                        <div class="yt-about-member-name">Rohit Kapoor</div>
                        <div class="yt-about-member-role">Technology Lead</div>
                        <p class="yt-about-member-bio">
                            Builds the platform that makes booking seamless for millions of Indian travellers.
                        </p>
                    </div>

                </div>
            </div>

            <!-- 7. READY TO EXPLORE INDIA? CTA -->
            <div class="yt-about-cta-banner">
                <h2 class="yt-about-cta-title">Ready to explore India?</h2>
                <p class="yt-about-cta-sub">Over 1,200 hand-picked stays waiting for you.</p>
                <a href="Hotels.aspx" class="yt-btn-browse-hotels">Browse Hotels</a>
            </div>

        </div>
    </div>
</asp:Content>