import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper_app/features/cart/bloc/cart_event.dart';
import 'package:shopper_app/features/cart/bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final List<Map<String, dynamic>> _cartItems = [];

  CartBloc() : super(CartInitial()) {
    on<AddItemToCart>((event, emit) {
      _cartItems.add(event.product);

      emit(CartUpdated(List.from(_cartItems)));
    });
    on<RemoveItemFromCart>((event, emit) {
      // Find and remove the product by its unique ID.
      _cartItems.removeWhere((item) => item['id'] == event.product['id']);

      // Emit the updated state with a copy of the new list.
      emit(CartUpdated(List.from(_cartItems)));
    });
  }
}
