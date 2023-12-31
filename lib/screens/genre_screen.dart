import 'package:bamabin/widgets/genre_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenreScreen extends StatelessWidget {
  const GenreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 5),
      width: Get.width,
      height: Get.height,
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                childAspectRatio: 8 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 8),
            itemCount: 20, // Total number of items
            itemBuilder: (BuildContext context, int index) {
              return GenreItem();
            },
          ))
        ],
      ),
    );
  }
}
