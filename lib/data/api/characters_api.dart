import 'package:dio/dio.dart';
import 'package:rickandmorty/constans/strings.dart';

class Charactersapi {
  late Dio dio;

  Charactersapi() {
    BaseOptions Options = BaseOptions(
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(milliseconds: 20000),
      receiveTimeout: Duration(milliseconds: 20000),
    );
    dio = Dio(Options);
  }
  Future<List<dynamic>> getallcharacters() async {
    try {
      Response response = await dio.get('character');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
