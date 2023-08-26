part of 'product_list_bloc.dart';

sealed class ProductListState extends Equatable {
  const ProductListState();
  
  @override
  List<Object> get props => [];
}

final class ProductListLoading extends ProductListState {}

class ProductListSuccess extends ProductListState{
final List<ProductEntity> products;
final int sort;
final List<String> sortName;

  const ProductListSuccess(this.products, this.sort, this.sortName);

  @override
  List<Object> get props => [sort,sortName,products];
}
 
class ProductListErorr extends ProductListState{
  final AppException exception;

  const ProductListErorr(this.exception);

  @override
  List<Object> get props => [exception];
}
