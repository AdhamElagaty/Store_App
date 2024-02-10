import 'package:store_app/helpers/api_helper.dart';
import 'package:store_app/models/product_model.dart';

class AddProductService {
  Future<ProductModel> AddProduct(ProductModel productModel) async {
    return ProductModel.fromJSON(await Api().Post(
        url: "https://fakestoreapi.com/products",
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
