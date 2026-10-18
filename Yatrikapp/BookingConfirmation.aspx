<%@ Page Title="Booking Confirmed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingConfirmation.aspx.cs" Inherits="YourWebFormsProject.BookingConfirmation" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="~/Content/css/booking.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="yt-confirm-page">
        <div class="yt-confirm-container">

            <!-- Checkmark Icon -->
            <div class="yt-confirm-check-circle">&#10003;</div>

            <!-- Title & Subtitle -->
            <h1 class="yt-confirm-title">Booking confirmed!</h1>
            <div class="yt-confirm-id">
                Booking ID: <asp:Literal ID="litBookingId" runat="server">YT-7470</asp:Literal>
            </div>
            <p class="yt-confirm-note">
                Confirmation has been sent to <asp:Literal ID="litEmail" runat="server">j@gmail.com</asp:Literal>.
            </p>

            <!-- Receipt Box -->
            <div class="yt-confirm-receipt-box">
                <div class="yt-receipt-row">
                    <span>Hotel</span>
                    <span class="yt-receipt-val"><asp:Literal ID="litHotelName" runat="server">Rann Desert Camp</asp:Literal></span>
                </div>
                <div class="yt-receipt-row">
                    <span>Check-in</span>
                    <span class="yt-receipt-val"><asp:Literal ID="litCheckIn" runat="server">2026-09-29</asp:Literal></span>
                </div>
                <div class="yt-receipt-row">
                    <span>Check-out</span>
                    <span class="yt-receipt-val"><asp:Literal ID="litCheckOut" runat="server">2026-09-29</asp:Literal></span>
                </div>
                <div class="yt-receipt-row">
                    <span>Payment</span>
                    <span class="yt-receipt-val">Pay at hotel</span>
                </div>
                <div class="yt-receipt-row">
                    <span>Amount due at hotel</span>
                    <span class="yt-receipt-val">&#8377;<asp:Literal ID="litAmountDue" runat="server">13,440</asp:Literal></span>
                </div>
            </div>

            <!-- Back to Home Button -->
            <a href="Default.aspx" class="yt-btn-pill-home">Back to home</a>

        </div>
    </div>
</asp:Content>