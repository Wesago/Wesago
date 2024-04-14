from django.apps import AppConfig


class WesagoLegalConfig(AppConfig):
    name = "wesago.legal"
    label = "wesago_legal"
    verbose_name = "Wesago Legal"

    def ready(self):
        from . import signals as _
