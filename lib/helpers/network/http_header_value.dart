enum HttpHeaderValue {
  bearer(value: 'Bearer'),
  basic(value: 'Basic'),
  contentTypeJson(value: 'application/json'),
  contentTypeAny(value: '*/*');

  const HttpHeaderValue({
    required this.value,
  });

  final String value;
}
