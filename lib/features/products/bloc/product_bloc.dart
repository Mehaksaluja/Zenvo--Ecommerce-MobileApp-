import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shopper_app/features/products/bloc/product_event.dart';
import 'package:shopper_app/features/products/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final response = await http.get(
          Uri.parse('https://fakestoreapi.com/products'),
        );
        if (response.statusCode == 200) {
          final products = jsonDecode(response.body);
          emit(ProductSuccess(products));
        } else {
          emit(ProductFailure('Failed to fetch products.'));
        }
      } catch (e) {
        emit(ProductFailure(e.toString()));
      }
    });
  }
}
