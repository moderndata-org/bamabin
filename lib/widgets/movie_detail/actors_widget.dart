import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../MyText.dart';
import '../custom_shimmer.dart';

class ActorsWidget extends StatelessWidget {
  const ActorsWidget({
    this.name,
    this.imageUrl,
    this.height = 80,
    this.width = 80,
    super.key,
  });
  final String? name;
  final String? imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: SizedBox(
            width: width,
            height: height,
            child: CachedNetworkImage(
              imageUrl: '$imageUrl',
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                  child: CustomShimmerWidget(
                width: width!,
                height: height!,
              )),
              errorWidget: (context, url, error) => CustomShimmerWidget(
                width: width!,
                height: height!,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        MyText(
          text: '$name',
          maxLines: 2,
          textAlign: TextAlign.center,
          size: 12,
        )
      ],
    );
  }
}
