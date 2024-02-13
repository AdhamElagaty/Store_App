import 'package:flutter/material.dart';
import 'package:store_app/widgets/load_product_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "New Trend",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 5,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                size: 35,
              ),
            ),
          )
        ],
      ),
      body: const LoadProductList(),
    );
  }
}
