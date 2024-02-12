import 'package:carft_bay/data/models/payment_method_list_model.dart';
import 'package:carft_bay/data/services/network_caller.dart';
import 'package:carft_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class CreateInvoiceController extends GetxController {
  bool _inProgress = true;
  PaymentMethodListModel _paymentMethodListModel = PaymentMethodListModel();
  String _errorMessage = '';

  bool get inProgress => _inProgress;
  PaymentMethodListModel get paymentMethodListModel => _paymentMethodListModel;
  String get errorMessage => _errorMessage;

  Future<bool> createInVoice() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final response = await NetWorkCaller().getRequest(Urls.createInVoice);

    if (response.isSuccess) {
      _paymentMethodListModel =
          PaymentMethodListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
