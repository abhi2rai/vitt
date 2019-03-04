import 'package:flutter/material.dart';

import 'current_quote_view.dart';
import 'exchange_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vitt',
      theme: ThemeData(
          primaryColorDark: Colors.black,
          brightness: Brightness.dark,
          accentColor: Colors.green,
          primarySwatch: Colors.green
      ),
      home: MyHomePage(title: 'Vitt'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    CurrentQuoteView(),
    ExchangeView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment),
              title: Text('Stocks')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              title: Text('FX')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.broken_image),
              title: Text('Crypto')
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
