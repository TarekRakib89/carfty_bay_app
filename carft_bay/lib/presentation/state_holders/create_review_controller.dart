import 'package:carft_bay/data/models/response_data.dart';
import 'package:carft_bay/data/services/network_caller.dart';
import 'package:carft_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class CreateReviewController extends GetxController {
  bool _createReviewInProgress = false;
  String _message = '';

  bool get createReviewInProgress => _createReviewInProgress;
  String get message => _message;

  Future<bool> createReview(
      String description, int product_id, double rating) async {
    _createReviewInProgress = true;
    Map<String, dynamic> data = {
      "description": description,
      "product_id": product_id,
      "rating": rating,
    };
    update();
    final ResponseData response = await NetWorkCaller().postRequest(
      Urls.createReview,
      body: data,
    );

    _createReviewInProgress = false;
    update();
    if (response.isSuccess && response.statusCode == 200) {
      return true;
    } else {
      _message = "profile update failed!";
      return false;
    }
  }
}
