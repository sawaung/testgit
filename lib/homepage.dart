import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final Matrix4 _begin = Matrix4.compose(vector.Vector3(0, 0, 1),
      vector.Quaternion.euler(0, 0, 0), vector.Vector3(1, 1, 1));

  final Matrix4 _midway = Matrix4.compose(vector.Vector3(0, 0, 1),
      vector.Quaternion.euler(1, -0.2, 0), vector.Vector3(.8, .8, .8));

  final Matrix4 _final = Matrix4.compose(vector.Vector3(0, 0, 1),
      vector.Quaternion.euler(-1, 0, 0), vector.Vector3(1, 1, 1));

  Matrix4 _target = Matrix4.compose(vector.Vector3(0, 0, 1),
      vector.Quaternion.euler(1, -0.2, 0), vector.Vector3(0.8, 0.8, 0.8));

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween(begin: _begin, end: _target),
        duration: Duration(seconds: 5),
        builder: (BuildContext context, Matrix4 value, Widget? _) {
          return Transform(
            transform: value,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Kindacode.com'),
              ),
              body: Center(
                child: Container(width: 200, height: 200, color: Colors.amber),
              ),
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (_target == _begin) {
                        _target = _midway;
                      } else if (_target == _midway) {
                        _target = _final;
                      } else {
                        _target = _begin;
                      }
                    });
                  },
                  child: Icon(Icons.rotate_left)),
            ),
          );
        });
  }
}
