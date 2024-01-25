import 'package:bamabin/constant/colors.dart';
import 'package:bamabin/widgets/custom_appbar.dart';
import 'package:bamabin/widgets/movie_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // PublicController? _controller = Get.find<PublicController>();
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      if (_scrollController!.position.pixels ==
          _scrollController!.position.maxScrollExtent) {
        print('yes${UniqueKey()}');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: cPrimary,
      appBar: CustomAppbar(
          title: 'علاقه مندی ها',
          icon: Icon(
            Icons.favorite,
            color: cW,
            shadows: [bsTextLowOpacity],
          )),
      body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: GridView.count(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              childAspectRatio: .62,
              crossAxisCount: 3,
              children: List.generate(
                  20,
                  (index) => MovieItemWidget(
                        title: 'monarch',
                        hasDubbed: true,
                        hasSubtitle: true,
                        imdbRate: '5.5',
                        year: '20${index.toString().padLeft(2, '0')}',
                      )),
            ),
          )),
    ));
  }
}
