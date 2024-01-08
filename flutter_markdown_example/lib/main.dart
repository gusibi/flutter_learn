import 'package:flutter/material.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:flutter_markdown_selectionarea/flutter_markdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Markdown Page'),
    );
  }
}

class CodeElementBuilder extends MarkdownElementBuilder {
  bool isCodeBlock(md.Element element) {
    if (element.attributes['class'] != null) {
      return true;
    } else if (element.textContent.contains("\n")) {
      return true;
    }
    return false;
  }

  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    if (!isCodeBlock(element)) {
      return Container(
        padding: const EdgeInsets.all(2),
        child: Text(
          element.textContent,
          style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: preferredStyle!.color),
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(10),
        child: Text(
          element.textContent,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      );
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var markdown = """
# This is example

Here's a simple Go program that prints "Hello, world!" to the console😀:

```go
package main
import "fmt"

func main() {
    fmt.Println("Hello, world!")
}
```

Save the above code in a file with a `.go` extension, for example `hello.go`. Then, you can run the program by executing the following command in your terminal:

```shell
go run hello.go
```

The output will be:

```
Hello, world!
```
""";
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: SelectionArea(
            child: Markdown(
              // selectable: true,
              data: markdown,
              builders: {
                'code': CodeElementBuilder(),
              },
              styleSheet: MarkdownStyleSheet(
                h1: const TextStyle(fontSize: 24, color: Colors.blue),
                code: const TextStyle(
                    fontSize: 14,
                    color: Colors.pink,
                    backgroundColor: Colors.grey),
                codeblockPadding: const EdgeInsets.all(8),
                codeblockDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ));
  }
}
