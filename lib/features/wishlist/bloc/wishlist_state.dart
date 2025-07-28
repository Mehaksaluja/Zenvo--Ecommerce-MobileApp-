import 'package:flutter/foundation.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistUpdated extends WishlistState {
  final List<Map<String, dynamic>> wishlistItems;

  WishlistUpdated(this.wishlistItems);
}
