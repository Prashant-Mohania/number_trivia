import 'package:number_pedia/models/number_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<NumberModel> fetchNum() {
    return _provider.fetchNum();
  }
}

class NetworkError extends Error {}
