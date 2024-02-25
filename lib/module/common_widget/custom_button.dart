import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  void Function()? onTap;
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  CustomButton({Key? key, required this.title, this.backgroundColor, this.onTap, this.textColor, this.fontSize}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        padding: const EdgeInsets.only(top: 10,bottom:6 ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? const Color(0xffDED1E7),
          borderRadius: BorderRadius.circular(10),
        ),
        child:Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Full Sans LC Medium',
              fontSize: fontSize ?? 20,
              color: textColor?? Colors.black,
              // backgroundColor: Colors.white,
            ),
            // textAlign: TextAlign.end,
          ),
        ),
      ),
    );
  }
}
