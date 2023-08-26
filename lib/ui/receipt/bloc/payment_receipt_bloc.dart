import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nike_store/common/exeptions.dart';
import 'package:nike_store/data/repo/order_repository.dart';

part 'payment_receipt_event.dart';
part 'payment_receipt_state.dart';

class PaymentReceiptBloc
    extends Bloc<PaymentReceiptEvent, PaymentReceiptState> {
  final IOrderRepository repository;
  PaymentReceiptBloc(this.repository) : super(PaymentReceiptLoading()) {
    on<PaymentReceiptEvent>((event, emit) async {
      if (event is PaymentReceiptStarted) {
        try {
          emit(PaymentReceiptLoading());
          final result = await repository.getPaymentReceipt(event.orderId);
          emit(PaymentReceiptSuccess(result as PaymentReceiptSuccess));
        } catch (e) {
          emit(PaymentReceiptError(AppException()));
        }
      }
    });
  }
}
