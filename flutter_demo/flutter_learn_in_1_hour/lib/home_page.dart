import 'package:flutter/material.dart';
import 'package:flutter_application_1/learn_flutter_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) {
                  return const LearnFlutterPage();
                },
              ));
            },
            child: const Text("Learn Flutter"),
          ),
        ),
        Center(
          child: FrogColor(
            color: Colors.green,
            child: Builder(
              builder: (BuildContext context) {
                return Text(
                  "hello Frog",
                  style: TextStyle(color: FrogColor.of(context).color),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class FrogColor extends InheritedWidget {
  const FrogColor({
    super.key,
    required this.color,
    required this.child,
  }) : super(child: child);

  final Widget child;
  final Color color;

  static FrogColor? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FrogColor>();
  }

  static FrogColor of(BuildContext context) {
    final FrogColor? result = maybeOf(context);
    assert(result != null, "No FrogColor found in context");
    return result!;
  }

  @override
  bool updateShouldNotify(FrogColor oldWidget) {
    return true;
  }
}
