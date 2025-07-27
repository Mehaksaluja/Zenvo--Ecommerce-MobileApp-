import 'package:flutter/foundation.dart';

@immutable
abstract class ProductEvent {}

class FetchProducts extends ProductEvent {}
