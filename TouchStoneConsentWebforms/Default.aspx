<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TouchStoneConsentWebforms._Default" %>

<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Cookie Consent Demo</title>

 <!-- Bootstrap CSS (local copy) -->
  <link 
    rel="stylesheet" 
    type="text/css" 
    href="<%= ResolveUrl("~/Content/bootstrap.min.css") %>" />

  <!-- placeholder for GA script injection -->
  <asp:PlaceHolder ID="phScripts" runat="server" />

  <style>
    .cookie-banner { box-shadow: 0 -2px 8px rgba(0,0,0,0.2); }
  </style>
</head>

  <!-- just before </body> -->
  <script>
    // 1) Make setConsent a true global function
    window.setConsent = function(value) {
      var d = new Date();
      d.setFullYear(d.getFullYear() + 1);

      // Build the cookie attributes
      var attrs = "; expires=" + d.toUTCString() + "; path=/; SameSite=Lax";
      if (location.protocol === "https:") {
        attrs += "; Secure";
      }

      // Write the consent cookie
      document.cookie = "CookieConsent=" + value + attrs;

      // Reload so your server-side code can pick it up
      location.reload();
    };

    // 2) Wire up the "Cookie Settings" link to clear everything
  document.addEventListener("DOMContentLoaded", function() {
    var link = document.getElementById("cookieSettingsLink");
    link.addEventListener("click", function(e) {
      e.preventDefault();

      // 1. Grab all cookie names
      var names = document.cookie.split(";").map(c => c.trim().split("=")[0]);

      // 2. Build every domain suffix for the current hostname
      var parts = location.hostname.split(".");
      var domains = parts.map((_, i) => parts.slice(i).join("."));

      // 3. Common expiry attributes
      var base = "; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/; SameSite=Lax";
      if (location.protocol === "https:") base += "; Secure";

      // 4. Expire each cookie with no domain, and with every possible domain suffix
      names.forEach(function(name) {
        // host‐only cookie
        document.cookie = name + "=" + base;
        // domain‐scoped cookies
        domains.forEach(function(d) {
          document.cookie = name + "=" 
                          + base 
                          + "; domain=." + d;
        });
      });

      // 5. Reload to show banner again
      location.reload();
    });
  });
  </script>


<body class="d-flex flex-column min-vh-100">
  <form id="form1" runat="server" class="flex-grow-1">

    <!-- NAVBAR -->
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
            <li class="nav-item"><a class="nav-link" href="About">About</a></li>
            <li class="nav-item"><a class="nav-link" href="Contact">Contact</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- HERO -->
    <div class="container my-5">
      <div class="p-5 mb-4 bg-light rounded-3 shadow-sm">
        <h1 class="display-5 fw-bold">ASP.NET WebForms Cookie Consent</h1>
        <p class="lead">
          Demo of a UK-compliant cookie banner in WebForms, loading analytics only after consent.
        </p>
        <hr class="my-4" />       
      </div>
    </div>

    <!-- COOKIE BANNER -->
    <asp:Panel ID="pnlCookieConsent"
               runat="server"
               CssClass="cookie-banner fixed-bottom bg-dark text-white py-3"
               Visible="false">
      <div class="container d-flex flex-wrap justify-content-between align-items-center">
        <div class="mb-2 mb-md-0">
          <small>
            <strong>This website uses only essential cookies</strong> to ensure core
            functionality and fully complies with UK consent regulations.
            <a href="CookiePolicy.aspx" target="_blank" class="text-info text-decoration-underline">
              Learn more
            </a>
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



  <!-- Bootstrap JS bundle (Popper + Bootstrap) -->
<script 
  src="<%= ResolveUrl("~/Scripts/bootstrap.bundle.min.js") %>">
</script>

</body>
</html>
