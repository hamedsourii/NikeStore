import 'package:dio/dio.dart';
import 'package:nike_store/data/add_to_cart_response.dart';
import 'package:nike_store/data/cart_response.dart';

abstract class ICartDataSourse{
  Future<AddToCartResponse> add(int product_id);
  Future<AddToCartResponse> changeCount(int cartItemId,int count);
  Future<void> delete(int cartItemId);
  Future<int> count();
  Future<CartResponse>getAll();
}

class CartRemoteDataSource implements ICartDataSourse{
  final Dio httpClient;

  CartRemoteDataSource(this.httpClient);
  
  @override
  Future<AddToCartResponse> add(int product_id) async{
    final response =await httpClient.post('cart/add',data: {
        "product_id":product_id
    });

    return AddToCartResponse.fromJson(response.data);
  }
  
  @override
  Future<AddToCartResponse> changeCount(int cartItemId, int count) {
    // TODO: implement count
    throw UnimplementedError();
  }
  
  @override
  Future<int> count() {
    // TODO: implement count
    throw UnimplementedError();
  }
  
  @override
  Future<void> delete(int cartItemId) {
    // TODO: implement delete
    throw UnimplementedError();
  }
  
  @override
  Future<CartResponse> getAll() async{
    final response = await httpClient.get('cart/list');
    return CartResponse.fromJson(response.data);
  }
  
}