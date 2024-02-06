import 'package:bamabin/constant/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class GenreItem extends StatelessWidget {
  const GenreItem(
      {this.height, this.width, this.margin, this.title, this.imageUrl,this.boxShadow, Key? key})
      : super(key: key);
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final BoxShadow? boxShadow;
  final String? title;
  final String? imageUrl;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: AssetImage('assets/images/genre_img.png'),
            fit: BoxFit.cover,
          ),
          boxShadow: boxShadow == null ? [bs010] : [boxShadow!]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 3.2, sigmaY: 3.2),
          child: Container(
            padding: EdgeInsets.only(top: 10.0),
            color: Colors.black.withOpacity(0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                (imageUrl != null) ?
                CachedNetworkImage(imageUrl: this.imageUrl!,width: 23,) : Icon(Icons.emoji_emotions_outlined,color: Colors.white,size: 23,),
                Text(
                  '${this.title}',
                  style: TextStyle(
                      color: Colors.white, fontSize: 13, shadows: [bs010]),
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


