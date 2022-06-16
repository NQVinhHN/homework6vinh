import 'package:flutter/material.dart';

import '../../home/home_page_state.dart';
import '../product_details_screen.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProductDetail widget;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      children: List.generate(
        widget.ingredients.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      NetworkImage(productList[index].ingredients[index].img),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(productList[index].ingredients[index].nameingredients)
              ],
            ),
          );
        },
      ),
    );
  }
}
