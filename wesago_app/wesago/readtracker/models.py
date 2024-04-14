from django.conf import settings
from django.db import models
from django.utils import timezone


class PostRead(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    category = models.ForeignKey("wesago_categories.Category", on_delete=models.CASCADE)
    thread = models.ForeignKey("wesago_threads.Thread", on_delete=models.CASCADE)
    post = models.ForeignKey("wesago_threads.Post", on_delete=models.CASCADE)
    last_read_on = models.DateTimeField(default=timezone.now)
