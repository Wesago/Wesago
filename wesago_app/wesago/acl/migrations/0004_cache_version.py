# -*- coding: utf-8 -*-
from django.db import migrations

from .. import ACL_CACHE
from ...cache.operations import StartCacheVersioning


class Migration(migrations.Migration):
    dependencies = [
        ("wesago_acl", "0003_default_roles"),
        ("wesago_cache", "0001_initial"),
    ]

    operations = [StartCacheVersioning(ACL_CACHE)]
