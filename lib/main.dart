import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sample'),
        ),
        body: Column(
          children: <Widget>[
            _LinedCellWithStack(Colors.red, _buildSmallWidget()),
            _LinedCellWithStack(Colors.green, _buildBigWidget()),
            Container(
              height: 24,
              color: Colors.grey,
            ),
            _LinedCellWithRow(Colors.orange, _buildSmallWidget()),
            _LinedCellWithRow(Colors.blue, _buildBigWidget()),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}

// work well
class _LinedCellWithStack extends StatelessWidget {
  _LinedCellWithStack(this.color, this.child);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            color: color,
          ),
          left: 48,
          width: 8,
          // fit parent height
          top: 0,
          bottom: 0,
        ),
        Padding(
          padding: EdgeInsets.only(left: 72, top: 16, bottom: 16, right: 16),
          child: child,
        ),
      ],
    );
  }
}

// not work
class _LinedCellWithRow extends StatelessWidget {
  _LinedCellWithRow(this.color, this.child);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 48),
          child: Container(
            color: color,
            height: 20, // double.infinity won't work!
            width: 8,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: child,
        ),
      ],
      mainAxisSize: MainAxisSize.max,
    );
  }
}

Widget _buildSmallWidget() {
  return Text("small widget");
}

Widget _buildBigWidget() {
  return Row(
    children: <Widget>[
      Icon(Icons.train),
      Text(
        'Big Widget',
        style: TextStyle(fontSize: 36),
      ),
    ],
  );
}
