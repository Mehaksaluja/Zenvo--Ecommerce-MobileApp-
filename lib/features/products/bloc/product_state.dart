import 'package:flutter/foundation.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<dynamic> products;
  ProductSuccess(this.products);
}

class ProductFailure extends ProductState {
  final String message;
  ProductFailure(this.message);
}
