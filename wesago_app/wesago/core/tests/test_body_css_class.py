from django.urls import reverse

from ...test import assert_contains, assert_not_contains


def test_body_has_wesago_anonymous_css_class_if_user_is_anonymous(db, client):
    response = client.get(reverse("wesago:index"))
    assert_contains(response, 'class="wesago-anonymous')
    assert_not_contains(response, 'class="wesago-authenticated')


def test_body_has_wesago_authenticated_css_class_if_user_is_authenticated(user_client):
    response = user_client.get(reverse("wesago:index"))
    assert_contains(response, 'class="wesago-authenticated')
    assert_not_contains(response, 'class="wesago-anonymous')
