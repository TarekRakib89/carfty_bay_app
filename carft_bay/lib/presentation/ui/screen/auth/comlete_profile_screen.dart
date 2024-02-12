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
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _cityTECController = TextEditingController();
  final TextEditingController _stateTEContorller = TextEditingController();
  final TextEditingController _postcodeTEController = TextEditingController();
  final TextEditingController _countryTEController = TextEditingController();
  final TextEditingController _phoneNTEController = TextEditingController();
  final TextEditingController _faxTECController = TextEditingController();
  final TextEditingController _shippingNTEContorller = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final TextEditingController _shippingCityTEController =
      TextEditingController();
  final TextEditingController _shippingStateTEController =
      TextEditingController();
  final TextEditingController _shippingPostCodeTECController =
      TextEditingController();
  final TextEditingController _shippingCountryTEContorller =
      TextEditingController();
  final TextEditingController _shippingNumberContorller =
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
                  controller: _nameTEController,
                  decoration: const InputDecoration(hintText: 'Name'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),

                TextFormField(
                  controller: _addressTEController,
                  decoration: const InputDecoration(hintText: "Address"),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Address';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  controller: _cityTECController,
                  decoration: const InputDecoration(hintText: "City name"),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your city';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  controller: _stateTEContorller,
                  decoration: const InputDecoration(hintText: "State"),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your state';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  controller: _postcodeTEController,
                  decoration: const InputDecoration(hintText: "Post Code"),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Post Code';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  controller: _countryTEController,
                  decoration: const InputDecoration(hintText: "Country name"),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Country name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  controller: _phoneNTEController,
                  decoration: const InputDecoration(hintText: "phone number"),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Phone Number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),

                TextFormField(
                  controller: _faxTECController,
                  decoration: const InputDecoration(hintText: "Fax number"),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Fax number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  controller: _shippingNTEContorller,
                  decoration: const InputDecoration(hintText: "Shipping Name"),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Shipping Name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  controller: _shippingAddressTEController,
                  decoration:
                      const InputDecoration(hintText: 'Shipping adress'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your shipping address';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  controller: _shippingCityTEController,
                  maxLines: 4,
                  decoration: const InputDecoration(hintText: 'Shipping City'),
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your shipping city';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  controller: _shippingStateTEController,
                  maxLines: 4,
                  decoration: const InputDecoration(hintText: 'Shipping State'),
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter shipping state';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  controller: _shippingPostCodeTECController,
                  maxLines: 4,
                  decoration:
                      const InputDecoration(hintText: 'Shipping post code'),
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your post code';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  controller: _shippingCountryTEContorller,
                  maxLines: 4,
                  decoration:
                      const InputDecoration(hintText: 'Shipping Country'),
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your shpping country';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _shippingNumberContorller,
                  maxLines: 4,
                  decoration:
                      const InputDecoration(hintText: 'Shipping phone number'),
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your shpping number';
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
                              cusName: _nameTEController.text.trim(),
                              cusAdd: _addressTEController.text.trim(),
                              cusCity: _cityTECController.text.trim(),
                              cusState: _stateTEContorller.text.trim(),
                              cusCountry: _countryTEController.text.trim(),
                              cusPhone: _phoneNTEController.text.trim(),
                              cusFax: _faxTECController.text.trim(),
                              shipName: _shippingNTEContorller.text.trim(),
                              shipAdd: _shippingAddressTEController.text.trim(),
                              shipCity: _shippingCityTEController.text.trim(),
                              shipState: _shippingStateTEController.text.trim(),
                              shipPostcode:
                                  _shippingPostCodeTECController.text.trim(),
                              shipCountry:
                                  _shippingCountryTEContorller.text.trim(),
                              shipPhone: _shippingNumberContorller.text.trim(),
                            );
                            final bool result = await completeProfileController
                                .createProfileData(
                              Get.find<VerifyOTPController>().token,
                              createProfileParams,
                            );
                            debugPrint(
                                'c token${Get.find<VerifyOTPController>().token}');
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
    _nameTEController.dispose();
    _addressTEController.dispose();
    _cityTECController.dispose();
    _stateTEContorller.dispose();
    _postcodeTEController.dispose();
    _countryTEController.dispose();
    _phoneNTEController.dispose();
    _faxTECController.dispose();
    _shippingNTEContorller.dispose();
    _shippingAddressTEController.dispose();
    _shippingCityTEController.dispose();
    _shippingStateTEController.dispose();
    _shippingPostCodeTECController.dispose();
    _shippingCountryTEContorller.dispose();
    _shippingNumberContorller.dispose();

    super.dispose();
  }
}
