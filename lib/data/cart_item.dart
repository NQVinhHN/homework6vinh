import 'dart:math';

import 'package:homework6vinh/data/product.dart';

class CartItem {
  final int id;
  final Product product;
  double quantity = 1;

  double get subTotal => product.price * quantity;

  CartItem({required this.product}) : id = Random().nextInt(100);
}
