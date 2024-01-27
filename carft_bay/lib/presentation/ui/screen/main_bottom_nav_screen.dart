import 'package:carft_bay/presentation/state_holders/category_controller.dart';
import 'package:carft_bay/presentation/state_holders/home_banner_controller.dart';
import 'package:carft_bay/presentation/state_holders/popular_product_controller.dart';
import 'package:carft_bay/presentation/ui/screen/cart_screen.dart';
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
  int _selectedIndex = 0;
  final List<Widget> _screen = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishListScreen(),
  ];
  void updatedIndex(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Get.find<HomeBannerController>().getBannerList();
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<CategoryController>().getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: updatedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Carts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined), label: 'Wishlisht'),
        ],
      ),
    );
  }
}
