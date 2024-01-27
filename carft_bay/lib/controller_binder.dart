import 'package:carft_bay/presentation/state_holders/auth_controller.dart';
import 'package:carft_bay/presentation/state_holders/category_controller.dart';
import 'package:carft_bay/presentation/state_holders/complete_profile_controller.dart';
import 'package:carft_bay/presentation/state_holders/home_banner_controller.dart';
import 'package:carft_bay/presentation/state_holders/main_bottom_controller.dart';
import 'package:carft_bay/presentation/state_holders/popular_product_controller.dart';
import 'package:carft_bay/presentation/state_holders/product_controller.dart';
import 'package:carft_bay/presentation/state_holders/read_profile_data_controller.dart';
import 'package:carft_bay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:carft_bay/presentation/state_holders/verify_otp_controler.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(ProductController());
    Get.put(HomeBannerController());
    Get.put(PopularProductController());
    Get.put(CategoryController());
    Get.put(AuthController());
    Get.put(SendEmailOtpController());
    Get.put(VerifyOTPController());
    Get.put(ReadProfileDataController());
    Get.put(CompleteProfileController());
  }
}
