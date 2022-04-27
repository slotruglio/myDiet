import 'package:diet/components/bottomAppBar.dart';
import 'package:diet/components/day.dart';
import 'package:diet/components/ratioPage.dart';
import 'package:diet/routes/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myDiet App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: const ColorScheme(
          primary: Color(0xFFFFC107),
          secondary: Color(0xFFFFC107),
          surface: Color(0xFFFFC107),
          background: Color(0xFFFFC107),
          error: Color(0xFFFFC107),
          onPrimary: Color(0xFFFFC107),
          onSecondary: Color.fromARGB(255, 4, 0, 3),
          onSurface: Color(0xFFFFC107),
          onBackground: Color(0xFFFFC107),
          onError: Color(0xFFFFC107),
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: const ColorScheme(
          primary: Color(0xFFFFC107),
          secondary: Color(0xFFFFC107),
          surface: Color(0xFFFFC107),
          background: Color(0xFFFFC107),
          error: Color(0xFFFFC107),
          onPrimary: Color(0xFFFFC107),
          onSecondary: Color.fromARGB(255, 217, 217, 217),
          onSurface: Color(0xFFFFC107),
          onBackground: Color(0xFFFFC107),
          onError: Color(0xFFFFC107),
          brightness: Brightness.dark,
        ),
      ),
      home: const MyHomePage(title: 'myDiet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
  bool _isSport = false;

  void _setSportDay() {
    setState(() {
      _isSport = true;
    });
  }
  void _setNormalDay() {
    setState(() {
      _isSport = false;
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
      body: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text(_isSport ? 'Sport Day' : 'Normal Day', style: TextStyle(color: Theme.of(context).colorScheme.onSecondary)),
          ),
          SliverList(delegate: SliverChildListDelegate([DayDiet(isSport: _isSport)]))
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(
        isSport: _isSport,
        onSportPressed: _setSportDay,
        onNormalPressed: _setNormalDay,
        theme: Theme.of(context),
      ),// This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButton: 
            FloatingActionButton(onPressed: () {
              Navigator.of(context).push(ratioRoute());
            }, child: const Icon(Icons.bar_chart)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
