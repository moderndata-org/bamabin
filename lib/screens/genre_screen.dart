import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/genre_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_appbar.dart';

class GenreScreen extends StatelessWidget {
  const GenreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cPrimary,
        appBar: CustomAppbar(
            title: 'ژانر ها',
            icon: Icon(
              Icons.hotel_class_rounded,
              color: cW,
              shadows: [bsTextLowOpacity],
            )),
        body: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Expanded(
                  child: GridView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    childAspectRatio: 8 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 8),
                itemCount: 30, // Total number of items
                itemBuilder: (BuildContext context, int index) {
                  return GenreItem();
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
