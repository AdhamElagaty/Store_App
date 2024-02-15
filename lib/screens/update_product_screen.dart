import 'package:flutter/material.dart';
import 'package:store_app/helpers/show_snack_bar.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/service/update_product_service.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductScreen extends StatelessWidget {
  const UpdateProductScreen({super.key});

  static String id = "UpdateProductScreen";

  @override
  Widget build(BuildContext context) {
    String? title;
    String? description;
    String? price;
    ProductModel oldProductModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Update Product",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              oldProductModel.image,
              height: 120,
              width: 120,
            ),
            CustomTextField(
              hintText: "Enter Product Title",
              labelText: "Title",
              prefixText: oldProductModel.title,
              getData: (data) {
                title = data;
              },
            ),
            CustomTextField(
              hintText: "Enter Product Description",
              labelText: "Description",
              prefixText: oldProductModel.description,
              getData: (data) {
                description = data;
              },
            ),
            CustomTextField(
              hintText: "Enter Product Price",
              labelText: "Price",
              prefixText: oldProductModel.price,
              getData: (data) {
                price = data;
              },
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  ProductModel newProductModel = ProductModel(
                    id: oldProductModel.id,
                    title: title == null
                        ? oldProductModel.title
                        : (title!.trim().isEmpty
                            ? oldProductModel.title
                            : title!),
                    price: price == null
                        ? oldProductModel.price
                        : (price!.trim().isEmpty
                            ? oldProductModel.price
                            : price!),
                    description: description == null
                        ? oldProductModel.description
                        : (description!.trim().isEmpty
                            ? oldProductModel.description
                            : description!),
                    category: oldProductModel.category,
                    image: oldProductModel.image,
                    ratingModel: oldProductModel.ratingModel,
                  );
                  title = null;
                  try {
                    await UpdateProductService()
                        .updateProduct(productModel: newProductModel);
                    showSnackBar(context, "Succsses!");
                  } catch (e) {
                    showSnackBar(context, "Error!");
                  }
                },
                child: const Text(
                  "Update",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
