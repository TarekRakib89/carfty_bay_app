// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carft_bay/presentation/ui/screen/product_list_screen.dart';
import 'package:carft_bay/presentation/ui/utilty/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:carft_bay/data/models/category_list_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryListItem category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductListScreen(
              category: category.categoryName ?? '',
              categoryId: category.id,
            ));
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network(
                category.categoryImg ?? '',
                width: 40,
                height: 40,
              ),
            ),
          ),
          Text(
            category.categoryName ?? '',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
