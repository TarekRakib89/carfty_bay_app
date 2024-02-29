import 'package:carft_bay/data/models/product_review.dart';
import 'package:carft_bay/data/models/response_data.dart';
import 'package:carft_bay/data/services/network_caller.dart';
import 'package:carft_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ReviewListController extends GetxController {
  bool _getReviewInProgress = false;
  ReviewListModel _reviewData = ReviewListModel();
  String _message = "";

  bool get getReviewListInProgress => _getReviewInProgress;
  ReviewListModel get reviewData => _reviewData;
  String get message => _message;

  Future<bool> getReview(int id) async {
    _getReviewInProgress = true;
    update();
    final ResponseData response =
        await NetWorkCaller().getRequest(Urls.listReviewById(id));
    _getReviewInProgress = false;
    if (response.isSuccess && response.statusCode == 200) {
      _reviewData = ReviewListModel.fromJson(response.responseData ?? {});
      update();
      return true;
    } else {
      _message = "review show failed";
      update();
      return false;
    }
  }
}
