import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopper_app/features/checkout/bloc/checkout_event.dart';
import 'package:shopper_app/features/checkout/bloc/checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutInitial()) {
    on<PlaceOrder>((event, emit) async {
      emit(CheckoutLoading());
      await Future.delayed(const Duration(seconds: 3));
      emit(CheckoutSuccess());
    });
  }
}
