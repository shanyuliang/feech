enum HttpHeaderKey {
  accept(keyName: 'accept'),
  authorization(keyName: 'authorization'),
  contentType(keyName: 'content-type'),
  accessControlAllowOrigin(keyName: 'access-control-allow-origin');

  const HttpHeaderKey({
    required this.keyName,
  });

  final String keyName;
}
