import 'package:flutter/material.dart';

import '../../home/home_page_state.dart';
import '../product_details_screen.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProductDetail widget;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: List.generate(
        widget.recipes.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 10, top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    color: Colors.black,
                    height: 20,
                    width: 20,
                    alignment: Alignment.center,
                    child: Text(
                      productList[index].recipes[index].id,
                      style: const TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                      ),
                    )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 3,
                  child: Text(productList[index].recipes[index].recipe),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
