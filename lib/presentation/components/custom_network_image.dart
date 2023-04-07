import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final double radius;
  final Color bgColor;

  const CustomNetworkImage({
    Key? key,
    required this.url,
    required this.height,
    required this.width,
    required this.radius,
    this.bgColor = Style.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: url,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, progress) {
          return Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              color: Style.textColor,
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: bgColor,
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.error,
              color: Style.textColor,
            ),
          );
        },
      ),
    );
  }
}
