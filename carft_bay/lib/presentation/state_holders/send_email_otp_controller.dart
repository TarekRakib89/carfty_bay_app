import 'package:carft_bay/data/models/response_data.dart';
import 'package:carft_bay/data/services/network_caller.dart';
import 'package:carft_bay/data/utility/urls.dart';
import 'package:carft_bay/presentation/state_holders/verify_otp_controler.dart';
import 'package:carft_bay/presentation/ui/screen/auth/verify_otp_screen.dart';
import 'package:get/get.dart';

class SendEmailOtpController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<bool> sendOtpToEmail(String email) async {
    _inProgress = true;

    update();

    final ResponseData response =
        await NetWorkCaller().getRequest(Urls.sentEmailOtp(email));
    _inProgress = false;

    if (response.isSuccess) {
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
