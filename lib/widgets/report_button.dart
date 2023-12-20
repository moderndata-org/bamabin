import 'package:flutter/material.dart';

import '../constant/strings.dart';
import 'MyText.dart';

class ReportButtonWidget extends StatelessWidget {
  const ReportButtonWidget({
    required this.text,
    this.offFunction,
    this.onFunction,
    super.key,
  });
  final Function()? onFunction;
  final Function()? offFunction;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: offFunction,
                child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset('assets/images/ic_off.png')),
              ),
              MyText(
                text: strOff,
                size: 12,
              )
            ],
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(top: 5, right: 5, left: 5),
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: Colors.black.withOpacity(.1),
                          offset: const Offset(0, 10))
                    ],
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 197, 197, 197),
                          Colors.white
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: MyText(size: 13, text: text)),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: onFunction,
                child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset('assets/images/ic_off.png')),
              ),
              MyText(
                text: strOn,
                size: 12,
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
