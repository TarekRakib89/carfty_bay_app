import 'package:carft_bay/data/models/wish_list_model.dart';
import 'package:carft_bay/presentation/state_holders/main_bottom_controller.dart';
import 'package:carft_bay/presentation/state_holders/wish_list_controller.dart';
import 'package:carft_bay/presentation/ui/widget/center_circular_progress_indicator.dart';
import 'package:carft_bay/presentation/ui/widget/product_wish_list_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<WistListController>().getWishList();
    });
  }

  void removeProduct(int id) {
    debugPrint("id : $id");
    Get.find<WistListController>().removeWishListProduct(id);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
          ),
          title: const Text(
            'Wishlist',
            style: TextStyle(fontSize: 18),
          ),
          elevation: 3,
        ),
        body: GetBuilder<WistListController>(builder: (wishListcontroller) {
          return wishListcontroller.inProgress
              ? const CenterCircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GridView.builder(
                    itemCount:
                        wishListcontroller.wishListModel.wishListdata?.length ??
                            0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.90,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 3),
                    itemBuilder: (context, index) {
                      WishListData product =
                          wishListcontroller.wishListModel.wishListdata![index];
                      return FittedBox(
                          child: ProductWishListCardItem(
                        product: product,
                        onTap: () {
                          debugPrint('${product.productId}');

                          removeProduct(product.productId!);
                        },
                      ));
                    },
                  ),
                );
        }),
      ),
    );
  }
}
