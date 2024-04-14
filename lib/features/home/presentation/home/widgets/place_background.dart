import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PlaceBackground extends StatelessWidget {
  const PlaceBackground(this.imageUrl, {super.key});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        color: Colors.black54,
        colorBlendMode: BlendMode.darken,
      ),
    );
  }
}
