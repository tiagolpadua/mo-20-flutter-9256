import 'package:http_interceptor/http_client_with_interceptor.dart';

import 'logging_interceptor.dart';

// const baseUrl = 'http://192.168.0.100:8080/transactions';

// const baseUrl = 'http://10.0.0.2:8080/transactions';

const baseUrl = 'http://arivaldo.asuscomm.com:8080/transactions';

final client = HttpClientWithInterceptor.build(interceptors: [
  LoggingInterceptor(),
]);

