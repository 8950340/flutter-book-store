import 'package:flutter/material.dart';
import 'package:flutter_application_3/provider/cart_notifier.dart';
import 'package:flutter_application_3/screens/product_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<CartNotifier>(create: (_) => CartNotifier())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductScreen(),
      ),
      )
      );
}
