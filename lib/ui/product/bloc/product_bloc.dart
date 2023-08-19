import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nike_store/common/exeptions.dart';
import 'package:nike_store/data/repo/cart_repository.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ICartRepository cartRepository;
  ProductBloc(this.cartRepository) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {
      if(event is CartAddButtonClick){
         try{
          emit(ProductAddToCartButtonLoading());
          final result = cartRepository.add(event.productId);
          emit(ProductAddToCartSuccess());
         }catch(e){
          emit(ProductAddToCartError(AppExeption()));
         }
      }
    });
  }
}
