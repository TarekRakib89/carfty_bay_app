// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:carft_bay/data/models/banner_item.dart';
import 'package:carft_bay/presentation/ui/utilty/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({
    Key? key,
    this.height,
    required this.bannerList,
  }) : super(key: key);
  final double? height;
  final List<BannerItem> bannerList;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.bannerList.map((banner) {
            return Builder(builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 1.0),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                        image: NetworkImage(banner.image ?? ''))),
                alignment: Alignment.center,
              );
            });
          }).toList(),
          options: CarouselOptions(
            height: widget.height ?? 180.0,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
            viewportFraction: 1,
          ),
        )
      ],
    );
  }
}
