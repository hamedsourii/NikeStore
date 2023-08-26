class PaymentReceiptData{
  final bool purchaseSuccess;
  final int payablePrice;
  final int paymentStatus;

  PaymentReceiptData.fromJson(Map<String,dynamic> json)
  :purchaseSuccess = json['purchase_success'],
  payablePrice = json['payable_price'],
  paymentStatus = json['payment_status'];
}