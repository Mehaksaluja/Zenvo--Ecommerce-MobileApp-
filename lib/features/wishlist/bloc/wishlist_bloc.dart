import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper_app/features/wishlist/bloc/wishlist_event.dart';
import 'package:shopper_app/features/wishlist/bloc/wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final List<Map<String, dynamic>> _wishlistItems = [];

  WishlistBloc() : super(WishlistInitial()) {
    on<AddToWishlist>((event, emit) {
      _wishlistItems.add(event.product);
      emit(WishlistUpdated(List.from(_wishlistItems)));
    });

    on<RemoveFromWishlist>((event, emit) {
      _wishlistItems.removeWhere((item) => item['id'] == event.product['id']);
      emit(WishlistUpdated(List.from(_wishlistItems)));
    });
  }
}
