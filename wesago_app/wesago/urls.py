from django.urls import include, path
from django.views.generic import TemplateView

from . import hooks
from .conf import settings
from .core.views import forum_index

app_name = "wesago"

# Register Wesago Apps
urlpatterns = [
    path("", include("wesago.analytics.urls")),
    path("", include("wesago.legal.urls")),
    path("", include("wesago.users.urls")),
    path("", include("wesago.categories.urls")),
    path("", include("wesago.threads.urls")),
    path("", include("wesago.notifications.urls")),
    path("", include("wesago.search.urls")),
    path("", include("wesago.oauth2.urls")),
    path("", include("wesago.socialauth.urls")),
    path("", include("wesago.healthcheck.urls")),
    # default robots.txt
    path(
        "robots.txt",
        TemplateView.as_view(
            content_type="text/plain", template_name="wesago/robots.txt"
        ),
    ),
    # "wesago:index" link symbolises "root" of Wesago links space
    # any request with path that falls below this one is assumed to be directed
    # at Wesago and will be handled by wesago.views.exceptionhandler if it
    # results in Http404 or PermissionDenied exception
    path("", forum_index, name="index"),
]


# Register API
apipatterns = hooks.apipatterns + [
    path("", include("wesago.legal.urls.api")),
    path("", include("wesago.markup.urls")),
    path("", include("wesago.threads.urls.api")),
    path("", include("wesago.users.urls.api")),
    path("", include("wesago.search.urls.api")),
]

urlpatterns += [
    path("api/", include((apipatterns, "api"), namespace="api")),
    path("api/v2/", include("wesago.apiv2.urls")),
]


# Register Wesago ACP
if settings.WESAGO_ADMIN_PATH:
    # Admin patterns recognised by Wesago
    adminpatterns = [path("", include("wesago.admin.urls"))]

    admin_prefix = f"{settings.WESAGO_ADMIN_PATH}/"
    urlpatterns += [
        path(admin_prefix, include((adminpatterns, "admin"), namespace="admin"))
    ]
