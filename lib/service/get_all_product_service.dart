import 'package:store_app/helpers/api_helper.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProductsService {
  Future<List<ProductModel>> GetAllProducts() async {
    List<dynamic> jsonData =
        await Api().Get(url: "https://fakestoreapi.com/products", token: null);
    List<ProductModel> productsModel = [];
    for (var data in jsonData) {
      productsModel.add(ProductModel.fromJSON(data));
    }
    return productsModel;
  }
}
