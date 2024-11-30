import 'package:dio/dio.dart';

class NetworkProvider {
  final dio = Dio();

  /// requestint images urls and descriptions from unsplash
  Future<(List<String>, List<String>)> getListImages() async {
    final response = await dio.get(
        'https://api.unsplash.com/photos/?client_id=${const String.fromEnvironment('UNSPLASH_CLIENT_ID')}&per_page=30');

    final descriptions = List<String>.from(
        response.data.map((e) => e['alt_description'].toString()).toList());

    final urls = List<String>.from(
        response.data.map((e) => e['urls']['small'].toString()).toList());

    return (urls, descriptions);
  }
}
