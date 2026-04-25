import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:register_offline/utils/assets.dart';


class ImageCachedNetworkImage extends ExtendedImage {
  final String imageUrl;
  final BoxFit boxFit;
  final Widget Function(ImageProvider imageProvider)? completedBuilder;
  final bool allowedPreview;

  @override
  LoadStateChanged? get loadStateChanged => (state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        return Image.asset(Assets.imageLoading, fit: boxFit);
      case LoadState.completed:
        if (completedBuilder != null) {
          return completedBuilder!(state.imageProvider);
        }
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: state.imageProvider,
              fit: boxFit,
            ),
          ),
        );
      case LoadState.failed:
        return Image.asset(Assets.noImage, fit: boxFit);
    }
  };

  ImageCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.allowedPreview = false,
    this.boxFit = BoxFit.cover,
    this.completedBuilder,
  }) : super.network(
    imageUrl,
  );
}
