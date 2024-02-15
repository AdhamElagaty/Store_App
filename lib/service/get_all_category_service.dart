import 'package:store_app/helpers/api_helper.dart';

class GetAllCategoryService {
  Future<List<dynamic>> GetAllCategory() async {
    List<dynamic> categories = await Api()
        .get(url: "https://fakestoreapi.com/products/categories", token: null);
    return categories;
  }
}
