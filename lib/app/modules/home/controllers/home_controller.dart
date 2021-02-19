import 'package:d_r_o_health/app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 1.obs;
  final value = "".obs;
  RxBool visible = false.obs;
  RxBool visiblebag = false.obs;
  RxInt total = 0.obs;
  TextEditingController searchQuery = new TextEditingController();
  List searchList = <ProductModel>[];
  RxList bagList = <ProductModel>[].obs;

  RxList<ProductModel> list = <ProductModel>[
    ProductModel(
        name: "Kenzitil Susp.",
        image: "assets/images/p2.png",
        manufacturer: "Cefuroxime Axetil",
        price: 1820.obs,
        details: "Oral Suspension- 125mg",
        quantity: 1.obs),
    ProductModel(
        name: "Kenzitil",
        image: "assets/images/p3.png",
        manufacturer: "Cefuroxime Axetil",
        price: 1540.obs,
        quantity: 1.obs,
        details: "Tablet- 250mg"),
    ProductModel(
        name: "Garlic Oil",
        image: "assets/images/p4.png",
        manufacturer: "Garlic Oil",
        price: 385.obs,
        quantity: 1.obs,
        details: "Soft Gel- 650mg"),
    ProductModel(
        name: "Folic Acid (100)",
        image: "assets/images/p5.png",
        manufacturer: "Folic Acid",
        price: 170.obs,
        quantity: 1.obs,
        details: "Tablet- 5mg"),
    ProductModel(
        name: "Folic Acid",
        image: "assets/images/p6.png",
        manufacturer: "Folic Acid",
        price: 170.obs,
        quantity: 1.obs,
        details: "Tablet- 5mg"),
    ProductModel(
        name: "Evening Pv",
        image: "assets/images/p1.png",
        manufacturer: "Evening Pv",
        price: 700.obs,
        quantity: 1.obs,
        details: "Tablet- 5mg"),
  ].obs;
  @override
  void onInit() {
    buildSearchList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  int getTotal() {
    for (var price in bagList.toList()) {
      total.value = total.value + (price.price.value * price.quantity.value);
      return total.value;
    }
    return null;
  }

  List<ProductModel> buildSearchList() {
    if (searchQuery.toString().isEmpty) {
      return searchList =
          list.toList(); //_list.map((contact) =>  Uiitem(contact)).toList();
    } else {
      /*for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }*/

      searchList = list
          .where((element) =>
              element.name
                  .toLowerCase()
                  .contains(searchQuery.toString().toLowerCase()) ||
              element.manufacturer
                  .toLowerCase()
                  .contains(searchQuery.toString().toLowerCase()))
          .toList();
      print('${searchList.length}');
      return searchList; //_searchList.map((contact) =>  Uiitem(contact)).toList();
    }
  }

  void increment() => count.value++;
  void addProduct() {}
}
