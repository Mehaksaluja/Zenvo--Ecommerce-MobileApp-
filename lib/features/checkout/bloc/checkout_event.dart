import 'package:flutter/foundation.dart';

@immutable
abstract class CheckoutEvent {}

class PlaceOrder extends CheckoutEvent {
  final List<Map<String, dynamic>> cartItems;
  final double totalPrice;
  PlaceOrder({required this.cartItems, required this.totalPrice});
}
