import 'package:dio/dio.dart';
import 'package:nike_store/data/common/http_response_validator.dart';
import 'package:nike_store/data/product.dart';

abstract class IProductDataSource {
  Future<List<ProductEntity>> getAll(int sort);
  Future<List<ProductEntity>> search(String searchTerm);
}

class ProductRemoteDataSource with HttpResponseValidator implements IProductDataSource {
  final Dio httpClient;

  ProductRemoteDataSource(this.httpClient);
  @override
  Future<List<ProductEntity>> getAll(int sort) async {
    final response = await httpClient.get('product/list?sort=$sort');
    validateResponse(response);
    final product = <ProductEntity>[];
    (response.data as List).forEach((element) {
      product.add(ProductEntity.fromJson(element));
    });
    return product;
  }

  @override
  Future<List<ProductEntity>> search(String searchTerm) async {
    final response = await httpClient.get('product/search?q=$searchTerm');
    validateResponse(response);
    final product = <ProductEntity>[];
    (response.data as List).forEach((element) {
      product.add(ProductEntity.fromJson(element));
    });
    return product;
  }

  
}