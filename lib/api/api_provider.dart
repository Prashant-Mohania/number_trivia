import 'package:dio/dio.dart';
import 'package:number_pedia/models/number_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'http://numberapi.com/random';

  Future<NumberModel> fetchNum() async {
    try {
      Response response = await _dio.get(_url);
      return NumberModel(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return NumberModel.withError("Data not found / Connection issue");
    }
  }
}
