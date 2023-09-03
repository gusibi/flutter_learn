import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'color_schemes.g.dart';
import 'color_schemes.g1.dart';
import 'color_schemes.g2.dart';
import 'theme_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child:
            Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: ThemeData(
                useMaterial3: true, colorScheme: themeProvider.lightScheme),
            darkTheme: ThemeData(
                useMaterial3: true, colorScheme: themeProvider.darkScheme),
            themeMode: themeProvider.themeMode,
            home: const HomePage(),
          );
        }));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar"),
        backgroundColor: defaultColorScheme.primaryContainer,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              defaultColorScheme.primary),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              defaultColorScheme.onPrimary)),
                      onPressed: () {},
                      child: const Text('primary'),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              defaultColorScheme.onPrimary),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              defaultColorScheme.primary)),
                      onPressed: () {},
                      child: const Text('onPrimary'),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              defaultColorScheme.primaryContainer),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              defaultColorScheme.onPrimaryContainer)),
                      onPressed: () {},
                      child: const Text('primaryContainer'),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              defaultColorScheme.onPrimaryContainer),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              defaultColorScheme.primaryContainer)),
                      onPressed: () {},
                      child: const Text('onPrimaryContainer'),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              defaultColorScheme.secondary),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              defaultColorScheme.onSecondary)),
                      onPressed: () {},
                      child: const Text('secondary'),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              defaultColorScheme.onSecondary),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              defaultColorScheme.secondary)),
                      onPressed: () {},
                      child: const Text('onSecondary'),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              defaultColorScheme.tertiary),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              defaultColorScheme.onTertiary)),
                      onPressed: () {},
                      child: const Text('tertiary'),
                    )),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {
                      themeProvider.setThemeMode(ThemeMode.light);
                    },
                    child: const Text("light")),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      themeProvider.setThemeMode(ThemeMode.dark);
                    },
                    child: const Text("dark")),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {
                      themeProvider.setLightScheme(lightColorScheme);
                    },
                    child: const Text("lightColor")),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      themeProvider.setDarkScheme(darkColorScheme);
                    },
                    child: const Text("darkColor")),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {
                      themeProvider.setLightScheme(lightColorScheme1);
                    },
                    child: const Text("lightColor1")),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      themeProvider.setDarkScheme(darkColorScheme1);
                    },
                    child: const Text("darkColor1")),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {
                      themeProvider.setLightScheme(lightColorScheme2);
                    },
                    child: const Text("lightColor2")),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      themeProvider.setDarkScheme(darkColorScheme2);
                    },
                    child: const Text("darkColor2")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
