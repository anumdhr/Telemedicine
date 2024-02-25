import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/custom_text_style.dart';


class CustomTextFieldWithBottomBorder extends StatelessWidget {
  CustomTextFieldWithBottomBorder({
    Key? key,
    this.onTap,
    required this.obscureText,
    required this.hintText,
    this.maxLength,
    this.icon,
    this.backgroundColor,
    this.width,
    required this.attribute,
    this.suffixIconUrl,
    this.onChange,
    this.hintTextColor,
    this.validator,
    this.initialValue,
    this.textInputType,
    this.controller,
    this.enabled = true,
    this.inputDecoration,
    this.autoFocus = false,
    this.headingText,
    this.isFieldValidate,
    this.suffixIconColor,
    this.onTapSuffixIcon,
  }) : super(key: key);

  bool? isFieldValidate;
  final String hintText;
  final Icon? icon;
  String? suffixIconUrl;
  final Color? backgroundColor;
  void Function()? onTap;
  final double? width;
  final Color? hintTextColor;
  final String? attribute;
  final FormFieldValidator<String>? validator;
  final TextInputType? textInputType;
  final String? initialValue;
  final TextEditingController? controller;
  ValueChanged? onChange;
  final bool enabled;
  final InputDecoration? inputDecoration;
  final bool autoFocus;
  String? headingText;
  final int? maxLength;
  final bool obscureText;
  final Color? suffixIconColor;
  final void Function()? onTapSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headingText == null
            ? const SizedBox()
            : Text(
          headingText!,
          style: CustomStyle.textFullSansLcMedium.copyWith(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        FormBuilderTextField(
          cursorColor: Colors.white,
          obscureText: obscureText,
          textAlignVertical: TextAlignVertical.center,
          name: attribute.toString(),
          initialValue: initialValue,
          autofocus: autoFocus,
          onChanged: onChange,
          controller: controller,
          onTap: onTap,
          enabled: enabled,
          style: CustomStyle.textFullSansLcBook.copyWith(fontSize: 14, color: Colors.white, height: 1.50),
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: [
            LengthLimitingTextInputFormatter(maxLength),
          ],
          decoration: inputDecoration ??
              InputDecoration(
                suffixIcon: suffixIconUrl == null
                    ? null
                    : Transform.translate(
                    offset: const Offset(11, 0),
                    child: GestureDetector(
                      onTap: onTapSuffixIcon,
                      child: SvgPicture.asset(
                        suffixIconUrl!,
                        color: suffixIconColor,
                        fit: BoxFit.scaleDown,
                      ),
                    )),
                hintStyle: CustomStyle.textFullSansLcMedium.copyWith(
                  fontSize: 14,
                  color: hintTextColor ?? const Color(0xffFFFFFF).withOpacity(0.3),
                ),
                contentPadding: const EdgeInsets.only(
                  left: 1,
                ),
                enabled: true,
                isDense: true,
                isCollapsed: true,
                fillColor: Colors.transparent,
                hintText: hintText,
                filled: true,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.white),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.white),
                ),
                disabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.white),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.white),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.red),
                ),
              ),
          keyboardType: textInputType,
          validator: validator,
        ),
      ],
    );
  }
}
