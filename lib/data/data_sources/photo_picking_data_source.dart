import 'dart:io';

import 'package:image_picker/image_picker.dart';

enum ImageDataSource {
  /// Opens up the device camera, letting the user to take a new picture.
  camera,

  /// Opens the user's photo gallery.
  gallery,
}

extension ImageSourceTO on ImageDataSource {
  // Convert to transfer object
  ImageSource get toTO {
    return switch (this) {
      ImageDataSource.camera => ImageSource.camera,
      ImageDataSource.gallery => ImageSource.gallery,
    };
  }
}

class PhotoPickingDataSource {
  static final ImagePicker _picker = ImagePicker();

  Future<File?> getPhoto(
      [ImageDataSource source = ImageDataSource.gallery]) async {
    final XFile? image = await _picker.pickImage(source: source.toTO);

    if (image == null) {
      return null;
    }

    return File(image.path);
  }
}
