import 'package:carft_bay/data/models/cart_item.dart';
import 'package:carft_bay/presentation/state_holders/cart_list_controller.dart';
import 'package:carft_bay/presentation/state_holders/main_bottom_controller.dart';
import 'package:carft_bay/presentation/ui/screen/checkout_screen.dart';
import 'package:carft_bay/presentation/ui/utilty/app_colors.dart';
import 'package:carft_bay/presentation/ui/widget/cart/cart_product_item.dart';
import 'package:carft_bay/presentation/ui/widget/center_circular_progress_indicator.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  CartListController cartListController = Get.find<CartListController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CartListController>().getCartList();
    });
  }

  void deleteCartListByProduct(int id) {
    debugPrint('id is $id');
    cartListController.deleteCartListByProduct(id);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Carts'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: GetBuilder<CartListController>(builder: (cartListController) {
          if (cartListController.inProgress == true) {
            return const CenterCircularProgressIndicator();
          }
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount:
                      cartListController.cartListModel.cartItemList?.length ??
                          0,
                  itemBuilder: (context, index) {
                    CartItem cartItem =
                        cartListController.cartListModel.cartItemList![index];
                    return CartProductItem(
                        cartItem: cartListController
                            .cartListModel.cartItemList![index],
                        onTap: () {
                          deleteCartListByProduct(cartItem.productId!);
                        });
                  },
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 8,
                  ),
                ),
              ),
              totalPriceAndCheckOutSection(cartListController.totalPrice)
            ],
          );
        }),
      ),
    );
  }

  Container totalPriceAndCheckOutSection(RxDouble totalPrice) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.15),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Price',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45),
              ),
              Obx(() => Text(
                    '৳$totalPrice',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  )),
            ],
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const CheckoutScreen());
              },
              child: const Text('Check out'),
            ),
          ),
        ],
      ),
    );
  }
}
