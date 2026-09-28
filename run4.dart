import 'package:flutter/material.dart';
import 'image_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        // Gọi lớp CircleAvatarDemo để hiển thị ảnh hình tròn có viền xanh
        child: CircleAvatarDemo(),
      ),
    );
  }
}
