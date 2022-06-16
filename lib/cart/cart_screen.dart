import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:homework6vinh/cart/cart_state.dart';
import 'package:homework6vinh/home/home_page_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartList = cartState.cartList;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Cart'),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 630,
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: List.generate(
              cartState.cartList.length,
              (index) {
                var cartItem = cartList[index];
                return Container(
                  decoration: const BoxDecoration(
                    // border: Border.all(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  height: 150,
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: SizedBox(
                            height: 150,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              child: Image(
                                fit: BoxFit.fill,
                                image: NetworkImage(productList[index].img),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Item ${productList[index].id}',
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        ),
                                        child: IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            cartState.removeCartItem(cartItem);
                                            setState(() {});
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'Price: ',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                              text:
                                                  '\$${productList[index].price}',
                                              style: const TextStyle(
                                                  color: Colors.orange))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: 'Sub Total: ',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                                text: '\$${cartItem.subTotal}',
                                                style: const TextStyle(
                                                    color: Colors.orange))
                                          ]),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Ship Free',
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        if (cartItem.quantity > 0) {
                                          cartState.changeProductNumber(
                                              cartItem.id, -1);
                                          setState(() {});
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Container(
                                        width: 20,
                                        height: 20,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text('${cartItem.quantity}')),
                                    IconButton(
                                      onPressed: () {
                                        cartState.changeProductNumber(
                                            cartItem.id, 1);
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        bottomSheet: Container(
          color: Colors.grey,
          height: 100,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  const Text('Checkout Price'),
                  const Spacer(),
                  Text('Rs. \$${cartState.totalPrice}')
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {},
                  child: const Text('Checkout',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
