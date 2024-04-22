enum HttpHeaderKey {
  accept(keyName: 'accept'),
  authorization(keyName: 'authorization'),
  contentType(keyName: 'content-type'),
  accessControlAllowOrigin(keyName: 'access-control-allow-origin'),
  userAgent(keyName: 'user-agent');

  const HttpHeaderKey({
    required this.keyName,
  });

  final String keyName;
}
