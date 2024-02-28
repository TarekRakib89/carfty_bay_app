import 'package:carft_bay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:carft_bay/presentation/state_holders/verify_otp_controler.dart';
import 'package:carft_bay/presentation/ui/screen/auth/comlete_profile_screen.dart';
import 'package:carft_bay/presentation/ui/screen/main_bottom_nav_screen.dart';
import 'package:carft_bay/presentation/ui/utilty/app_colors.dart';
import 'package:carft_bay/presentation/ui/widget/app_logo.dart';
import 'package:carft_bay/presentation/ui/widget/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key, required this.email});

  final String email;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  VerifyOTPController verifyOTPController = Get.find<VerifyOTPController>();
  SendEmailOtpController emailController = Get.find<SendEmailOtpController>();

  @override
  void initState() {
    super.initState();
    verifyOTPController.startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                const AppLogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'A 4 digit OTP code has been sent',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  controller: _otpTEController,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.transparent,
                      inactiveFillColor: Colors.transparent,
                      inactiveColor: AppColors.primaryColor,
                      selectedFillColor: Colors.transparent,
                      selectedColor: Colors.purple),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<VerifyOTPController>(
                      builder: (verifyOtpController) {
                    return Visibility(
                      visible: verifyOtpController.inProgress == false,
                      replacement: const CenterCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate() &&
                              verifyOTPController.remainingSeconds.value > 0) {
                            final bool response = await verifyOtpController
                                .verifyOTP(widget.email, _otpTEController.text);
                            if (response) {
                              if (verifyOtpController
                                  .shouldNavigateCompleteProfile) {
                                Get.to(() => const CompletedProfileScreen());
                              } else {
                                Get.offAll(() => const MainBottomNavScreen());
                              }
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                title: 'OTP verification failed',
                                message: verifyOtpController.errorMessage,
                                duration: const Duration(seconds: 2),
                                isDismissible: true,
                              ));
                            }
                          }
                          if (verifyOTPController.remainingSeconds.value == 0) {
                            Get.showSnackbar(const GetSnackBar(
                              title: 'code expaired',
                              message: "code is expaired",
                              duration: Duration(seconds: 2),
                              isDismissible: true,
                            ));
                          }
                        },
                        child: const Text('Next'),
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 24,
                ),
                Obx(
                  () => RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                      children: [
                        const TextSpan(text: 'This code will expire '),
                        TextSpan(
                          text: verifyOTPController.remainingSeconds.value
                              .toString(),
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final bool result =
                        await emailController.sendOtpToEmail(widget.email);
                    if (!result) {
                      Get.showSnackbar(GetSnackBar(
                        title: 'Send OTP failed',
                        message: emailController.errorMessage,
                        duration: const Duration(seconds: 2),
                        isDismissible: true,
                      ));
                    }
                    {
                      verifyOTPController.startCountdown();
                    }
                  },
                  child: const Text(
                    'Resend Code',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
