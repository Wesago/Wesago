from . import exceptionhandler
from .utils import is_request_to_wesago


class ExceptionHandlerMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        return self.get_response(request)

    def process_exception(self, request, exception):
        request_is_to_wesago = is_request_to_wesago(request)
        wesago_can_handle_exception = exceptionhandler.is_wesago_exception(exception)

        if request_is_to_wesago and wesago_can_handle_exception:
            return exceptionhandler.handle_wesago_exception(request, exception)


class FrontendContextMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        request.include_frontend_context = True
        request.frontend_context = {}
        return self.get_response(request)
