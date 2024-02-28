import 'dart:async';

import 'package:carft_bay/data/services/network_caller.dart';
import 'package:carft_bay/data/utility/urls.dart';
import 'package:carft_bay/presentation/state_holders/auth_controller.dart';
import 'package:carft_bay/presentation/state_holders/read_profile_data_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class VerifyOTPController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  bool _shouldNavigateCompleteProfile = true;
  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;
  String _token = '';
  String get token => _token;

  Timer? _timer;
  final RxInt _remainingSeconds = 120.obs;
  RxInt get remainingSeconds => _remainingSeconds;

  Future<bool> verifyOTP(String email, String otp) async {
    _inProgress = true;
    update();
    final response =
        await NetWorkCaller().getRequest(Urls.verifyOtp(email, otp));
    _inProgress = false;
    debugPrint('what is ${response.isSuccess}');
    if (response.isSuccess) {
      _token = response.responseData['data'];

      await Future.delayed(const Duration(seconds: 3));
      final result =
          await Get.find<ReadProfileDataController>().readProfileData(token);

      debugPrint('result is $result');
      if (result) {
        _shouldNavigateCompleteProfile =
            Get.find<ReadProfileDataController>().isProfileCompleted == false;
        if (_shouldNavigateCompleteProfile == false) {
          await Get.find<AuthController>().saveUserDetails(
              token, Get.find<ReadProfileDataController>().profile);
        }
      } else {
        _errorMessage = Get.find<ReadProfileDataController>().errorMessage;
        update();
        return false;
      }
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }

  void startCountdown() {
    _remainingSeconds.value = 120;
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      if (_remainingSeconds.value == 0) {
        timer.cancel();
        update();
      } else {
        _remainingSeconds.value--;
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
