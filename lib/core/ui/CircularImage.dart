import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {

  final String url;
  final double width;
  final double height;
  final double borderRadius;
  final BoxFit fit;

  const CustomImage({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    this.borderRadius = 0,
    this.fit = BoxFit.cover
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        url,
        fit: fit,
        width: width,
        height: height,
      ),
    );
  }
}
