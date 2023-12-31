part of 'payment_receipt_bloc.dart';

sealed class PaymentReceiptState extends Equatable {
  const PaymentReceiptState();

  @override
  List<Object> get props => [];
}

final class PaymentReceiptLoading extends PaymentReceiptState {}

class PaymentReceiptSuccess extends PaymentReceiptState {
  final PaymentReceiptSuccess paymentReceiptSuccess;

  const PaymentReceiptSuccess(this.paymentReceiptSuccess);

  @override
  List<Object> get props => [paymentReceiptSuccess];
}

class PaymentReceiptError extends PaymentReceiptState {
  final AppException exception;
  const PaymentReceiptError(this.exception);

  @override
  List<Object> get props => [exception];
}
