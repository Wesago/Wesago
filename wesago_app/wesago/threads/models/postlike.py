from django.conf import settings
from django.db import models
from django.utils import timezone


class PostLike(models.Model):
    category = models.ForeignKey("wesago_categories.Category", on_delete=models.CASCADE)
    thread = models.ForeignKey("wesago_threads.Thread", on_delete=models.CASCADE)
    post = models.ForeignKey("wesago_threads.Post", on_delete=models.CASCADE)

    liker = models.ForeignKey(
        settings.AUTH_USER_MODEL, blank=True, null=True, on_delete=models.SET_NULL
    )
    liker_name = models.CharField(max_length=255, db_index=True)
    liker_slug = models.CharField(max_length=255)

    liked_on = models.DateTimeField(default=timezone.now)

    class Meta:
        ordering = ["-id"]
