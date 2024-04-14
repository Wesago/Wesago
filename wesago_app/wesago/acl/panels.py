from debug_toolbar.panels import Panel
from django.utils.translation import pgettext_lazy


class WesagoACLPanel(Panel):
    """panel that displays current user's ACL"""

    title = pgettext_lazy("debug toolbar", "Wesago User ACL")
    template = "wesago/acl_debug.html"

    @property
    def nav_subtitle(self):
        wesago_user = self.get_stats().get("wesago_user")

        if wesago_user and wesago_user.is_authenticated:
            return wesago_user.username
        return pgettext_lazy("debug toolbar", "Anonymous user")

    def generate_stats(self, request, response):
        try:
            wesago_user = request.user
        except AttributeError:
            wesago_user = None

        try:
            wesago_acl = request.user_acl
        except AttributeError:
            wesago_acl = {}

        self.record_stats({"wesago_user": wesago_user, "wesago_acl": wesago_acl})
