import '../data/cart_item.dart';
import '../data/product.dart';

class CartState {
  final cartList = <CartItem>[];
  double get totalPrice {
    double total = 0;
    for (CartItem cartItem in cartList) {
      total += cartItem.subTotal;
    }
    return total;
  }

  void addToCart(Product p, [int number = 1]) {
    var productExisted = false;
    for (CartItem cartItem in cartList) {
      if (cartItem.product.id == p.id) {
        cartItem.quantity += number;
        productExisted = true;
        break;
      }
    }
    if (!productExisted) {
      cartList.add(CartItem(product: p));
    }
  }

  void changeProductNumber(int cartId, int productNumber) {
    for (CartItem cartItem in cartList) {
      if (cartItem.id == cartId) {
        cartItem.quantity += productNumber;
        break;
      }
    }
  }

  void removeCartItem(CartItem cartItem) {
    cartList.removeWhere((element) => element.id == cartItem.id);
  }
}

final cartState = CartState();
var a = cartState.cartList.length;
