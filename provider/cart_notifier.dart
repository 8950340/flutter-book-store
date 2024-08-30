import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/products_data.dart';
import 'package:flutter_application_3/models/cart_model.dart';
import 'package:flutter_application_3/screens/product_screen.dart';

class CartNotifier extends ChangeNotifier {
  List cartList = [];
  addqty(index) {
    cartList[index].productQty++;
    cartList[index].productAmount * cartList[index].productQty;
    notifyListeners();
  }

  subqty(index) {
    cartList[index].productQty--;
    if (cartList[index].productQty == 0) {
      cartList.removeAt(index);
    }
    notifyListeners();
  }

  addTocart(index) {
    var curr_item = Products_list[index];
    bool found = false;
    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].id == curr_item.p_id) {
        found = true;
        cartList[i].productQty++;
        notifyListeners();

        break;
      } else {
        found = false;
      }
    }
    if (!found) {
      print("cart is empty");
      cartList.add(CartModel(
          p_img: curr_item.p_img,
          id: curr_item.p_id,
          productName: curr_item.p_name,
          productAmount: curr_item.p_price));
      notifyListeners();
    }
  }

  //subtract the quanty of the product
}
