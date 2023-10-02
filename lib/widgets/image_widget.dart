import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.upload),
          label: const Text("Upload Image"),
        )
      ],
    );
  }
}
