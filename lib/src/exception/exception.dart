// ignore_for_file: public_member_api_docs

class CacheException implements Exception {
  const CacheException([this.message]);

  final String? message;

  @override
  String toString() => message ?? 'Auhtentication Exception';
}
