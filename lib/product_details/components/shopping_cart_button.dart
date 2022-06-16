import 'package:flutter/material.dart';

class ShoppingCartButton extends StatelessWidget {
  const ShoppingCartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            child: const Icon(Icons.shopping_cart)),
        Positioned(
          top: 1,
          right: 0,
          child: Container(
            width: 10,
            height: 10,
            alignment: Alignment.center,
            // color: Colors.red,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              '0',
              style: TextStyle(fontSize: 7.5),
            ),
          ),
        ),
      ],
    );
  }
}
