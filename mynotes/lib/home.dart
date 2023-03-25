import 'package:flutter/material.dart';
import 'package:mynotes/processing_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png'), // 替换成你的logo图片
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // 点击设置按钮的回调函数
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Upload'),
          onPressed: () {
            // 点击上传图片按钮的回调函数
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ImageProcessingPage()),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
