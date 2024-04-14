from django.apps import AppConfig

from .providers import providers


class WesagoACLsConfig(AppConfig):
    name = "wesago.acl"
    label = "wesago_acl"
    verbose_name = "Wesago ACL framework"

    def ready(self):
        providers.load()
