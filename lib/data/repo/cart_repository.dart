import 'package:nike_store/common/http_client.dart';

import 'package:nike_store/data/add_to_cart_response.dart';
import 'package:nike_store/data/cart_response.dart';
import 'package:nike_store/data/source/cart_data_sourse.dart';

final cartRepository = CartRepository(CartRemoteDataSource(httpClient));

abstract class ICartRepository extends ICartDataSourse {}


class CartRepository implements ICartRepository{

  final ICartDataSourse dataSourse;

  CartRepository(this.dataSourse);
  @override
  Future<AddToCartResponse> add(int product_id) {
    return dataSourse.add(product_id);
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
  Future<CartResponse> getAll() {
    return dataSourse.getAll();
  }

}