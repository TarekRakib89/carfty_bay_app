import 'package:carft_bay/data/models/product_list_model.dart';
import 'package:carft_bay/data/services/network_caller.dart';
import 'package:carft_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  ProductListModel _productListModel = ProductListModel();
  ProductListModel get productListModel => _productListModel;

  Future<bool> getProductList({required int categoryId}) async {
    bool isSucces = false;
    _inProgress = true;
    update();
    final response =
        await NetWorkCaller().getRequest(Urls.productsByCategory(categoryId));
    _inProgress = false;
    if (response.isSuccess) {
      _productListModel = ProductListModel.fromJson(response.responseData);
      isSucces = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSucces;
  }
}
