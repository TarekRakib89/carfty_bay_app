import 'package:carft_bay/data/models/product_model.dart';

class WishListModel {
  String? msg;
  List<WishListData>? wishListdata;

  WishListModel({this.msg, this.wishListdata});

  WishListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      wishListdata = <WishListData>[];
      json['data'].forEach((v) {
        wishListdata!.add(WishListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (wishListdata != null) {
      data['data'] = wishListdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WishListData {
  int? id;
  int? productId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;

  WishListData(
      {this.id,
      this.productId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.product});

  WishListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}
