import 'package:flutter/material.dart';

const age = 33;
const twiceTheAge = age * 2;

String getFullName(String firstName, String lastName) {
  return "$firstName $lastName";
}

String getSimpleName(String name) => name;

void valueType() {
  final int age;
  age = 20;
  if (age > 20) {
    print("age $age");
  }
  var names = {"foo", "bar"};
  names.add("hello");
  names.add("world");
  print("name $names");

  final things = {"foo", 1};
  print("things $things");

  var person = {"age": 20, "name": "Foo"};
  person["sex"] = "male";
  person["age"] = 21;
  print("map person: $person");
}

void nullSafe() {
  print("start null safe");
  String? name = null;
  print(name);
  name = "Foo";
  print(name);
  int? age = 20;
  print("age $age");
  age = null;
  print("age $age");
  if (age == null) {
    print("age is null");
  }

  List<String?> names = ["Foo", "Bar", null];
  print("names $names");
  // names = null; // A value of type  can't be assiged to a variable of List<String?>
  List<String?>? namesNull = ["Foo", "Bar", null];
  namesNull = null; // this is correct

  const String? firstName = null;
  const String? lastName = "name";

  if (firstName != null) {
  } else if (lastName != null) {}

  const firstNonNullValue = firstName ?? lastName;
  print("the first non null value is $firstNonNullValue");
}

enum PersonProperties { firstName, lastName, age }

enum AnimalType { cat, dog, bunny }

void testEnum(AnimalType animalType) {
  print(PersonProperties.firstName);
  switch (animalType) {
    case AnimalType.bunny:
      print("I dont konw bunny");
      return;
    case AnimalType.cat:
      print("I like cat");
      return;
    case AnimalType.dog:
      print("I have a dog");
      return;
    default:
      print("null");
      return;
  }
}

abstract class LivingThing {
  void breath() {
    print("living this is breathing");
  }

  void move() {
    print("I am moving");
  }
}

class Person extends LivingThing {
  String name;
  int age;
  final String gender;

  Person(this.name, this.age, this.gender);

  void printName() {
    print(this.name);
  }
  // Person(this.name, this.age);
}

extension PersonInfo on Person {
  String personInfo() {
    return "name: $name, age: $age, gender: $gender";
  }
}

class Cat extends Object {
  final String name;
  Cat(this.name);

  @override
  bool operator ==(covariant Cat other) => other.name == name;

  @override
  int get hashCode => name.hashCode;

  Cat operator +(Cat other) {
    return Cat(name + other.name);
  }
}

extension Run on Cat {
  String run() {
    print("cat $name running");
    return "run";
  }
}

void testClass() {
  final p = Person("gs", 33, "fale");
  p.printName();
  p.breath();

  final cat1 = Cat("tom");
  var cat2 = Cat("tom");

  if (cat1 == cat2) {
    print("They are equal");
  } else {
    print("they are not equal");
  }
  var cat3 = Cat("jerry");
  var cat4 = cat2 + cat3;
  print(cat4.name);
  cat1.run();
}

Future<int> testFutureReturnValue(int a) {
  return Future.delayed(const Duration(seconds: 2), () => a);
}

void test() async {
  final returnFuture = testFutureReturnValue(1);
  print(returnFuture);

  final returnValue = await testFutureReturnValue(2);
  print("return value: $returnValue");
}

Stream<String> getName() {
  return Stream.value("hello");
}

// Stream<String> getNameEverySecond() {
//   var i = 0;
//   return Stream.periodic(const Duration(seconds: 1), (value) {
//     i++;
//     return "Foo $i";
//   });
// }

// void testStream() async {
//   await for (final value in getName()) {
//     print("stream value $value");
//   }
//   print("stream finished working");
//   await for (final name in getNameEverySecond()) {
//     if (name == "Foo 10") {
//       break;
//     }
//     print("get name every second: $name");
//   }
// }

Iterable<int> getNumber() sync* {
  for (var i = 0; i < 10; i++) {
    yield i;
  }
}

void testYield() {
  for (final value in getNumber()) {
    print("yield number: $value");
  }
}

class PairOfString {
  final String value1;
  final String value2;

  PairOfString(this.value1, this.value2);
}

class PairOfIntegers {
  final int value1;
  final int value2;

  PairOfIntegers(this.value1, this.value2);
}

class Pair<A, B> {
  final A value1;
  final B value2;

  Pair(this.value1, this.value2);
}

void testGenerics() {
  final names = Pair("foo", 200);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // valueType();
    testClass();
    test();
    testYield();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // useMaterial3: true,
        // colorSchemeSeed: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
