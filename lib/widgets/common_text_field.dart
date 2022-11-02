import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField(
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
      this.textStyle = const TextStyle(fontSize: 14),
      this.hintTextStyle = const TextStyle(fontSize: 14),
      this.containerMargin = const EdgeInsets.only(top: 12.0),
      this.readOnly = false,
      this.textFieldDecoration,
      this.onTapTextField,
      this.textInputAction,
      this.onChange})
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
  Function? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: containerMargin,
      padding: contentPadding,
      decoration: BoxDecoration(
        color: const Color(0xFFf5f7fa),
        borderRadius: BorderRadius.circular(8.0),
        // boxShadow: const [
        //   BoxShadow(color: Colors.black, blurRadius: 1, spreadRadius: 0),
        //   BoxShadow(color: Colors.white, blurRadius: 10, spreadRadius: 5),
        // ]
      ),
      child: Center(
        child: TextField(
          controller: controller,
          autofocus: autoFocus,
          style: textStyle,
          focusNode: focusNode,
          readOnly: readOnly,
          textAlign: textAlign ?? TextAlign.start,
          decoration: textFieldDecoration ??
              InputDecoration.collapsed(
                hintText: hintText,
                border: InputBorder.none,
                hintStyle: hintTextStyle,
                filled: false,
              ),
          keyboardType: keyBoardType,
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          onTap: () {
            if (onTapTextField != null) onTapTextField!();
          },
          textInputAction: textInputAction,
          onChanged: (val) {
            if (onChange != null) {
              onChange!(val);
            }
          },
        ),
      ),
    );
  }
}

class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
    Key? key,
    this.blur = 18,
    this.color = Colors.black38,
    this.offset = const Offset(18, 18),
    Widget? child,
  }) : super(key: key, child: child);

  final double blur;
  final Color color;
  final Offset offset;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final _RenderInnerShadow renderObject = _RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderInnerShadow renderObject) {
    renderObject
      ..color = color
      ..blur = blur
      ..dx = offset.dx
      ..dy = offset.dy;
  }
}

class _RenderInnerShadow extends RenderProxyBox {
  double? blur;
  Color? color;
  double? dx;
  double? dy;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;

    final Rect rectOuter = offset & size;
    final Rect rectInner = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      size.width - dx!,
      size.height - dy!,
    );
    final Canvas canvas = context.canvas..saveLayer(rectOuter, Paint());
    context.paintChild(child!, offset);
    final Paint shadowPaint = Paint()
      ..blendMode = BlendMode.srcATop
      ..imageFilter = ImageFilter.blur(sigmaX: blur!, sigmaY: blur!)
      ..colorFilter = ColorFilter.mode(color!, BlendMode.srcOut);

    canvas
      ..saveLayer(rectOuter, shadowPaint)
      ..saveLayer(rectInner, Paint())
      ..translate(dx!, dy!);
    context.paintChild(child!, offset);
    context.canvas
      ..restore()
      ..restore()
      ..restore();
  }
}
