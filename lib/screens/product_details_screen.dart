import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  static String id = "ProductDetailsScreen";

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Details",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Hero(
        tag: productModel,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 190,
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    clipBehavior: Clip.none,
                    surfaceTintColor: Colors.white,
                    elevation: 7,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 80,
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productModel.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            productModel.category,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 125, 125, 125),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            productModel.description,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 125, 125, 125),
                            ),
                          ),
                          RatingBarIndicator(
                            itemSize: 32,
                            rating: double.parse(productModel.ratingModel.rate),
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "\$ ${productModel.price}",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, UpdateProductScreen.id,
                                    arguments: productModel);
                              },
                              child: const Text("Update Product"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 100,
                top: 40,
                child: Image.network(
                  productModel.image,
                  height: 220,
                  width: 220,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
