import 'package:flutter/material.dart';

class ImageProcessingPage extends StatelessWidget {
  const ImageProcessingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('图片处理'),
      ),
      body: const Center(
        child: Text('这是图片处理页面'),
      ),
    );
  }
}
