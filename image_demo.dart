import 'package:flutter/material.dart';

// 1. Dạng cơ bản hiển thị ảnh gốc
class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/doremon.jpg',
      fit: BoxFit.contain,
    );
  }
}

// 2. Dạng có bo góc và viền trang trí (BoxDecoration)
class ImageDemov2 extends StatelessWidget {
  const ImageDemov2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        border: Border.all(color: Colors.blueAccent, width: 4),
        image: const DecorationImage(
          image: AssetImage("images/doremon.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// 3. Dạng dùng SizedBox cố định khung 400x400
class ImageDemov4 extends StatelessWidget {
  const ImageDemov4({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 400,
      child: Image.asset(
        "images/doremon.jpg",
        fit: BoxFit.fill,
      ),
    );
  }
}

// 4. Dạng hình tròn Avatar có viền xanh tròn (CircleAvatar)
class CircleAvatarDemo extends StatelessWidget {
  const CircleAvatarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 90,
          backgroundColor: Colors.blueAccent,
          child: CircleAvatar(
            radius: 85,
            backgroundImage: AssetImage("images/doremon.jpg"),
          ),
        ),
      ],
    );
  }
}
