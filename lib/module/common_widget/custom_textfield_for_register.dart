import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:seventh_sem_project/module/utils/const.dart';

import '../utils/custom_text_style.dart';

class CustomTextFieldForRegister extends StatelessWidget {
  CustomTextFieldForRegister({
    Key? key,
    this.onTap,
    required this.hintText,
    this.icon,
    this.backgroundColor,
    this.width,
    required this.attribute,
    this.onChange,
    this.hintTextColor,
    this.validator,
    this.initialValue,
    this.textInputType,
    this.controller,
    this.enabled = true,
    this.inputDecoration,
    this.autoFocus = false,
    this.prefixIcon,
    this.obscureText,
    this.suffixIcon,
    this.validate = true,
    this.readOnly,
  }) : super(key: key);

  final String hintText;
  final Icon? icon;
  final Color? backgroundColor;
  void Function()? onTap;
  final double? width;
  final Color? hintTextColor;
  final String? attribute;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final String? initialValue;
  final TextEditingController? controller;
  ValueChanged? onChange;
  final bool enabled;
  final InputDecoration? inputDecoration;
  final bool autoFocus;
  Widget? prefixIcon;
  bool? obscureText;
  Widget? suffixIcon;
  final bool? validate;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:40,
      child: FormBuilderTextField(
          obscureText: obscureText ?? false,
          textAlignVertical: TextAlignVertical.center,
          name: attribute.toString(),
          initialValue: initialValue,
          autofocus: autoFocus,
          onChanged: onChange,
          controller: controller,
          onTap: onTap,
          readOnly: readOnly ?? false ,
          enabled: enabled,
          style: CustomStyle.textFullSansLcBook.copyWith(
            fontSize: 14,
            color: hintTextColor ?? const Color(0xff000000),
            height: 1.4,
          ),
          // maxLines: null,
          // expands: true,
          textInputAction: TextInputAction.next,
          decoration: inputDecoration ??
              InputDecoration(
                suffixIcon: suffixIcon,
                isCollapsed: true,
                contentPadding: const EdgeInsets.only(top: 5),
                prefixIcon: prefixIcon,
                // hintText: hintText,
                hintStyle: CustomStyle.textFullSansLcBook.copyWith(
                  fontSize: 14,
                  color: hintTextColor ?? Color(0xff8C8C8C),
                ),
                // contentPadding: EdgeInsets.zero,
                hintText: hintText,
                // errorText: "",
                fillColor: backgroundColor ??
                   Color(0xffFBFBFB),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:  BorderSide(
                    width: 1,
                    color: validate!  ? Colors.transparent: Colors.red  ,

                  ),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:  BorderSide(
                      width: 1,
                      // style: BorderStyle.none,
                      color: validate!  ? Colors.transparent: Colors.red
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:  BorderSide(
                    width: 1,
                    color: validate!  ? Colors.transparent: Colors.red  ,
                  ),
                ),
              ),
          keyboardType: textInputType,
          validator: validator),
    );
  }
}
