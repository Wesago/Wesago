from django.apps import AppConfig


class WesagoNotificationsConfig(AppConfig):
    name = "wesago.notifications"
    label = "wesago_notifications"
    verbose_name = "Wesago Notifications"

    def ready(self):
        from . import signals as _  # noqa: F401
