import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/controller/public_controller.dart';
import 'package:bamabin/widgets/MyText.dart';
import 'package:bamabin/widgets/MyTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailsScreen extends GetView<PublicController> {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary,
      body: ListView(
        children: [
          SizedBox(
            width: Get.width,
            height: 220,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                //! Background Cover
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/bg_crausel.jpg'))),
                ),
                //! Gradient
                Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: fadeGradient(),
                      ),
                    )),
                //! Poster
                Positioned(
                    right: 20,
                    bottom: -10,
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [bs010o5]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 130,
                          height: 190,
                          child: Image.asset(
                            'assets/images/monarch.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )),

                //! Geners
                Positioned(
                    right: 155,
                    bottom: 45,
                    left: 0,
                    child: Container(
                      width: Get.width,
                      height: 25,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                              decoration: BoxDecoration(
                                  color: cPrimary.withOpacity(.8),
                                  border: Border.all(
                                    color: cStrokeGrey.withOpacity(.7),
                                  ),
                                  borderRadius: BorderRadius.circular(5)),
                              margin: EdgeInsets.symmetric(horizontal: 1),
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 4, bottom: 4),
                              child: MyText(
                                text: 'کمدی',
                                size: 11,
                              )),
                        ),
                      ),
                    )),
                //! StarRate
                Positioned(
                    left: 10,
                    bottom: 0,
                    right: 140,
                    child: Row(
                      textDirection: TextDirection.ltr,
                      children: [
                        GestureDetector(
                          onTap: () => controller.setRate(rateNum: 1),
                          child: Obx(() => Icon(
                                controller.starRate.value >= 1
                                    ? Icons.star_rounded
                                    : Icons.star_border_rounded,
                                color: cY,
                                size: 40,
                              )),
                        ),
                        GestureDetector(
                          onTap: () => controller.setRate(rateNum: 2),
                          child: Obx(() => Icon(
                                controller.starRate.value >= 2
                                    ? Icons.star_rounded
                                    : Icons.star_border_rounded,
                                color: cY,
                                size: 40,
                              )),
                        ),
                        GestureDetector(
                          onTap: () => controller.setRate(rateNum: 3),
                          child: Obx(() => Icon(
                                controller.starRate.value >= 3
                                    ? Icons.star_rounded
                                    : Icons.star_border_rounded,
                                color: cY,
                                size: 40,
                              )),
                        ),
                        GestureDetector(
                          onTap: () => controller.setRate(rateNum: 4),
                          child: Obx(() => Icon(
                                controller.starRate.value >= 4
                                    ? Icons.star_rounded
                                    : Icons.star_border_rounded,
                                color: cY,
                                size: 40,
                              )),
                        ),
                        GestureDetector(
                          onTap: () => controller.setRate(rateNum: 5),
                          child: Obx(() => Icon(
                                controller.starRate.value >= 5
                                    ? Icons.star_rounded
                                    : Icons.star_border_rounded,
                                color: cY,
                                size: 40,
                              )),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: MyText(
                text: 'The Thing Called Love',
                textAlign: TextAlign.right,
                size: 15,
                textDirection: TextDirection.ltr,
                textOverflow: TextOverflow.ellipsis,
              )),
              MyText(
                text: 'امتیاز کاربران : 4.5',
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Icon(
                  Icons.star_rounded,
                  color: cY,
                  size: 18,
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: MyText(
                text: 'چیزی به اسم عشق',
                textAlign: TextAlign.right,
                size: 15,
                textDirection: TextDirection.rtl,
                textOverflow: TextOverflow.ellipsis,
              )),
              MyTextButton(
                  size: Size(80, 30),
                  onTap: () {},
                  bgColor: cY,
                  fgColor: cB,
                  child: MyText(
                    text: 'نظر دهید',
                    color: cB,
                  )),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            width: Get.width,
            height: 70,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Expanded(child: MovieItemSmallDetailWidget()),
                Expanded(child: MovieItemSmallDetailWidget()),
                Expanded(child: MovieItemSmallDetailWidget()),
                Expanded(child: MovieItemSmallDetailWidget()),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MovieItemSmallDetailWidget extends StatelessWidget {
  const MovieItemSmallDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: cDrawerGrey, borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.only(top: 8, bottom: 5, left: 5, right: 5),
      child: MyText(
        text: 'oooooops',
        color: cPrimary,
      ),
    );
  }
}
