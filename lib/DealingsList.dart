import 'dart:convert';

import 'package:aqarat/DealCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

String fakeData = """{
  "results": [
    {"price": "8, 000", "type": "House", "description": "a smol house"},
    {"price": "32, 000", "type": "Mansion", "description": "very big chungus"},
    {"price": "4, 000", "type": "villa", "description": "2 people can fit inside"}
  ]
}""";
var map = jsonDecode(fakeData);

class DealingsList extends StatefulWidget {
  DealingsList({Key key}) : super(key: key);

  @override
  _DealingsListState createState() => _DealingsListState();
}

class _DealingsListState extends State<DealingsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <DealCard>[
          map['results'].map((value) {
            return DealCard(
              description: value['description'],
              landType: value['type'],
              price: value['price'],
            );
          }),
          DealCard(
            description: 'my only house',
            landType: 'House',
            price: '5,000',
          ),
          DealCard(
            description: 'I have a bunch of houses',
            landType: 'House',
            price: '9,000',
          ),
          DealCard(
            description: 'can\'t handle bills',
            landType: 'Mansion',
            price: '14,000',
          ),
        ],
      ),
    );
  }
}
