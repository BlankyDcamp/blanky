import 'package:flutter/material.dart';

/// Gradient가 들어간 Box 위젯

// ignore: must_be_immutable
class GradientBox extends StatelessWidget {
  final Widget content;
  final Gradient gradient;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;
  final VoidCallback? onTap;
  double? circularRadius;
  double? elevation;

  GradientBox({
    required this.content,
    required this.gradient,
    this.margin,
    this.contentPadding,
    this.onTap,
    this.circularRadius,
    this.elevation,
  }) {
    if(circularRadius == null) {
      circularRadius = 0.0;
    }
    if(elevation == null) {
      elevation = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: contentPadding,
      decoration: ShapeDecoration(
        gradient: gradient,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(circularRadius!)),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 4.0,
            spreadRadius: 0.0,
            offset: Offset(elevation!, elevation!), // shadow direction: bottom right
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(circularRadius!)),
          onTap: onTap,
          child: content,
        ),
      ),
    );
  }

}