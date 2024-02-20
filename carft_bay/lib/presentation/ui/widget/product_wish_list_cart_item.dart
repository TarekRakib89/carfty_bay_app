// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:carft_bay/data/models/wish_list_model.dart';
import 'package:carft_bay/presentation/state_holders/wish_list_controller.dart';
import 'package:carft_bay/presentation/ui/screen/product_details_screen.dart';
import 'package:carft_bay/presentation/ui/utilty/app_colors.dart';

class ProductWishListCardItem extends StatelessWidget {
  const ProductWishListCardItem({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  final WishListData product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailsScreen(
              productId: product.productId!,
            ));
      },
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 190,
        width: 160,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  product.product?.image ?? '',
                  width: 160,
                  height: 120,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.product?.title ?? '',
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Row(
                      children: [
                        Text(
                          '৳${product.product?.price ?? 0}',
                          style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.amber,
                            ),
                            Text(
                              '${product.product?.star ?? 0}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Card(
                          color: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.favorite_outline_rounded,
                              size: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: const Icon(Icons.delete),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
