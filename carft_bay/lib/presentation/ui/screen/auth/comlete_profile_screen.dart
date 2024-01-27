import 'package:carft_bay/data/models/create_profile_params.dart';
import 'package:carft_bay/presentation/state_holders/complete_profile_controller.dart';
import 'package:carft_bay/presentation/state_holders/verify_otp_controler.dart';
import 'package:carft_bay/presentation/ui/screen/main_bottom_nav_screen.dart';
import 'package:carft_bay/presentation/ui/widget/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompletedProfileScreen extends StatefulWidget {
  const CompletedProfileScreen({super.key});

  @override
  State<CompletedProfileScreen> createState() => _CompletedProfileScreenState();
}

class _CompletedProfileScreenState extends State<CompletedProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTECController = TextEditingController();
  final TextEditingController _cityTEContorller = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0.sp),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 48.h,
                ),
                // const AppLogo(
                //   height: 80,
                // ),
                // const SizedBox(
                //   height: 24,
                // ),
                Text(
                  'Complete Profile',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 28.sp),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "Get started with us with your details",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(hintText: 'First Name'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your first name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(hintText: "Last name"),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your last name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  controller: _mobileTECController,
                  decoration: const InputDecoration(hintText: "Mobile"),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter Mobile number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  controller: _cityTEContorller,
                  decoration: const InputDecoration(hintText: 'City'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your city name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  controller: _shippingAddressTEController,
                  maxLines: 4,
                  decoration:
                      const InputDecoration(hintText: 'Shipping address'),
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your shipping address';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<CompleteProfileController>(
                      builder: (completeProfileController) {
                    return Visibility(
                      visible: completeProfileController.inProgress == false,
                      replacement: const CenterCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final createProfileParams = CreateProfileParams(
                              firstName: _firstNameTEController.text.trim(),
                              lastName: _lastNameTEController.text.trim(),
                              mobile: _mobileTECController.text.trim(),
                              city: _cityTEContorller.text.trim(),
                              shippingAddress:
                                  _shippingAddressTEController.text.trim(),
                            );
                            final bool result = await completeProfileController
                                .createProfileData(
                                    Get.find<VerifyOTPController>().token,
                                    createProfileParams);
                            if (result) {
                              Get.offAll(() => const MainBottomNavScreen());
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                title: 'Complete profile failed',
                                message: completeProfileController.errorMessage,
                                duration: const Duration(seconds: 2),
                                isDismissible: true,
                              ));
                            }
                          }
                        },
                        child: const Text('Complete'),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _cityTEContorller.dispose();
    _mobileTECController.dispose();
    _shippingAddressTEController.dispose();
    super.dispose();
  }
}
