import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/service/get_all_product_service.dart';
import 'package:store_app/widgets/create_product_list_widget.dart';

class LoadProductList extends StatelessWidget {
  const LoadProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> productModels = snapshot.data!;
            return CreateProductList(productModels: productModels);
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error! Try again Leter"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<ProductModel>>? getData() {
    try {
      return GetAllProductsService().getAllProducts();
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
