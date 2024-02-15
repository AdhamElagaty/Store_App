import 'package:store_app/helpers/api_helper.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct(
      {required ProductModel productModel}) async {
    return ProductModel.fromJSONUpdate(await Api().put(
        url: "https://fakestoreapi.com/products/${productModel.id}",
        body: {
          "title": productModel.title,
          "price": productModel.price.toString(),
          "description": productModel.description,
          "image": productModel.image,
          "category": productModel.category,
        },
        token: null));
  }
}
