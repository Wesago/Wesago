from django.apps import AppConfig


class WesagoThemesConfig(AppConfig):
    name = "wesago.themes"
    label = "wesago_themes"
    verbose_name = "Wesago Theming"

    def ready(self):
        # pylint: disable=unused-import
        from .admin import tasks
