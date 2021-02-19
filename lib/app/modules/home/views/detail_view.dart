import 'package:d_r_o_health/app/modules/home/controllers/home_controller.dart';
import 'package:d_r_o_health/app/modules/home/views/bag_view.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class DetailView extends GetView<HomeController> {
  final data;
  DetailView({this.data});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                  color: Color(0xff9F5DE2),
                  borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                onTap: () => Get.to(
                  BagView(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white70,
                    ),
                    Obx(() => Text(
                          "${controller.bagList.toList().length}",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
                child: Image.asset(
              data.image,
              height: 200,
            )),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  Text(data.details,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff909090),
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("SOLD BY"),
                          Text(
                            "Emzor Pharmaceuticals",
                            style: TextStyle(color: Color(0xff0CB8B6)),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Obx(() => Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[400]),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    data.quantity.value = data.quantity - 1;
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "${data.quantity.value}",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.increment();
                                    data.quantity.value = data.quantity + 1;
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Pack(s)",
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      Spacer(),
                      EasyRichText(
                        "N${data.price}",
                        defaultStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        patternList: [
                          EasyRichTextPattern(
                            targetString: 'N',
                            superScript: true,
                            // stringBeforeTarget: 'Product',
                            matchWordBoundaries: false,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "PRODUCT DETAILS",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Stack(
                        children: [
                          Icon(
                            Icons.link,
                            color: Color(0xff9F5DE2),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.link,
                              color: Color(0xff9F5DE2),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("PACK SIZE",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300)),
                          SizedBox(
                            height: 5,
                          ),
                          Text("3x10",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Icon(Icons.qr_code_scanner, color: Color(0xff9F5DE2)),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("PRODUCT ID",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300)),
                          SizedBox(
                            height: 2,
                          ),
                          Text("PROBRYVPW1",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.link,
                        color: Color(0xff9F5DE2),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CONSTITUENTS",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300)),
                          SizedBox(
                            height: 2,
                          ),
                          Text("${data.name}",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.inventory,
                        color: Color(0xff9F5DE2),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("DESPENSED IN",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300)),
                          SizedBox(
                            height: 2,
                          ),
                          Text("Packs",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "1 pack of ${data.name} contains 3 units of 10 Tablets",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: GestureDetector(
                      onTap: () {
                        HomeController _con = Get.put(HomeController());
                        _con.bagList.add(data);
                        AwesomeDialog(
                          // isDense: true,
                          context: context,
                          // dialogType: DialogType.SUCCES,
                          customHeader: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Color(0xff0CB8B6),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Icon(
                                Icons.done,
                                size: 100,
                                color: Colors.white,
                              )),
                          headerAnimationLoop: false,
                          // animType: AnimType.BOTTOMSLIDE,

                          body: Column(
                            children: [
                              Text(
                                'Successful',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                '${data.name} has been added to your bag',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              GestureDetector(
                                onTap: () => Get.to(BagView()),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: Get.width,
                                    height: 50,
                                    color: Color(0xff0CB8B6),
                                    child: Center(
                                      child: Text(
                                        "View Bag",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: Get.width,
                                    height: 50,
                                    color: Color(0xff0CB8B6),
                                    child: Center(
                                      child: Text(
                                        "Done",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )..show();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff9F5DE2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white70,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Add to bag",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
