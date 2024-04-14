from django.apps import AppConfig


class WesagoReadTrackerConfig(AppConfig):
    name = "wesago.readtracker"
    label = "wesago_readtracker"
    verbose_name = "Wesago Read Tracker"

    def ready(self):
        from . import signals as _
