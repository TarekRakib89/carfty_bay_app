import 'package:carft_bay/controller_binder.dart';
import 'package:carft_bay/presentation/ui/screen/auth/splash_screen.dart';
import 'package:carft_bay/presentation/ui/utilty/app_theme_data.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.lighthtThemeData,
        home: const SplashScreen(),
        initialBinding: ControllerBinder(),
      ),
    );
  }
}
