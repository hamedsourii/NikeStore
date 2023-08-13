part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final AppExeption exeption;

  const HomeError({required this.exeption});

  @override
  List<Object> get props => [exeption];
}

class HomeSuccess extends HomeState{
  final List<BannerEntity> banners;
  final List<ProductEntity> latestProducts;
  final List<ProductEntity> popularProducts;

  const HomeSuccess(this.banners, this.latestProducts, this.popularProducts);
  
}