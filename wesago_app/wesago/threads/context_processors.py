from django.urls import reverse


def preload_threads_urls(request):
    request.frontend_context.update(
        {
            "ATTACHMENTS_API": reverse("wesago:api:attachment-list"),
            "THREAD_EDITOR_API": reverse("wesago:api:thread-editor"),
            "THREADS_API": reverse("wesago:api:thread-list"),
            "PRIVATE_THREADS_API": reverse("wesago:api:private-thread-list"),
            "PRIVATE_THREADS_URL": reverse("wesago:private-threads"),
        }
    )

    return {}
