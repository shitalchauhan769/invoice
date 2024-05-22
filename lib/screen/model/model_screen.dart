import 'package:flutter/material.dart';
class ProductModel {
  String? name;
  String? price;
  String? quantity;
  String? discount;
  String? image;
  int? amount;
  int? totalprice;
  ProductModel(this.name,this.price,this.quantity,this.discount,this.image,this.totalprice,this.amount);
}