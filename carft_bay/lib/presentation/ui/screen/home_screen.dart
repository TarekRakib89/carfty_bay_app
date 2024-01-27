import 'package:carft_bay/data/models/product_model.dart';
import 'package:carft_bay/presentation/state_holders/category_controller.dart';
import 'package:carft_bay/presentation/state_holders/home_banner_controller.dart';
import 'package:carft_bay/presentation/state_holders/main_bottom_controller.dart';
import 'package:carft_bay/presentation/state_holders/popular_product_controller.dart';
import 'package:carft_bay/presentation/ui/screen/product_list_screen.dart';
import 'package:carft_bay/presentation/ui/utilty/assets_path.dart';
import 'package:carft_bay/presentation/ui/widget/category_item.dart';
import 'package:carft_bay/presentation/ui/widget/center_circular_progress_indicator.dart';
import 'package:carft_bay/presentation/ui/widget/home/bannaer_carousel.dart';
import 'package:carft_bay/presentation/ui/widget/home/circle_icon_button.dart';
import 'package:carft_bay/presentation/ui/widget/home/section_title.dart';
import 'package:carft_bay/presentation/ui/widget/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 8.h),
              searchTextField,
              SizedBox(height: 16.h),
              SizedBox(
                height: 150.h,
                child: GetBuilder<HomeBannerController>(
                    builder: (homeBannerController) {
                  return Visibility(
                      visible: homeBannerController.inProgress == false,
                      replacement: const CenterCircularProgressIndicator(),
                      child: BannerCarousel(
                        bannerList:
                            homeBannerController.bannerListModel.bannerList ??
                                [],
                      ));
                }),
              ),
              SizedBox(
                height: 15.h,
              ),
              SectionTitle(
                title: 'All Categories',
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().changeIndex(1);
                },
              ),
              categoryList,
              SectionTitle(
                title: 'Popular',
                onTapSeeAll: () {
                  Get.to(() => const ProductListScreen());
                },
              ),
              GetBuilder<PopularProductController>(
                  builder: (popularPorductController) {
                return Visibility(
                  visible: popularPorductController.inProgress == false,
                  replacement: const CenterCircularProgressIndicator(),
                  child: productList(
                      popularPorductController.productListModel.productList ??
                          []),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  SizedBox productList(List<ProductModel> productList) {
    return SizedBox(
      height: 180.h,
      child: ListView.separated(
        itemCount: productList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return ProductCardItem(
            product: productList[index],
          );
        }),
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  Widget get categoryList {
    return SizedBox(
      height: 100.h,
      child: GetBuilder<CategoryController>(builder: (categoryController) {
        return Visibility(
            visible: categoryController.inProgress == false,
            replacement: const CenterCircularProgressIndicator(),
            child: ListView.separated(
              itemCount:
                  categoryController.categoryListModel.categoryList?.length ??
                      0,
              // primary: false,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryItem(
                  category:
                      categoryController.categoryListModel.categoryList![index],
                );
              },
              separatorBuilder: (_, __) {
                return const SizedBox(
                  width: 8,
                );
              },
            ));
      }),
    );
  }

  TextFormField get searchTextField {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.r)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: Image.asset(AssetsPath.logoNav),
      actions: [
        CircleIconButton(
          onTap: () {},
          iconData: Icons.person,
        ),
        SizedBox(
          width: 8.w,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.call,
        ),
        SizedBox(
          width: 8.w,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.notifications_active_outlined,
        ),
      ],
    );
  }
}
