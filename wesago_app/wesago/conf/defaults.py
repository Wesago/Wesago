# pylint: disable=line-too-long
"""
Default Wesago settings. Override these with settings in the module pointed to
by the DJANGO_SETTINGS_MODULE environment variable.

If you rely on any of those in your code, make sure you use `wesago.conf.settings`
instead of Django's `django.conf.settings`.
"""

# Permissions system extensions
# https://wesago.readthedocs.io/en/latest/developers/acls.html#extending-permissions-system

WESAGO_ACL_EXTENSIONS = [
    "wesago.users.permissions.account",
    "wesago.users.permissions.profiles",
    "wesago.users.permissions.moderation",
    "wesago.users.permissions.delete",
    "wesago.categories.permissions",
    "wesago.threads.permissions.attachments",
    "wesago.threads.permissions.polls",
    "wesago.threads.permissions.threads",
    "wesago.threads.permissions.privatethreads",
    "wesago.threads.permissions.bestanswers",
    "wesago.search.permissions",
]


# Path to the directory that Wesago should use to prepare user data downloads.
# Should not be accessible from internet.

WESAGO_USER_DATA_DOWNLOADS_WORKING_DIR = None


# Custom markup extensions

WESAGO_MARKUP_EXTENSIONS = []


# Custom post validators

WESAGO_POST_VALIDATORS = []


# Post search filters

WESAGO_POST_SEARCH_FILTERS = []


# Posting middlewares
# https://wesago.readthedocs.io/en/latest/developers/posting_process.html

WESAGO_POSTING_MIDDLEWARES = [
    # Always keep FloodProtectionMiddleware middleware first one
    "wesago.threads.api.postingendpoint.floodprotection.FloodProtectionMiddleware",
    "wesago.threads.api.postingendpoint.category.CategoryMiddleware",
    "wesago.threads.api.postingendpoint.privatethread.PrivateThreadMiddleware",
    "wesago.threads.api.postingendpoint.reply.ReplyMiddleware",
    "wesago.threads.api.postingendpoint.moderationqueue.ModerationQueueMiddleware",
    "wesago.threads.api.postingendpoint.attachments.AttachmentsMiddleware",
    "wesago.threads.api.postingendpoint.participants.ParticipantsMiddleware",
    "wesago.threads.api.postingendpoint.pin.PinMiddleware",
    "wesago.threads.api.postingendpoint.close.CloseMiddleware",
    "wesago.threads.api.postingendpoint.hide.HideMiddleware",
    "wesago.threads.api.postingendpoint.protect.ProtectMiddleware",
    "wesago.threads.api.postingendpoint.recordedit.RecordEditMiddleware",
    "wesago.threads.api.postingendpoint.updatestats.UpdateStatsMiddleware",
    "wesago.threads.api.postingendpoint.mentions.MentionsMiddleware",
    "wesago.threads.api.postingendpoint.syncprivatethreads.SyncPrivateThreadsMiddleware",
    # Always keep SaveChangesMiddleware middleware after all state-changing middlewares
    "wesago.threads.api.postingendpoint.savechanges.SaveChangesMiddleware",
    # Those middlewares are last because they don't change app state
    "wesago.threads.api.postingendpoint.notifications.NotificationsMiddleware",
]


# Configured thread types

WESAGO_THREAD_TYPES = [
    "wesago.threads.threadtypes.thread.Thread",
    "wesago.threads.threadtypes.privatethread.PrivateThread",
]


# Search extensions

WESAGO_SEARCH_EXTENSIONS = [
    "wesago.threads.search.SearchThreads",
    "wesago.users.search.SearchUsers",
]


# Additional registration validators
# https://wesago.readthedocs.io/en/latest/developers/validating_registrations.html

WESAGO_NEW_REGISTRATIONS_VALIDATORS = [
    "wesago.users.validators.validate_gmail_email",
    "wesago.users.validators.validate_with_sfs",
]


# Custom profile fields

WESAGO_PROFILE_FIELDS = []


# Login API URL

WESAGO_LOGIN_API_URL = "auth"


# Wesago Admin Path
# Omit starting and trailing slashes. To disable Wesago admin, empty this value.

WESAGO_ADMIN_PATH = "admincp"


# Admin urls namespaces that Wesago's AdminAuthMiddleware should protect

WESAGO_ADMIN_NAMESPACES = ["admin", "wesago:admin"]


# How long (in minutes) since previous request to admin namespace should admin session last.

WESAGO_ADMIN_SESSION_EXPIRATION = 60


# Display threads on forum index
# Change this to false to display categories list instead

WESAGO_THREADS_ON_INDEX = True


# How many notifications may be retrieved from the API in single request?

WESAGO_NOTIFICATIONS_PAGE_LIMIT = 50


# How many unread notifications to track
# Wesago will not report report unread notifications count bigger than this
# Example: if limit 50 and user has 56 unread notifications, UI will show "50+"
# Also used by the notifications healing mechanism

WESAGO_UNREAD_NOTIFICATIONS_LIMIT = 50


# Function used for generating individual avatar for user

WESAGO_DYNAMIC_AVATAR_DRAWER = "wesago.users.avatars.dynamic.draw_default"


# Path to directory containing avatar galleries
# Those galleries can be loaded by running loadavatargallery command

WESAGO_AVATAR_GALLERY = None


# Save user avatars for sizes
# Keep sizes ordered from greatest to smallest
# Max size also controls min size of uploaded image as well as crop size

WESAGO_AVATARS_SIZES = [400, 200, 150, 128, 100, 64, 50, 40, 32, 20]


# Path to blank avatar image used for guests and removed users.

WESAGO_BLANK_AVATAR = "wesago/img/blank-avatar.png"


# Max allowed size of image before Wesago will generate thumbnail for it

WESAGO_ATTACHMENT_IMAGE_SIZE_LIMIT = (500, 500)


# Length of secret used for attachments url tokens and filenames

WESAGO_ATTACHMENT_SECRET_LENGTH = 64


# Names of files served when user requests file that doesn't exist or is unavailable

WESAGO_ATTACHMENT_403_IMAGE = "wesago/img/attachment-403.png"
WESAGO_ATTACHMENT_404_IMAGE = "wesago/img/attachment-404.png"


# Available Moment.js locales

WESAGO_MOMENT_JS_LOCALES = [
    "af",
    "ar-ma",
    "ar-sa",
    "ar-tn",
    "ar",
    "az",
    "be",
    "bg",
    "bn",
    "bo",
    "br",
    "bs",
    "ca",
    "cs",
    "cv",
    "cy",
    "da",
    "de-at",
    "de",
    "el",
    "en-au",
    "en-ca",
    "en-gb",
    "eo",
    "es",
    "et",
    "eu",
    "fa",
    "fi",
    "fo",
    "fr-ca",
    "fr",
    "fy",
    "gl",
    "he",
    "hi",
    "hr",
    "hu",
    "hy-am",
    "id",
    "is",
    "it",
    "ja",
    "ka",
    "km",
    "ko",
    "lb",
    "lt",
    "lv",
    "mk",
    "ml",
    "mr",
    "ms-my",
    "my",
    "nb",
    "ne",
    "nl",
    "nn",
    "pl",
    "pt-br",
    "pt",
    "ro",
    "ru",
    "sk",
    "sl",
    "sq",
    "sr-cyrl",
    "sr",
    "sv",
    "ta",
    "th",
    "tl-ph",
    "tr",
    "tzm-latn",
    "tzm",
    "uk",
    "uz",
    "vi",
    "zh-cn",
    "zh-hans",
    "zh-tw",
]
