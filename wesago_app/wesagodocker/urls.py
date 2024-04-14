"""wesagodocker URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf import settings
from django.urls import include, path
from django.conf.urls.static import static
from django.utils import timezone
from django.views.decorators.cache import cache_page
from django.views.decorators.http import last_modified
from django.views.i18n import JavaScriptCatalog
from wesago import __released__, __version__
from wesago.plugins.urlpatterns import discover_plugins_urlpatterns

# Import urls override or default to no urls
try:
    from .urls_override import urlpatterns as override_urlpatterns
except ImportError:
    override_urlpatterns = []


# Cache key for django-i18n.js view that invalidates cache when
# Wesago version, release status or language code changes
wesago_i18n_cache_key = (
    (f"wesagojsi18n_{settings.LANGUAGE_CODE}_{__version__}_{__released__}")
    .replace(".", "_")
    .replace("-", "_")
    .lower()
)


# Discover plugins urlpatterns
plugins_urlpatterns = discover_plugins_urlpatterns(settings.INSTALLED_PLUGINS)


# Add standard URL's
urlpatterns = override_urlpatterns + plugins_urlpatterns + [
    path("", include("wesago.urls", namespace="wesago")),

    # Javascript translations
    path(
        "django-i18n.js",
        last_modified(lambda req, **kw: timezone.now())(
            cache_page(86400 * 14, key_prefix=wesago_i18n_cache_key)(
                JavaScriptCatalog.as_view(packages=["wesago"])
            )
        ),
        name="django-i18n",
    ),
]


# Use static file server for static and media files (debug only)
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


# Error Handlers
# Wesago needs those handlers to deal with errors raised by it's middlewares
# If you replace those handlers with custom ones, make sure you decorate them
# with shared_403_exception_handler or shared_404_exception_handler
# decorators that are defined in wesago.views.errorpages module!
handler403 = 'wesago.core.errorpages.permission_denied'
handler404 = 'wesago.core.errorpages.page_not_found'
