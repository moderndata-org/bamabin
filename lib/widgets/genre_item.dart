import 'package:bamabin/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class GenreItem extends StatelessWidget {
  const GenreItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage('assets/images/genre_img.png'),
          fit: BoxFit.cover,
        ),
        boxShadow: [bs010]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 3.2, sigmaY: 3.2),
          child: Container(
            padding: EdgeInsets.only(top: 10.0),
            color: Colors.black.withOpacity(0.3),
            child: Column(
              children: [
                Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(height: 10.0),

                Text(
                  'کمدی',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
    //   Container(
    //   width: 150,
    //   height: 50,
    //   decoration: BoxDecoration(
    //     image: DecorationImage(image: AssetImage("assets/images/genre_img.png")),
    //     borderRadius: BorderRadius.circular(8)
    //   ),
    //   child:BackdropFilter(
    // filter: ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0), // Adjust the sigma values for different levels of blur
    // child: Column(children: [
    //   Icon(Icons.emoji_emotions_outlined,color: Colors.white,),
    //   Text("کمدی",style: TextStyle(color: Colors.white),)
    // ],),)
    //
    // )


