import 'package:get/get.dart';

class ProductModel {
  final String name;
  final String image;
  final RxInt price;
  final String manufacturer;
  final String details;
  final RxInt quantity;
  ProductModel(
      {this.name,
      this.image,
      this.details,
      this.manufacturer,
      this.price,
      this.quantity});
}
