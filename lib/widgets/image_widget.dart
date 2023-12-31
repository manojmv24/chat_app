import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({Key? key, required this.onPickedImage}) : super(key: key);
  final void Function(File file) onPickedImage;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  File? pickedImageFile;
  void pickImage() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera, maxWidth: 150, imageQuality: 50);
    if (pickedImage == null) {
      return;
    }
    setState(() {
      pickedImageFile = File(pickedImage.path);
    });

    widget.onPickedImage(pickedImageFile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage: pickedImageFile == null ? null : FileImage(pickedImageFile!),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton.icon(
          onPressed: () {
            pickImage();
          },
          icon: const Icon(Icons.upload),
          label: const Text("Upload Image"),
        )
      ],
    );
  }
}
