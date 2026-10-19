<%@ Page Title="Complete your booking" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="YourWebFormsProject.Booking" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="~/Content/css/booking.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="yt-booking-page">
        <div class="yt-booking-container">

            <asp:HyperLink ID="lnkBack" runat="server" CssClass="yt-back-link">&larr; Back</asp:HyperLink>

            <div class="yt-checkout-layout">

                <!-- LEFT COLUMN: MULTI-STEP FORM -->
                <div>
                    <h1 class="yt-booking-main-title">Complete your booking</h1>
                    <p class="yt-booking-main-sub">Fill in your details to confirm the reservation.</p>

                    <!-- Alert / Error Banner -->
                    <asp:Panel ID="pnlAlert" runat="server" Visible="false">
                        <asp:Literal ID="litAlertMessage" runat="server" />
                    </asp:Panel>

                    <!-- ========================================== -->
                    <!-- STEP 1 PANEL: GUEST DETAILS                -->
                    <!-- ========================================== -->
                    <asp:Panel ID="pnlStep1" runat="server" Visible="true">

                        <!-- Step Indicator (Step 1 Active) -->
                        <div class="yt-steps-indicator">
                            <div class="yt-step-item">
                                <span class="yt-step-badge active">1</span>
                                <span class="yt-step-text active">Guest details</span>
                            </div>
                            <span class="yt-step-dash">&mdash;</span>
                            <div class="yt-step-item">
                                <span class="yt-step-badge inactive">2</span>
                                <span class="yt-step-text inactive">Payment option</span>
                            </div>
                        </div>

                        <!-- 1. First & Last name -->
                        <div class="yt-form-2col" style="margin-bottom: 14px;">
                            <div>
                                <label class="yt-form-label">First name <span class="yt-req">*</span></label>
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="yt-input-field" Placeholder="Arjun" />
                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                                    ControlToValidate="txtFirstName" 
                                    ValidationGroup="BookingGroup" 
                                    ErrorMessage="First name is required" 
                                    CssClass="yt-val-error" 
                                    Display="Dynamic" />
                            </div>
                            <div>
                                <label class="yt-form-label">Last name <span class="yt-req">*</span></label>
                                <asp:TextBox ID="txtLastName" runat="server" CssClass="yt-input-field" Placeholder="Sharma" />
                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                                    ControlToValidate="txtLastName" 
                                    ValidationGroup="BookingGroup" 
                                    ErrorMessage="Last name is required" 
                                    CssClass="yt-val-error" 
                                    Display="Dynamic" />
                            </div>
                        </div>

                        <!-- 2. Email -->
                        <div class="yt-form-group">
                            <label class="yt-form-label">Email <span class="yt-req">*</span></label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="yt-input-field" Placeholder="j@gmail.com" />
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                ControlToValidate="txtEmail" 
                                ValidationGroup="BookingGroup" 
                                ErrorMessage="Email address is required" 
                                CssClass="yt-val-error" 
                                Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                                ControlToValidate="txtEmail" 
                                ValidationGroup="BookingGroup" 
                                ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$" 
                                ErrorMessage="Please enter a valid email address" 
                                CssClass="yt-val-error" 
                                Display="Dynamic" />
                        </div>

                        <!-- 3. Phone -->
                        <div class="yt-form-group">
                            <label class="yt-form-label">Phone <span class="yt-req">*</span></label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="yt-input-field" Placeholder="+91 98765 43210" />
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                                ControlToValidate="txtPhone" 
                                ValidationGroup="BookingGroup" 
                                ErrorMessage="Phone number is required" 
                                CssClass="yt-val-error" 
                                Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                                ControlToValidate="txtPhone" 
                                ValidationGroup="BookingGroup" 
                                ValidationExpression="^(\+91[\s\-]?)?[6789]\d{9}$" 
                                ErrorMessage="Please enter a valid 10-digit mobile number" 
                                CssClass="yt-val-error" 
                                Display="Dynamic" />
                        </div>

                        <!-- 4. Check-in & Check-out -->
                        <div class="yt-form-2col" style="margin-bottom: 14px;">
                            <div>
                                <label class="yt-form-label">Check-in <span class="yt-req">*</span></label>
                                <asp:TextBox ID="txtCheckIn" runat="server" TextMode="Date" CssClass="yt-input-field" />
                                <asp:RequiredFieldValidator ID="rfvCheckIn" runat="server" 
                                    ControlToValidate="txtCheckIn" 
                                    ValidationGroup="BookingGroup" 
                                    ErrorMessage="Check-in date is required" 
                                    CssClass="yt-val-error" 
                                    Display="Dynamic" />
                            </div>
                            <div>
                                <label class="yt-form-label">Check-out <span class="yt-req">*</span></label>
                                <asp:TextBox ID="txtCheckOut" runat="server" TextMode="Date" CssClass="yt-input-field" />
                                <asp:RequiredFieldValidator ID="rfvCheckOut" runat="server" 
                                    ControlToValidate="txtCheckOut" 
                                    ValidationGroup="BookingGroup" 
                                    ErrorMessage="Check-out date is required" 
                                    CssClass="yt-val-error" 
                                    Display="Dynamic" />
                                <asp:CompareValidator ID="cvDates" runat="server" 
                                    ControlToValidate="txtCheckOut" 
                                    ControlToCompare="txtCheckIn" 
                                    Operator="GreaterThan" 
                                    Type="Date" 
                                    ValidationGroup="BookingGroup" 
                                    ErrorMessage="Check-out must be after Check-in" 
                                    CssClass="yt-val-error" 
                                    Display="Dynamic" />
                            </div>
                        </div>

                        <!-- 5. Guests & Rooms -->
                        <div class="yt-form-2col" style="margin-bottom: 14px;">
                            <div>
                                <label class="yt-form-label">Guests</label>
                                <asp:DropDownList ID="ddlGuests" runat="server" CssClass="yt-input-field">
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2" Selected="True">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div>
                                <label class="yt-form-label">Rooms</label>
                                <asp:DropDownList ID="ddlRooms" runat="server" CssClass="yt-input-field">
                                    <asp:ListItem Value="1" Selected="True">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <!-- 6. Special Requests (Optional) -->
                        <div class="yt-form-group">
                            <label class="yt-form-label">Special requests (optional)</label>
                            <asp:TextBox ID="txtSpecialRequests" runat="server" TextMode="MultiLine" CssClass="yt-textarea-field" Placeholder="Late check-in, dietary needs..." />
                        </div>

                        <!-- Continue Button -->
                        <asp:Button ID="btnContinue" runat="server" 
                            Text="Continue &rarr;" 
                            CssClass="yt-btn-pill-block" 
                            ValidationGroup="BookingGroup" 
                            OnClick="btnContinue_Click" />

                    </asp:Panel>

                    <!-- ========================================== -->
                    <!-- STEP 2 PANEL: PAYMENT OPTION               -->
                    <!-- ========================================== -->
                    <asp:Panel ID="pnlStep2" runat="server" Visible="false">

                        <!-- Step Indicator (Step 1 Completed, Step 2 Active) -->
                        <div class="yt-steps-indicator">
                            <div class="yt-step-item">
                                <span class="yt-step-badge completed">&#10003;</span>
                                <span class="yt-step-text active">Guest details</span>
                            </div>
                            <span class="yt-step-dash">&mdash;</span>
                            <div class="yt-step-item">
                                <span class="yt-step-badge active">2</span>
                                <span class="yt-step-text active">Payment option</span>
                            </div>
                        </div>

                        <!-- Pay at the hotel Card -->
                        <div class="yt-payment-card">
                            <div class="yt-radio-custom">
                                <div class="yt-radio-dot"></div>
                            </div>
                            <div>
                                <div class="yt-payment-title">Pay at the hotel</div>
                                <div class="yt-payment-sub">
                                    No payment is required now. Pay &#8377;<asp:Literal ID="litPaymentDue" runat="server">13,440</asp:Literal> directly at the property during your stay.
                                </div>
                            </div>
                        </div>

                        <!-- Green Info Box -->
                        <div class="yt-info-notice">
                            Your room will be reserved instantly. The hotel may ask for a valid photo ID at check-in.
                        </div>

                        <!-- Action Buttons -->
                        <div class="yt-actions-row">
                            <asp:LinkButton ID="btnBackToStep1" runat="server" CssClass="yt-btn-pill-back" OnClick="btnBackToStep1_Click">&larr; Back</asp:LinkButton>
                            <asp:Button ID="btnConfirmBooking" runat="server" Text="Confirm booking" CssClass="yt-btn-pill-confirm" OnClick="btnConfirmBooking_Click" />
                        </div>

                    </asp:Panel>

                </div>

                <!-- RIGHT COLUMN: SUMMARY CARD (Stays consistent across both steps) -->
                <aside class="yt-summary-card">
                    <div class="yt-summary-img-box">
                        <asp:Image ID="imgHotel" runat="server" CssClass="yt-summary-img" />
                    </div>
                    <div class="yt-summary-body">
                        <span class="yt-summary-badge"><asp:Literal ID="litCategory" runat="server">Heritage</asp:Literal></span>
                        <div class="yt-summary-title"><asp:Literal ID="litHotelName" runat="server">Rann Desert Camp</asp:Literal></div>
                        <div class="yt-summary-loc">
                            <span style="color:var(--brand-terracotta);">&#128205;</span>
                            <asp:Literal ID="litLocation" runat="server">Bhuj, Gujarat</asp:Literal>
                        </div>

                        <!-- Pricing Breakdown -->
                        <div class="yt-summary-pricing">
                            <div class="yt-summary-row">
                                <span>&#8377;<asp:Literal ID="litBaseRate" runat="server">12,000</asp:Literal> &times; 1N</span>
                                <span>&#8377;<asp:Literal ID="litSubTotal" runat="server">12,000</asp:Literal></span>
                            </div>
                            <div class="yt-summary-row">
                                <span>GST (12%)</span>
                                <span>&#8377;<asp:Literal ID="litTax" runat="server">1,440</asp:Literal></span>
                            </div>
                            <div class="yt-summary-row total">
                                <span>Total</span>
                                <span>&#8377;<asp:Literal ID="litTotal" runat="server">13,440</asp:Literal></span>
                            </div>
                        </div>
                    </div>
                </aside>

            </div>

        </div>
    </div>
</asp:Content>