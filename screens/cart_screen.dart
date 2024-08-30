import 'package:flutter/material.dart';

import 'package:flutter_application_3/provider/cart_notifier.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<CartNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Manhwa Cart"),
      ),
      body: ListView.builder(
        itemCount: obj.cartList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                Column(
                  children: [
                    Image.network(
                      obj.cartList[index].p_img,
                      width:MediaQuery.sizeOf(context).width/2 - 100,
                    ),
                    Text(
                      obj.cartList[index].productName,
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      obj.cartList[index].productAmount.toString(),
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          obj.addqty(index);
                        },
                        
                        icon: Icon(Icons.exposure_plus_1)),
                    Text(obj.cartList[index].productQty.toString()),
                    IconButton(
                        onPressed: () {
                          obj.subqty(index);
                        },
                        
                        icon: Icon(Icons.exposure_minus_1)),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
