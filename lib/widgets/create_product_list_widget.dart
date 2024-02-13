import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/custom_product_box_widget.dart';

class CreateProductList extends StatelessWidget {
  const CreateProductList({super.key, required this.productModels});

  final List<ProductModel> productModels;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        bottom: 8,
        top: 85,
      ),
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 90,
            crossAxisSpacing: 10,
            childAspectRatio: 1.7,
          ),
          itemCount: productModels.length,
          itemBuilder: (context, index) {
            return CustomProductBox(
              productModel: productModels[index],
            );
          }),
    );
  }
}
