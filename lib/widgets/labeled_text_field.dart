

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stocks_assessment/widgets/common_text_field.dart';

class LabeledTextField extends StatelessWidget {
  LabeledTextField(
      {Key? key,
      this.controller,
      this.hintText,
      this.maxLines,
      this.inputFormatters,
      this.keyBoardType,
      this.height = 40.0,
      this.contentPadding =
          const EdgeInsets.only(bottom: 8.0, left: 10.0, right: 10.0, top: 10),
      this.autoFocus = false,
      this.focusNode,
      this.textAlign,
      this.textStyle = const TextStyle(fontSize: 12, color: Colors.grey),
      this.hintTextStyle = const TextStyle(fontSize: 12, color: Colors.black),
      this.containerMargin = const EdgeInsets.only(top: 12.0),
      this.readOnly = false,
      this.textFieldDecoration,
      this.onTapTextField,
      this.textInputAction,
      this.suffixIcon})
      : super(key: key);

  final TextEditingController? controller;
  final double height;
  final String? hintText;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyBoardType;
  final EdgeInsetsGeometry contentPadding;
  final GestureTapCallback? onTapTextField;
  TextStyle hintTextStyle;
  TextStyle textStyle;
  TextAlign? textAlign;
  FocusNode? focusNode;
  bool autoFocus;
  EdgeInsets containerMargin;
  bool readOnly;
  InputDecoration? textFieldDecoration;
  TextInputAction? textInputAction;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      height: height,
      controller: controller,
      readOnly: readOnly,
      textStyle: const TextStyle(fontSize: 16, color: Colors.black),
      contentPadding: contentPadding,
      maxLines: maxLines,
      containerMargin: EdgeInsets.zero,
      keyBoardType: keyBoardType,
      textInputAction: textInputAction,
      textFieldDecoration: InputDecoration(
          labelText: hintText,
          labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder()
          // filled: false,
          ),
      onTapTextField: () {
        if (onTapTextField != null) onTapTextField!();
      },
    );
  }
}
