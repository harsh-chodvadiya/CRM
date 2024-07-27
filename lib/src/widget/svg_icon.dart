import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const SvgIcon(
    this.icon, {
    super.key,
    this.color,
    this.height,
    this.fit,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      fit: fit ?? BoxFit.contain,
      width: width,
      height: height,
      colorFilter:
          color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}
