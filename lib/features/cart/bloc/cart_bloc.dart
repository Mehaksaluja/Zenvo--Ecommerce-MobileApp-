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
      _cartItems.removeWhere((item) => item['id'] == event.product['id']);

      emit(CartUpdated(List.from(_cartItems)));
    });
    on<ClearCart>((event, emit) {
      _cartItems.clear();
      emit(CartUpdated(List.from(_cartItems)));
    });
  }
}
