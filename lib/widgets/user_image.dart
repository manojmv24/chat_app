import 'package:flutter/material.dart';

class UserImage extends StatefulWidget {
  const UserImage({Key? key}) : super(key: key);

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 50,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.upload),
            label: const Text("Take and upload image"))
      ],
    );
  }
}
