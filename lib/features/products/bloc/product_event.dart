import 'package:flutter/foundation.dart';

@immutable
abstract class ProductEvent {}

class FetchAllProducts extends ProductEvent {}

// --- ADD THIS NEW EVENT ---
class FilterProductsByCategory extends ProductEvent {
  final String category;
  FilterProductsByCategory(this.category);
}

class SearchProducts extends ProductEvent {
  final String query;
  SearchProducts(this.query);
}
