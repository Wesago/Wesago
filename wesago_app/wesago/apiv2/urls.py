from django.urls import include, path

app_name = "apiv2"

urlpatterns = [
    path("", include("wesago.apiv2.notifications.urls")),
    path("", include("wesago.apiv2.threads.urls")),
]
