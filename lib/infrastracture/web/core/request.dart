abstract class WebRequest {
  const WebRequest();

  String get path;

  HttpMethod get httpMethod;

  Map<String, String> get httpHeaders;

  dynamic get data;

  Map<String, dynamic> get queryParameters;
// TODO(uny): optionsでまとめて、ファイル保存するためbytesも返せるようにするかも。
}

enum HttpMethod {
  get,
  post,
}

extension HttpMethodExtension on HttpMethod {
  String get value {
    switch (this) {
      case HttpMethod.post:
        return 'POST';
      default:
        return 'GET';
    }
  }
}

/// API-KEYを判別するための識別子。
enum APIType {
  /// 遊び独自のAPI。
  asobi,

  /// JWSの一部機能を利用しているAPI。
  ///
  /// OUA46XXのAPIはJWSの一部機能を利用しているため、JWSのAPI-KEYが使用されている。
  /// そのため、JWSのAPI-KEYが変更された場合、伴ってAPI-KEYを変更する必要がある。
  jws,
}
