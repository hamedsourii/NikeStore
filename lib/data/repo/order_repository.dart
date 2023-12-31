import 'package:nike_store/common/http_client.dart';
import 'package:nike_store/data/order.dart';
import 'package:nike_store/data/payment_receipt.dart';
import 'package:nike_store/data/source/order_data_source.dart';

final orderRepository = OrderRepository(OrderRemoteDataSource(httpClient));

abstract class IOrderRepository extends IOrderDataSource{

}
class OrderRepository implements IOrderRepository{
  final IOrderDataSource dataSource;

  OrderRepository(this.dataSource);

  @override
  Future<CreateOrderResult> create(CreateOrderParams params) => dataSource.create(params);

  @override
  Future<PaymentReceiptData> getPaymentReceipt(String orderId) {
    return dataSource.getPaymentReceipt(orderId);
  }

}