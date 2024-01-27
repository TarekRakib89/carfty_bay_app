// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carft_bay/presentation/ui/screen/product_details_screen.dart';
import 'package:carft_bay/presentation/ui/utilty/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:carft_bay/data/models/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const ProductDetailsScreen());
      },
      child: SizedBox(
        height: 190.h,
        width: 160.w,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
                child: Image.network(
                  product.image ?? '',
                  width: 160.w,
                  height: 120.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title ?? '',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${product.price ?? 0}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Wrap(
                          children: [
                            Icon(
                              Icons.star,
                              size: 14.sp,
                              color: Colors.amber,
                            ),
                            Text(
                              '${product.star ?? 0}',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Card(
                          color: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r)),
                          child: Padding(
                            padding: EdgeInsets.all(2.0.sp),
                            child: Icon(
                              Icons.favorite_outline_rounded,
                              size: 10.sp,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
