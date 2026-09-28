import 'package:flutter/material.dart';

class CircleAvatarDemo extends StatelessWidget {
  const CircleAvatarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 100,
          backgroundColor: Colors.blueAccent,
          child: const CircleAvatar(
            radius: 85,
            backgroundImage: AssetImage("images/doremon.jpg"),
          ),
        ),
      ],
    );
  }
}
