<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default2.aspx.cs" Inherits="TouchStoneConsentWebforms.Default2" %>


<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Cookie Consent Demo</title>

  <!-- Bootstrap CSS -->
  <link
    rel="stylesheet"
    href="<%= ResolveUrl("~/Content/bootstrap.min.css") %>" />

  <!-- Placeholder for Analytics scripts (injected after consent) -->
  <asp:PlaceHolder ID="phScripts" runat="server" />

  <style>
    .cookie-banner { box-shadow: 0 -2px 8px rgba(0,0,0,0.2); }
  </style>
</head>

<body class="d-flex flex-column min-vh-100">
  <!-- Main form wraps all server controls -->
  <form id="form1" runat="server" class="flex-grow-1">

    <!-- Your page content… -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
      <div class="container">
        <a class="navbar-brand" href="#">My WebForms App</a>
        <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navMenu">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navMenu">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="#">About</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container my-5">
      <div class="p-5 mb-4 bg-light rounded-3 shadow-sm">
        <h1 class="display-5 fw-bold">ASP.NET WebForms Cookie Consent</h1>
        <p class="lead">
          This demo shows how to implement a UK-compliant cookie banner in WebForms,
          loading non-essential scripts only after explicit consent.
        </p>
        <hr class="my-4" />
        <a class="btn btn-primary btn-lg" href="CookiePolicy.aspx" role="button">
          Learn more »
        </a>
      </div>
    </div>

    <!-- Cookie Consent Banner -->
    <asp:Panel ID="pnlCookieConsent"
               runat="server"
               CssClass="cookie-banner fixed-bottom bg-dark text-white py-3"
               Visible="false">
      <div class="container d-flex flex-wrap justify-content-between align-items-center">
        <div class="mb-2 mb-md-0">
          <small>
            <strong>This website uses only essential cookies</strong> to ensure core functionality
            and fully complies with UK consent regulations.
            <a href="CookiePolicy.aspx" class="text-info text-decoration-underline">
              Learn more
            </a>.
          </small>
        </div>
        <div>
          <button class="btn btn-success btn-sm me-2" type="button"
                  onclick="setConsent('true')">Accept All</button>
          <button class="btn btn-secondary btn-sm" type="button"
                  onclick="setConsent('false')">Decline</button>
        </div>
      </div>
    </asp:Panel>

  </form>

  <!-- Footer with Cookie Settings link -->
  <footer class="bg-light text-center py-3">
    <a href="#" id="cookieSettingsLink" class="text-decoration-underline">
      Cookie Settings
    </a>
  </footer>

  <!-- Consent & Settings JS -->
  <script>
    function setConsent(value) {
      var d = new Date();
      d.setFullYear(d.getFullYear() + 1);
      document.cookie = "CookieConsent=" + value +
                        "; expires=" + d.toUTCString() +
                        "; path=/; SameSite=Lax";
      location.reload();
    }

    // Clear consent & re-show banner
    document.addEventListener("DOMContentLoaded", function() {
      var link = document.getElementById("cookieSettingsLink");
      link.addEventListener("click", function(e) {
        e.preventDefault();
        // Expire the cookie
        document.cookie = "CookieConsent=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/; SameSite=Lax";
        // Reload to trigger banner display
        location.reload();
      });
    });
  </script>

  <!-- Bootstrap JS bundle -->
  <script
    src="<%= ResolveUrl("~/Scripts/bootstrap.bundle.min.js") %>">
  </script>
</body>
</html>
