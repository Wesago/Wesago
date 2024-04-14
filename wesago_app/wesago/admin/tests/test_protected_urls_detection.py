from unittest.mock import Mock

from django.urls import reverse

from ..views import get_protected_namespace

django_admin_url = reverse("admin:index")
wesago_admin_url = reverse("wesago:admin:index")
site_url = reverse("wesago:index")


def test_request_to_wesago_admin_root_url_is_protected():
    request = Mock(path=wesago_admin_url)
    assert get_protected_namespace(request) == "wesago:admin"


def test_request_to_wesago_admin_subpath_url_is_protected():
    request = Mock(path=wesago_admin_url + "users/")
    assert get_protected_namespace(request) == "wesago:admin"


def test_request_to_django_admin_root_url_is_protected():
    request = Mock(path=django_admin_url)
    assert get_protected_namespace(request) == "admin"


def test_request_to_django_admin_subpath_url_is_protected():
    request = Mock(path=django_admin_url + "users/")
    assert get_protected_namespace(request) == "admin"


def test_request_to_site_root_url_is_not_protected():
    request = Mock(path=site_url)
    assert get_protected_namespace(request) is None


def test_request_to_site_subpath_url_is_not_protected():
    request = Mock(path=site_url + "t/some-thread-123/")
    assert get_protected_namespace(request) is None


def test_request_to_site_non_reversable_url_is_not_protected():
    request = Mock(path=site_url + "somewhere-custom/")
    assert get_protected_namespace(request) is None
