import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/product_details_screen.dart';
import 'package:store_app/screens/update_product_screen.dart';

class CustomProductBox extends StatefulWidget {
  const CustomProductBox({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  State<CustomProductBox> createState() => _CustomProductBoxState();
}

class _CustomProductBoxState extends State<CustomProductBox> {
  Color favStateColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.id,
            arguments: widget.productModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 60,
                  color: Color.fromARGB(51, 158, 158, 158),
                  offset: Offset(0, 20),
                ),
              ],
            ),
            child: Card(
              color: Colors.white,
              elevation: 7,
              surfaceTintColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 8,
                  top: 45,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productModel.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 167, 167, 167),
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "\$ ${widget.productModel.price}",
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 45,
                        alignment: Alignment.center,
                        child: SizedBox(
                          child: IconButton(
                            onPressed: () {
                              if (favStateColor == Colors.black) {
                                setState(() {
                                  favStateColor = Colors.red;
                                });
                              } else {
                                setState(() {
                                  favStateColor = Colors.black;
                                });
                              }
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: favStateColor,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -75,
            left: 55,
            child: Hero(
              tag: widget.productModel,
              child: Image.network(
                widget.productModel.image,
                height: 120,
                width: 110,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
