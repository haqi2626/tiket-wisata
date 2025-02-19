import 'package:flutter/widgets.dart';
import '../gen/assets.gen.dart';

class CustomImage extends StatelessWidget {
  final String assetPath;
  final double width;
  final double height;
  final BoxFit fit;

  const CustomImage({
    required this.assetPath,
    this.width = 100,
    this.height = 100,
    this.fit = BoxFit.cover,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
