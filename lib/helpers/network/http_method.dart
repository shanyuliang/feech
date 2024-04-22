enum HttpMethod {
  head(methodName: 'HEAD'),
  get(methodName: 'GET'),
  post(methodName: 'POST'),
  put(methodName: 'PUT'),
  patch(methodName: 'PATCH'),
  delete(methodName: 'DELETE');

  const HttpMethod({
    required this.methodName,
  });

  final String methodName;
}
