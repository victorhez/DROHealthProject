import 'package:d_r_o_health/app/modules/home/controllers/home_controller.dart';
import 'package:d_r_o_health/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BagView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: Container(
        height: Get.height,
        decoration: BoxDecoration(
            color: Color(0xff7B4397),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
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
                Spacer(),
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
                      child: Obx(() => Text(
                            "${controller.bagList.toList().length}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ))),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, top: 20, bottom: 50),
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child:
                          Text("Tap on Item for add, remove, delete options")),
                ),
              ),
            ),
            Expanded(
                child: Obx(
              () => ListView.builder(
                itemCount: controller.bagList.toList().length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.visiblebag.value == false
                          ? controller.visiblebag.value = true
                          : controller.visiblebag.value = false;
                      // controller.buildSearchList();
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 35,
                                backgroundImage: AssetImage(
                                    controller.bagList.toList()[index].image),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "x${controller.bagList.toList()[index].quantity}",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "${controller.bagList.toList()[index].name}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                      "${controller.bagList.toList()[index].details}",
                                      style: TextStyle(color: Colors.white))
                                ],
                              ),
                              Spacer(),
                              Obx(() => Text(
                                  "N${controller.bagList.toList()[index].price * controller.bagList.toList()[index].quantity.value}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18))),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(() => Visibility(
                              visible: controller.visiblebag.value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        print("OKAY");
                                        print(controller.bagList.toList());
                                        controller.bagList.remove(
                                            controller.bagList.toList()[index]);
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        controller.bagList
                                            .toList()[index]
                                            .quantity
                                            .value = controller.bagList
                                                .toList()[index]
                                                .quantity -
                                            1;
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Obx(() => Center(
                                          child: Text(
                                            "${controller.bagList.toList()[index].quantity.value}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.increment();
                                        controller.bagList
                                            .toList()[index]
                                            .quantity
                                            .value = controller.bagList
                                                .toList()[index]
                                                .quantity +
                                            1;
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  );
                },
              ),
            )),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text("Total",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                  Spacer(),
                  Text("N${controller.getTotal()}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600))
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.offAllNamed(Routes.HOME);
                controller.bagList.toList().clear();
              },
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                        child: Text("Checkout",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500))),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
