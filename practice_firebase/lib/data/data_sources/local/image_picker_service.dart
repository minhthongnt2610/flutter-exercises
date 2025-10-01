import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();
  Future<void> pickFromGallery(BuildContext context) async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      if (!context.mounted) return;
      Navigator.pop(context, File(image.path));
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error selecting photo: $e')));
      }
    }
  }

  Future<void> pickFromCamera(BuildContext context) async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null) return;
      if (!context.mounted) return;
      Navigator.pop(context, File(image.path));
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error selecting photo: $e')));
      }
    }
  }

  Future<File?> showImageSourceActionSheet(BuildContext context) async {
    final imageSource = await showCupertinoModalPopup<ImageSource?>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text(
          'Pick an image from your gallery or take a new photo',
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
            child: const Text('Choose Gallery'),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context, ImageSource.camera),
            child: const Text('Take A Photo'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context, null),
          child: const Text('Cancel'),
        ),
      ),
    );
    if (imageSource == null) return null;
    if (imageSource == ImageSource.gallery) {
      try {
        await pickFromGallery(context);
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error selecting photo: $e')));
        }
      }
    } else if (imageSource == ImageSource.camera) {
      try {
        await pickFromCamera(context);
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error selecting photo: $e')));
        }
      }
    }
    return null;
  }
}
