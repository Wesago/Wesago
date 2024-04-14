from django.urls import path

from .. import admin
from .views import auth, index, select

urlpatterns = [
    # "wesago:admin:index" link symbolises "root" of Wesago admin links space
    # any request with path that falls below this one is assumed to be directed
    # at Wesago Admin and will be checked by Wesago Admin Middleware
    path("", index.admin_index, name="index"),
    path("select/user/", select.select_user, name="select-user"),
    path("logout/", auth.logout, name="logout"),
]

# Discover admin and register patterns
admin.discover_wesago_admin()
urlpatterns += admin.urlpatterns()
