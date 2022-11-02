import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.textStyle = const TextStyle(fontSize: 16),
      this.buttonStyle,
      this.height,
      this.width,
      this.margin = EdgeInsets.zero,
      this.padding = const EdgeInsets.fromLTRB(10, 5, 10, 5),
      this.child,
      this.boxShadows})
      : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  final TextStyle textStyle;
  final ButtonStyle? buttonStyle;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final List<BoxShadow>? boxShadows;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: boxShadows,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: child ??
            Text(
              title,
              style: textStyle,
            ),
      ),
    );
  }
}
