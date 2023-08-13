import 'package:flutter/widgets.dart';

const defaultScrollPhisics = BouncingScrollPhysics();

extension PriceLabel on int{
  String get withPriceLabel => '$this تومان';
}