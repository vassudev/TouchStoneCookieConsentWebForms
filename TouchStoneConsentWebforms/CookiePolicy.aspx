<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CookiePolicy.aspx.cs" Inherits="TouchStoneConsentWebforms.CookiePolicy" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Cookie Policy</title>

  <!-- Bootstrap (local) -->
  <link
    rel="stylesheet"
    type="text/css"
    href="<%= ResolveUrl("~/Content/bootstrap.min.css") %>" />

  <!-- Optional: GOV.UK table styles or your own -->
  <style>
    .govuk-table {
      width: 100%;
      border-collapse: collapse;
    }
    .govuk-table th,
    .govuk-table td {
      border: 1px solid #dcdcdc;
      padding: 8px;
      text-align: left;
    }
    .govuk-table th {
      background-color: #f3f2f1;
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">

     <div class="container my-5">
      <h1>Cookie Policy</h1>

      <p>
        We use cookies to make our site work and to give you the best possible experience.
        This policy explains what cookies are, the UK laws governing them, and exactly how
        our implementation meets those requirements.
      </p>

      <h2>1. Why Cookies Matter</h2>
      <p>
        Cookies are small files stored on your device that help our site remember your settings,
        keep you logged in, and understand how you use our pages.
      </p>

      <h2>2. UK Legal Requirements</h2>
      <ul>
        <li>
          <strong>PECR (2003):</strong>
          Requires <em>prior opt-in</em> for any <em>non-essential</em> cookies.
        </li>
        <li>
          <strong>UK GDPR:</strong>
          Treats cookie identifiers as personal data. Consent must be
          <em>freely given, informed, specific, unambiguous</em>, and just as easy to withdraw.
        </li>
      </ul>

      <h2>3. How We Meet These Requirements</h2>
      <ul>
        <li><strong>Prior opt-in:</strong> No analytics or marketing cookies until you click “Accept.”</li>
        <li><strong>Clear information:</strong> Banner explains essential vs. optional cookies and links here.</li>
        <li><strong>Equal prominence:</strong> “Accept All” and “Decline” are styled equally—no pre-ticked boxes.</li>
        <li><strong>12-month retention:</strong> We remember your choice for one year.</li>
        <li><strong>Easy withdrawal:</strong> Click “Cookie Settings” in the footer to change your choice anytime.</li>
        <li><strong>Security by design:</strong> We set cookies with <code>SameSite=Lax</code> and limit them to our domain.</li>
      </ul>

      <h2>4. Cookies Used by Our Website</h2>
      <p>Below is a breakdown of every cookie our site currently sets:</p>
      <table class="table table-bordered table-striped">
        <thead class="table-light">
          <tr>
            <th>Name</th>
            <th>What it does</th>
            <th>Category</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><code>__RequestVerificationToken</code></td>
            <td>Anti-forgery token (protects forms)</td>
            <td>Essential (security)</td>
          </tr>
          <tr>
            <td><code>.ASPXAUTH</code></td>
            <td>ASP.NET authentication ticket (your login)</td>
            <td>Essential (auth)</td>
          </tr>
          <tr>
            <td><code>TOUCHSTONESESSID</code></td>
            <td>Session ID (keeps your “logged-in” state)</td>
            <td>Essential (session)</td>
          </tr>
          <tr>
            <td><code>timezoneoffset</code></td>
            <td>Remembers your time-zone (e.g. –330 mins = IST)</td>
            <td>Functional (preference)</td>
          </tr>
          <tr>
            <td><code>TSCookie656</code></td>
            <td>Short-lived app handshake or feature flag</td>
            <td>Functional (app-logic)</td>
          </tr>
        </tbody>
      </table>

      <h2>5. Managing Your Preferences</h2>
      <p>
        You can update or withdraw your consent at any time:
      </p>
      <ul>
        <li>Click the <strong>Cookie Settings</strong> link in the footer to revisit the banner.</li>
        <li>Or manage cookies directly in your browser—see 
          <a href="https://ico.org.uk/for-the-public/online/cookies/">ICO: Cookies for the Public</a>.
        </li>
      </ul>

      <p class="mt-4 text-muted">
        <small>Last updated: May 2025</small>
      </p>
    </div>


  </form>

  <!-- Bootstrap JS (optional, if you need any JS) -->
  <script
    src="<%= ResolveUrl("~/Scripts/bootstrap.bundle.min.js") %>"
  ></script>
</body>
</html>
