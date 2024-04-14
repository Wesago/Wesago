from django.apps import AppConfig


class WesagoThreadsConfig(AppConfig):
    name = "wesago.threads"
    label = "wesago_threads"
    verbose_name = "Wesago Threads"

    def ready(self):
        from . import signals as _
