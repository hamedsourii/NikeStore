part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductAddToCartButtonLoading extends ProductState {}

class ProductAddToCartError extends ProductState {
  final AppExeption exeption;

  const ProductAddToCartError(this.exeption);

  @override
  List<Object> get props => super.props;
}

class ProductAddToCartSuccess extends ProductState{

}
