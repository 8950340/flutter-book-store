import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/products_data.dart';

class ProductNotifier extends ChangeNotifier {
  List temp = [...Products_list];

  searchItem(String value) {
    if (value.isNotEmpty) {
      temp.forEach((Element) {
        
        if (!Element.p_name.toLowerCase().contains(value.toLowerCase())) {}
      });
    }
  }
}
