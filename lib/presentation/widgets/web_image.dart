import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WebImage extends StatelessWidget {
  final String url;
  final double? size;

  const WebImage({
    required this.url,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CachedNetworkImage(
        imageUrl: url,
        width: size,
        height: size,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ),
        ),
      ),
    );
  }
}
