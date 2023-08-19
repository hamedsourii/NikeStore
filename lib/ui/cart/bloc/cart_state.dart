part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final CartResponse cartResponse;

  const CartSuccess(this.cartResponse);
  @override
  List<Object> get props => super.props;
}

class CartError extends CartState {
  final AppExeption exeption;

  const CartError(this.exeption);
}

class CartAuthRequired extends CartState{
  
}
