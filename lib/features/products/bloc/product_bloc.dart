import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shopper_app/features/products/bloc/product_event.dart';
import 'package:shopper_app/features/products/bloc/product_state.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    // Handler for fetching all products
    on<FetchAllProducts>((event, emit) async {
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

    // --- ADD THIS NEW HANDLER FOR FILTERING ---
    on<FilterProductsByCategory>((event, emit) async {
      emit(ProductLoading());
      try {
        // Use the API endpoint for categories
        final response = await http.get(
          Uri.parse(
            'https://fakestoreapi.com/products/category/${event.category.toLowerCase()}',
          ),
        );
        if (response.statusCode == 200) {
          final products = jsonDecode(response.body);
          emit(ProductSuccess(products));
        } else {
          emit(ProductFailure('Failed to fetch products for this category.'));
        }
      } catch (e) {
        emit(ProductFailure(e.toString()));
      }
    });

    on<SearchProducts>((event, emit) async {
      // If the search query is empty, just fetch all products.
      if (event.query.isEmpty) {
        add(FetchAllProducts());
        return;
      }

      emit(ProductLoading());
      try {
        final response = await http.get(
          Uri.parse('https://fakestoreapi.com/products'),
        );
        if (response.statusCode == 200) {
          final List<dynamic> allProducts = jsonDecode(response.body);
          // Filter the products locally
          final filteredProducts = allProducts.where((product) {
            return product['title'].toString().toLowerCase().contains(
              event.query.toLowerCase(),
            );
          }).toList();
          emit(ProductSuccess(filteredProducts));
        } else {
          emit(ProductFailure('Failed to fetch products.'));
        }
      } catch (e) {
        emit(ProductFailure(e.toString()));
      }
    }, transformer: restartable()); // <-- USE THE RESTARTABLE TRANSFORMER
  }
}
