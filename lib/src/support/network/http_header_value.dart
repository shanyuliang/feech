enum HttpHeaderValue {
  bearer(value: 'Bearer'),
  basic(value: 'Basic'),
  acceptJson(value: 'application/json'),
  contentTypeJson(value: 'application/json; charset=utf-8'),
  acceptAny(value: '*/*'),
  contentTypeAny(value: '*/*'),
  userAgentAndroid(value: 'Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.6312.99 Mobile Safari/537.36'),
  userAgentIOS(
    value:
        'Mozilla/5.0 (iPhone; CPU iPhone OS 17_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Mobile/15E148 Safari/604.1',
  );

  const HttpHeaderValue({required this.value});

  final String value;
}
