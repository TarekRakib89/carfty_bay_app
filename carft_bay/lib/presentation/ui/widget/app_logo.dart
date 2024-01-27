// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

import 'package:carft_bay/presentation/ui/utilty/assets_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsPath.logo,
      width: width ?? 120,
      height: height,
    );
  }
}
