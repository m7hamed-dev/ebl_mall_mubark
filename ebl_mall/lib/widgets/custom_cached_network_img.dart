import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  const CustomCachedNetworkImage(
      {Key? key, required this.imageUrl, this.width, this.height})
      : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? 50,
      height: height ?? 50,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
          ),
        ),
      ),
      placeholder: (context, url) => ShimmerLoadImage(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
