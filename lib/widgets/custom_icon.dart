import 'package:flutter/widgets.dart';
import 'package:tiket_wisata/gen/assets.gen.dart';

class CustomIcon extends StatelessWidget {
  final String assetPath;
  final double size;
  final Color? color;

  const CustomIcon({
    required this.assetPath,
    this.size = 24.0,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      width: size,
      height: size,
      color: color,
    );
  }
}