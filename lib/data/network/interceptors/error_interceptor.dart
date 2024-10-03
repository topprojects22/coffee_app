import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';

class ErrorInterceptor extends Interceptor {

  ErrorInterceptor(this._eventBus);
  final EventBus _eventBus;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _eventBus.fire(
      ErrorEvent(path: err.requestOptions.path, response: err.response),
    );
    super.onError(err, handler);
  }
}

class ErrorEvent {

  ErrorEvent({required this.path, this.response});
  final String path;
  final Response? response;
}
