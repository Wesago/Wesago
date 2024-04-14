from django.contrib.admin import ModelAdmin
from django.urls import reverse
from django.utils.html import format_html
from django.utils.translation import gettext as _


class UserAdminModel(ModelAdmin):
    """
    The model should be used for interaction of third party django apps with
    Wesago's `User`.

    Removes `new` and `delete` actions (use Wesago admin for that).

    Registration call is placed in :mod:`wesago.users.admin`.
    The tests are in :mod:`wesago.users.tests.test_djangoadmin_user`.
    """

    list_display = (
        "username",
        "email",
        "rank",
        "is_staff",
        "is_superuser",
        "get_edit_from_wesago_url",
    )
    search_fields = ("username", "email")
    list_filter = ("groups", "rank", "is_staff", "is_superuser")

    actions = None
    readonly_fields = (
        "username",
        "email",
        "joined_on",
        "last_login",
        "rank",
        "is_staff",
        "is_superuser",
        "get_edit_from_wesago_url",
    )
    fieldsets = (
        (
            _("Wesago user data"),
            {
                "fields": (
                    "username",
                    "email",
                    "joined_on",
                    "last_login",
                    "rank",
                    "is_staff",
                    "is_superuser",
                    "get_edit_from_wesago_url",
                )
            },
        ),
        (_("Edit permissions and groups"), {"fields": ("groups", "user_permissions")}),
    )

    def has_add_permission(self, request):
        return False

    def has_delete_permission(self, request, obj=None):
        return False

    def get_edit_from_wesago_url(self, user_instance):
        return format_html(
            '<a href="{link}" class="{cls}" target="blank">{text}</a>',
            link=reverse(
                viewname="wesago:admin:users:edit", kwargs={"pk": user_instance.pk}
            ),
            cls="changelink",
            text=_("Edit"),
        )

    get_edit_from_wesago_url.short_description = _(
        "Edit the user from Wesago admin panel"
    )
