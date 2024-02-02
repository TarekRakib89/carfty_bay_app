import 'package:carft_bay/presentation/state_holders/category_controller.dart';
import 'package:carft_bay/presentation/state_holders/home_banner_controller.dart';
import 'package:carft_bay/presentation/state_holders/main_bottom_controller.dart';
import 'package:carft_bay/presentation/state_holders/new_product_controller.dart';
import 'package:carft_bay/presentation/state_holders/popular_product_controller.dart';
import 'package:carft_bay/presentation/state_holders/spacial_product_controller.dart';
import 'package:carft_bay/presentation/ui/screen/cart_list_screen.dart';
import 'package:carft_bay/presentation/ui/screen/category_screen.dart';
import 'package:carft_bay/presentation/ui/screen/home_screen.dart';
import 'package:carft_bay/presentation/ui/screen/wish_list_screen.dart';
import 'package:carft_bay/presentation/ui/utilty/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<HomeBannerController>().getBannerList();
      Get.find<CategoryController>().getCategoryList();
      Get.find<PopularProductController>().getPopularProductList();
      Get.find<NewProductController>().getNewProductList();
      Get.find<SpecialProductController>().getSpecialProductList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (controller) {
      return Scaffold(
        body: _screens[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: controller.changeIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Carts'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outlined), label: 'Wishlist'),
          ],
        ),
      );
    });
  }
}
