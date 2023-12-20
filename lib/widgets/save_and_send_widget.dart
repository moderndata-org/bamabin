import 'package:flutter/cupertino.dart';
import '../../constant/colors.dart';
import 'MyText.dart';
import 'MyTextField.dart';

class SaveTextFieldWidget extends StatelessWidget {
  const SaveTextFieldWidget({
    required this.textDirection,
    required this.textEditingController,
    required this.btnText,
    this.textZone,
    required this.hint,
    required this.textInputType,
    this.onClick,
    this.text,
    this.length,
    this.borderRadius,
    this.btnColor,
    super.key,
  });
  final TextDirection textDirection;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final String? textZone;
  final String hint;
  final String btnText;
  final String? text;
  final int? length;
  final double? borderRadius;
  final Color? btnColor;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            CupertinoButton(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: btnColor,
              onPressed: onClick,
              child: MyText(
                text: btnText,
                color: cW,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius ?? 10),
                  color: cW,
                  boxShadow: [bs010]),
              child: MyTextField(
                hint: hint,
                inputType: textInputType,
                length: length ?? 15,
                controller: textEditingController,
                textAlign: TextAlign.center,
                textDirection: textDirection,
              ),
            )),
            textZone == null
                ? const SizedBox()
                : const SizedBox(
                    width: 10,
                  ),
            textZone == null ? const SizedBox() : MyText(text: textZone!)
          ],
        ));
  }
}
