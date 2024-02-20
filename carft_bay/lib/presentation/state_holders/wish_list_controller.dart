import 'package:carft_bay/data/models/wish_list_model.dart';
import 'package:carft_bay/data/services/network_caller.dart';
import 'package:carft_bay/data/utility/urls.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class WistListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  WishListModel _wishListModel = WishListModel();

  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;
  WishListModel get wishListModel => _wishListModel;

  Future<bool> getWishList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetWorkCaller().getRequest(Urls.wishList);
    if (response.isSuccess) {
      _wishListModel = WishListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<void> removeWishListProduct(int productId) async {
    try {
      final response =
          await NetWorkCaller().getRequest(Urls.removeProduct(productId));
      if (response.isSuccess) {
        getWishList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
