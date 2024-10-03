const int _kDefaultReceiveTimeout = 10000;
const int _kDefaultConnectionTimeout = 10000;

class DioConfigs {

  const DioConfigs({
    required this.baseUrl,
    this.receiveTimeout = _kDefaultReceiveTimeout,
    this.connectionTimeout = _kDefaultConnectionTimeout,
  });
  final String baseUrl;
  final int receiveTimeout;
  final int connectionTimeout;
}
