using System;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TouchStoneConsentWebforms
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only run on normal page loads (not postbacks)
            if (!IsPostBack)
            {
                // 1. Read the consent cookie
                HttpCookie consent = Request.Cookies["CookieConsent"];

                if (consent == null)
                {
                    // No choice yet → show banner
                    pnlCookieConsent.Visible = true;
                }
                else
                {
                    // Hide banner if they've already chosen
                    pnlCookieConsent.Visible = false;

                    // If user accepted, register your non-essential scripts
                    if (consent.Value == "true")
                    {
                        RegisterAnalytics();
                    }
                }
            }
        }

        private void RegisterAnalytics()
        {
            // Replace with your real UA- or G-ID
            const string trackingId = "UA-XXXXXX-X";

            // Build the GA scripts
            string snippet = $@"
<script async src=""https://www.googletagmanager.com/gtag/js?id={trackingId}""></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){{ dataLayer.push(arguments); }}
  gtag('js', new Date());
  gtag('config', '{trackingId}');
</script>";

            // Inject into the placeholder in your <head> (or wherever you placed phScripts)
            phScripts.Controls.Add(new LiteralControl(snippet));
        }
    }
}
