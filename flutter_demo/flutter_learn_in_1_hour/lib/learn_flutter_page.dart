import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false;
  bool? isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("learn Flutter"),
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffB6F2AF),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
          ),
          actions: [
            IconButton(
              onPressed: () {
                debugPrint("Actions");
              },
              icon: const Icon(Icons.info_outline),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("images/moli_flower.jpeg"),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              color: Colors.blueAccent,
              width: double.infinity,
              child: const Center(
                child: Text(
                  "This is a text Widget",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint("E Learn Flutter");
              },
              child: const Text("Learn Flutter"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSwitch ? Colors.blue : Colors.redAccent,
              ),
              onPressed: () {
                debugPrint("E Button printed");
              },
              child: const Text("E Button"),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint("O Button printed");
              },
              child: const Text("O Button"),
            ),
            TextButton(
              onPressed: () {
                debugPrint("T Button printed");
              },
              child: const Text("T Button"),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                debugPrint("This is the row");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    Icons.local_activity,
                    color: Colors.red,
                  ),
                  Text("Row widget"),
                  Icon(Icons.local_activity),
                ],
              ),
            ),
            Switch(
              value: isSwitch,
              onChanged: (bool newBool) {
                setState(() {
                  isSwitch = newBool;
                });
              },
            ),
            Checkbox(
              value: isCheck,
              onChanged: (bool? newBoll) {
                setState(() {
                  isCheck = newBoll;
                  isSwitch = newBoll!;
                });
              },
            ),
            Image.network(
                "https://s.cn.bing.net/th?id=OHR.Mohair_EN-CN9890049151_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&qlt=50"),
          ],
        ),
      ),
    );
  }
}
