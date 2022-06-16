import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework6vinh/cart/cart_state.dart';
import 'package:homework6vinh/data/product.dart';

import '../data/ingredients.dart';
import '../data/recipe.dart';
import 'components/ingredients_list.dart';
import 'components/recipes_list.dart';

class ProductDetail extends StatefulWidget {
  final String img;
  final List<Ingredients> ingredients;
  final String name;
  final List<Recipes> recipes;
  bool isTap;
  final Product product;

  ProductDetail(
      {required this.product,
      required this.img,
      required this.ingredients,
      required this.isTap,
      required this.name,
      required this.recipes});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.all(3),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(widget.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[700],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 30,
                            alignment: Alignment.center,
                            height: 30,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(
                                      () {
                                        cartState.addToCart(widget.product);
                                      },
                                    );
                                  },
                                ),
                              ),
                              Positioned(
                                top: 1,
                                right: 0,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    border: Border.all(width: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    '${cartState.cartList.length}',
                                    style: const TextStyle(
                                        fontSize: 8, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[700],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: widget.isTap
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                    ),
                              onPressed: () {
                                setState(
                                  () {
                                    widget.isTap = !widget.isTap;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Text(
                                widget.name,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Ingredients',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: SizedBox(
                          height: 110,
                          width: double.infinity,
                          child: IngredientsList(widget: widget),
                        ),
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Recipe',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 30,
                          child: RecipesList(widget: widget),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
