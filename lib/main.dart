import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numero de pessoas no app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          const MyHomePage(title: 'Aplicação de contador númerico de pessoas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int randomNumber = 0;
  var randomColor = [
    Color.fromARGB(255, 35, 160, 118),
    Color.fromARGB(255, 194, 93, 148),
    Colors.white70,
    Color.fromARGB(255, 189, 214, 99),
    Colors.amberAccent,
    Color.fromARGB(255, 230, 177, 134)
  ];
  Color selectedColor = Color.fromARGB(255, 23, 87, 170);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _randomColor() {
    setState(() {
      Random random = new Random();
      randomNumber = random.nextInt(6);
      selectedColor = randomColor[randomNumber];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(179, 177, 221, 235),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Número de pessoas contados:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            if (_counter == 50)
              const Text(
                'Você clicou demais, dê uma respirada',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color.fromARGB(255, 5, 86, 124),
                ),
              )
          ],
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        FloatingActionButton(
          onPressed: _counter != 0 ? _decrementCounter : null,
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: _counter != 10 ? _incrementCounter : null,
          tooltip: 'Increment',
          disabledElevation: 10,
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: _randomColor,
          tooltip: 'Random Color of Background',
          child: const Icon(Icons.autorenew),
        ),
      ]),
      backgroundColor: selectedColor,
    );
  }
}
