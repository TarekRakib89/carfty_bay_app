import 'package:carft_bay/data/models/create_profile_params.dart';
import 'package:carft_bay/data/models/profile.dart';
import 'package:carft_bay/data/services/network_caller.dart';
import 'package:carft_bay/data/utility/urls.dart';
import 'package:carft_bay/presentation/state_holders/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Profile _profile = Profile();

  Profile get profile => _profile;

  Future<bool> createProfileData(
      String token, CreateProfileParams params) async {
    _inProgress = true;
    debugPrint("token is $token");
    update();
    final response = await NetWorkCaller()
        .postRequest(Urls.createProfile, token: token, body: params.toJson());
    _inProgress = false;
    if (response.isSuccess) {
      _profile = Profile.fromJson(response.responseData['data']);
      await Get.find<AuthController>().saveUserDetails(token, _profile);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
