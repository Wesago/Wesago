from django.apps import AppConfig


class WesagoCategoriesConfig(AppConfig):
    name = "wesago.categories"
    label = "wesago_categories"
    verbose_name = "Wesago Categories"

    def ready(self):
        from . import signals as _
