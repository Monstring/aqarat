import 'package:aqarat/DealingsList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingDummy extends StatefulWidget {
  LoadingDummy({Key key}) : super(key: key);

  @override
  _LoadingDummyState createState() => _LoadingDummyState();
}

class _LoadingDummyState extends State<LoadingDummy> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((__) => Navigator.push(
        context, MaterialPageRoute(builder: (_) => DealingsList())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        child: Center(
          child: Text('loading'),
        ),
      ),
    );
  }
}
