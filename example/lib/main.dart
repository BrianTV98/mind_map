import 'package:flutter/material.dart';
import 'package:mind_map/mind_map.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Mind map'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10).copyWith(right: 0),
                margin: const EdgeInsets.only(left: 10),
                child: const Text('Parent MindMap'),
              ),
              MindMap(
                padding: const EdgeInsets.only(left: 50),
                dotRadius: 4,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10).copyWith(right: 0),
                        child: const Text('Component 1'),
                      ),
                      MindMap(
                        dotRadius: 4,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: const Text('Component 2'),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: const Text('Component 3'),
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10).copyWith(right: 0),
                                child: const Text('Component 4'),
                              ),
                              MindMap(dotRadius: 4, children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  child: const Text('Component 5'),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  child: const Text('Component 6'),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  child: const Text('Component 7'),
                                ),
                              ]),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('12313');
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: const Text('Component 2'),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: const Text('Component 5'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: const Text('Component 5'),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10).copyWith(right: 0),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: const Text('Component 5121212121'),
                      ),
                      MindMap(
                        dotRadius: 4,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: const Text('Component 5121212121'),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: const Text('Component 5121212121'),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: const Text('Component 5121212121'),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: const Text('Component 5121212121'),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: const Text('Component 5121212121'),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
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
