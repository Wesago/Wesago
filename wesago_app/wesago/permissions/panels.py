from debug_toolbar.panels import Panel
from django.utils.translation import pgettext_lazy


class WesagoUserPermissionsPanel(Panel):
    """Panel that displays current user's permission"""

    title = pgettext_lazy("debug toolbar", "Wesago User Permissions")
    nav_title = pgettext_lazy("debug toolbar", "Wesago Permissions")
    template = "wesago/permissions_panel.html"

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
            wesago_permissions = request.user_permissions
        except AttributeError:
            wesago_permissions = None

        self.record_stats(
            {
                "wesago_user": wesago_user,
                "wesago_permissions": wesago_permissions,
            }
        )
