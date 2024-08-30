import 'package:flutter/material.dart';

import 'package:flutter_application_3/data/products_data.dart';
import 'package:flutter_application_3/provider/cart_notifier.dart';
import 'package:flutter_application_3/provider/product_notifier.dart';
import 'package:flutter_application_3/screens/cart_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<CartNotifier>(context);
    var obj1 = Provider.of<ProductNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.electric_bolt_rounded,
            size: 50,
          ),
          title: Text(
            "Manhwa Store",
            style: GoogleFonts.aboreto(
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => CartScreen()));
              },
              icon: Icon(
                Icons.shopping_cart,
                size: 40,
              ),
            ),
          ],
        ),
        body: Container(
            child: ListView.builder(
                itemCount: Products_list.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        Products_list[index].p_img,
                        width: MediaQuery.sizeOf(context).width / 2 - 100,
                      ),
                      Expanded(
                          child: Column(
                        // mainAxisAlignment:MainAlignment.center
                        children: [
                          Text(
                            "${Products_list[index].p_name}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("${Products_list[index].p_price}"),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              obj.addTocart(index);
                            },
                            icon: Icon(Icons.add_shopping_cart),
                            label: Text("Add To Cart"),
                          )
                        ],
                      ))
                    ],
                  ));
                })));
  }
}
