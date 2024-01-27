// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carft_bay/presentation/state_holders/product_controller.dart';
import 'package:carft_bay/presentation/ui/widget/center_circular_progress_indicator.dart';
import 'package:carft_bay/presentation/ui/widget/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({
    Key? key,
    this.category,
    this.categoryId,
  }) : super(key: key);

  final String? category;
  final int? categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.categoryId != null) {
      Get.find<ProductController>()
          .getProductList(categoryId: widget.categoryId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category ?? 'Products'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: GetBuilder<ProductController>(builder: (productController) {
          return Visibility(
            visible: productController.inProgress == false,
            replacement: const CenterCircularProgressIndicator(),
            child: Visibility(
              visible:
                  productController.productListModel.productList?.isNotEmpty ??
                      false,
              replacement: const Center(
                child: Text('No Product'),
              ),
              child: GridView.builder(
                  itemCount:
                      productController.productListModel.productList?.length ??
                          0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.90,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return FittedBox(
                      child: ProductCardItem(
                          product: productController
                              .productListModel.productList![index]),
                    );
                  }),
            ),
          );
        }),
      ),
    );
  }
}
