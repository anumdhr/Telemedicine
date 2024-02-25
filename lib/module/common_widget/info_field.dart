import 'package:flutter/material.dart';
import 'package:seventh_sem_project/module/utils/const.dart';

class InfoField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final InputDecoration? inputDecoration;
  final TextEditingController controller;
  final bool? readOnly;

  const InfoField({
    Key? key,
    required this.controller,
    this.title,
    this.hintText,
    this.inputDecoration,
    this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, right: 12, left: 12),
      padding: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: primaryColor.withOpacity(0.4),
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            title ?? "No set",
            style: const TextStyle(
              fontFamily: "Full Sans LC Book",
              color: primaryColor,
              fontSize: 14,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          // const Spacer(),
          Expanded(
            child: TextFormField(
              controller: controller,
              readOnly: true,
              textAlign: TextAlign.end,
              decoration: inputDecoration ??
                  InputDecoration(
                    isCollapsed: true,
                    contentPadding: EdgeInsets.zero,
                    hintText: hintText,
                    border: InputBorder.none,
                  ),
            ),
          )
          // Text(
          //   data ?? "",
          //   style: const TextStyle(
          //     fontFamily: "Full Sans LC Book",
          //     color: Color(0xffA185B8),
          //     fontSize: 14,
          //   ),
          // ),

          // InkWell(
          //     child: SvgPicture.asset(
          //       "assets/images/Forward.svg",
          //       color: Color(0xff612690),
          //
          //     )
          // )
        ],
      ),
    );
  }
}
