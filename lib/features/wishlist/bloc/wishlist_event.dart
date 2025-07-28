import 'package:flutter/foundation.dart';

@immutable
abstract class WishlistEvent {}

class AddToWishlist extends WishlistEvent {
  final Map<String, dynamic> product;

  AddToWishlist(this.product);
}

class RemoveFromWishlist extends WishlistEvent {
  final Map<String, dynamic> product;

  RemoveFromWishlist(this.product);
}
