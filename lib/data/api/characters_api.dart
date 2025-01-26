import 'package:dio/dio.dart';
import 'package:rickandmorty/constans/strings.dart';

class CharactersApi {
  late Dio dio;

  CharactersApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      print(response.data.toString());
      if (response.data is Map) {
        return response.data['results'] as List<dynamic>;
      } else {
        throw Exception('Expected a Map but got ${response.data.runtimeType}');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
