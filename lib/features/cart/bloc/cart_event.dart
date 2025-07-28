import 'package:flutter/material.dart';

@immutable
abstract class CartEvent {}

class AddItemToCart extends CartEvent {
  final Map<String, dynamic> product;
  AddItemToCart(this.product);
}

class RemoveItemFromCart extends CartEvent {
  final Map<String, dynamic> product;
  RemoveItemFromCart(this.product);
}

class ClearCart extends CartEvent {}
