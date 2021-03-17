import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DealCard extends StatelessWidget {
  const DealCard({
    Key key,
    this.price,
    this.landType,
    this.description,
  }) : super(key: key);
  final String price;
  final String landType;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.account_box_rounded),
              title: Text(price),
              subtitle: Text(description),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(landType)],
            )
          ],
        ),
      ),
    );
  }
}
