import 'package:carft_bay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:carft_bay/presentation/ui/screen/auth/verify_otp_screen.dart';
import 'package:carft_bay/presentation/ui/widget/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.sp),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 160.h,
                ),
                AppLogo(
                  height: 80.h,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'Please enter your email address',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  controller: _emailTEController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                GetBuilder<SendEmailOtpController>(builder: (controller) {
                  return SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: controller.inProgress == false,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final bool result = await controller
                                .sendOtpToEmail(_emailTEController.text.trim());
                            if (result) {
                              Get.to(
                                () => VerifyOTPScreen(
                                  email: _emailTEController.text.trim(),
                                ),
                              );
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                title: 'Send OTP failed',
                                message: controller.errorMessage,
                                duration: const Duration(seconds: 2),
                                isDismissible: true,
                              ));
                            }
                          }
                        },
                        child: const Text("Next"),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
