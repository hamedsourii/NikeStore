import 'package:dio/dio.dart';
import 'package:nike_store/common/exeptions.dart';

mixin HttpResponseValidator{
  validateResponse(Response response) {
    if (response.statusCode != 200) {
      throw AppExeption();
    }
  }
}