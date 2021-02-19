import 'package:d_r_o_health/app/modules/home/views/bag_view.dart';
import 'package:d_r_o_health/app/modules/home/views/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:d_r_o_health/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomSheet: Container(
          height: 50,
          decoration: BoxDecoration(
              color: Color(0xff7B4397),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Container(
                width: 35,
                child: Divider(
                  color: Colors.white,
                  height: 9,
                  thickness: 3,
                ),
              )),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white54,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Bag",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white),
                    child: Center(
                        child: GestureDetector(
                      onTap: () => Get.to(BagView()),
                      child: Text(
                        "${controller.bagList.toList().length}",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Icon(
            Icons.arrow_back,
          ),
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            '125 item(s)',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.import_export_outlined,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.black38,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    controller.visible.value == false
                        ? controller.visible.value = true
                        : controller.visible.value = false;
                    controller.buildSearchList();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.search_outlined,
                      color: Colors.black38,
                    ),
                  ),
                )
              ],
            ),
            Obx(() => Visibility(
                  visible: controller.visible.value,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.black12)),
                      child: TextFormField(
                        controller: controller.searchQuery,
                        onChanged: (value) {
                          controller.searchQuery.text = value;
                          controller.value.value = value;
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            helperStyle: TextStyle(color: Colors.black),
                            labelStyle: TextStyle(color: Colors.black),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.searchQuery.clear();
                                  controller.value.value = "";
                                },
                                child: Icon(Icons.clear_outlined)),
                            prefixIcon: Icon(Icons.search_outlined)),
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(() => GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.searchQuery.text != ""
                        ? controller.list
                            .where((element) => element.name
                                .toLowerCase()
                                .contains(controller.value.value
                                    .toString()
                                    .toLowerCase()))
                            .toList()
                            .length
                        : controller.list.toList().length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(DetailView(
                            data: controller.list.toList()[index],
                          ));
                        },
                        child: Container(
                          height: 400,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.asset(
                                  controller.list.toList()[index].image,
                                  height: 110,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.list.toList()[index].name,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600)),
                                    Text(
                                      controller.list
                                          .toList()[index]
                                          .manufacturer,
                                    ),
                                    Text(
                                      controller.list.toList()[index].details,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  Container(
                                    height: 25,
                                    width: 55,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Color(0xff909090)),
                                    child: Center(
                                        child: Text(
                                      "N${controller.list.toList()[index].price.value}",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )),
            )
          ],
        ));
  }
}
