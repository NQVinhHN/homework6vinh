import 'package:homework6vinh/data/ingredients.dart';
import 'package:homework6vinh/data/recipe.dart';

class Product {
  final String img;
  final double price;
  final int rootPrice;
  final String category;
  final String name;
  final int id;
  bool isTap;
  final List<Ingredients> ingredients;
  final List<Recipes> recipes;
  Product({
    required this.recipes,
    required this.img,
    required this.price,
    required this.rootPrice,
    required this.category,
    required this.name,
    required this.id,
    required this.isTap,
    required this.ingredients,
  });
}
