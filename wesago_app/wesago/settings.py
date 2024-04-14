"""Wesago's default Django Project settings."""

__all__ = [
    "INSTALLED_APPS",
    "INSTALLED_PLUGINS",
    "WESAGO_FORUM_ADDRESS_HISTORY",
    "WESAGO_MIDDLEWARE",
    "WESAGO_NOTIFICATIONS_RETRY_DELAY",
    "WESAGO_PARSER_MAX_ATTACHMENTS",
    "WESAGO_PARSER_MAX_POSTS",
    "WESAGO_PARSER_MAX_USERS",
    "TEMPLATE_CONTEXT_PROCESSORS",
]

INSTALLED_APPS = [
    # Wesago overrides for Django core feature
    "wesago",
    "wesago.users",
    # Django apps
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.postgres",
    "django.contrib.humanize",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    # 3rd party apps used by Wesago
    "ariadne_django",
    "celery",
    "debug_toolbar",
    "mptt",
    "rest_framework",
    "social_django",
    # Wesago apps
    "wesago.admin",
    "wesago.acl",
    "wesago.analytics",
    "wesago.cache",
    "wesago.categories",
    "wesago.core",
    "wesago.conf",
    "wesago.icons",
    "wesago.legal",
    "wesago.themes",
    "wesago.markup",
    "wesago.menus",
    "wesago.middleware",
    "wesago.notifications",
    "wesago.oauth2",
    "wesago.parser",
    "wesago.permissions",
    "wesago.plugins",
    "wesago.postgres",
    "wesago.readtracker",
    "wesago.search",
    "wesago.socialauth",
    "wesago.threads",
    "wesago.faker",
    "wesago.graphql",
    "wesago.apiv2",
]

INSTALLED_PLUGINS = []

TEMPLATE_CONTEXT_PROCESSORS = [
    "django.template.context_processors.debug",
    "django.template.context_processors.i18n",
    "django.template.context_processors.media",
    "django.template.context_processors.request",
    "django.template.context_processors.static",
    "django.template.context_processors.tz",
    "django.contrib.auth.context_processors.auth",
    "django.contrib.messages.context_processors.messages",
    "wesago.acl.context_processors.user_acl",
    "wesago.conf.context_processors.conf",
    "wesago.conf.context_processors.og_image",
    "wesago.core.context_processors.wesago_version",
    "wesago.core.context_processors.request_path",
    "wesago.core.context_processors.momentjs_locale",
    "wesago.icons.context_processors.icons",
    "wesago.search.context_processors.search_providers",
    "wesago.themes.context_processors.theme",
    "wesago.legal.context_processors.legal_links",
    "wesago.menus.context_processors.menus",
    "wesago.users.context_processors.user_links",
    "wesago.core.context_processors.hooks",
    # Data preloaders
    "wesago.conf.context_processors.preload_settings_json",
    "wesago.core.context_processors.current_link",
    "wesago.markup.context_processors.preload_api_url",
    "wesago.threads.context_processors.preload_threads_urls",
    "wesago.users.context_processors.preload_user_json",
    "wesago.categories.context_processors.preload_categories_json",
    "wesago.socialauth.context_processors.preload_socialauth_json",
    # Note: keep frontend_context processor last for previous processors
    # to be able to expose data UI app via request.frontend_context
    "wesago.core.context_processors.frontend_context",
]

WESAGO_MIDDLEWARE = [
    "wesago.users.middleware.RealIPMiddleware",
    "wesago.core.middleware.FrontendContextMiddleware",
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
    "wesago.cache.middleware.cache_versions_middleware",
    "wesago.conf.middleware.dynamic_settings_middleware",
    "wesago.socialauth.middleware.socialauth_providers_middleware",
    "wesago.users.middleware.UserMiddleware",
    "wesago.middleware.permissions.permissions_middleware",
    "wesago.acl.middleware.user_acl_middleware",
    "wesago.core.middleware.ExceptionHandlerMiddleware",
    "wesago.users.middleware.OnlineTrackerMiddleware",
    "wesago.admin.middleware.AdminAuthMiddleware",
    "wesago.threads.middleware.UnreadThreadsCountMiddleware",
]

WESAGO_NOTIFICATIONS_RETRY_DELAY = 5  # Seconds

WESAGO_PARSER_MAX_ATTACHMENTS = 30
WESAGO_PARSER_MAX_POSTS = 20
WESAGO_PARSER_MAX_USERS = 25

WESAGO_FORUM_ADDRESS_HISTORY = []
