import 'dart:convert';

import 'package:aqarat/DealCard.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future<Map> load() async {
  var client = http.Client();
  var response =
      await client.get(Uri.parse('https://saebalaqar.herokuapp.com/current/'));
  client.close();
  return jsonDecode(response.body);
}

class DealingsList extends StatefulWidget {
  DealingsList({Key key}) : super(key: key);

  @override
  _DealingsListState createState() => _DealingsListState();
}

class _DealingsListState extends State<DealingsList> {
  @override
  void initState() {
    super.initState();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('aqarat'),
        ),
        body: FutureBuilder<Map>(
            future: load(),
            builder: (cotext, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Text('loading...');
              }
              return ListView(
                children: snapshot.data['results']
                    .map((value) {
                      print(value);
                      return DealCard(
                        description: value['description:'],
                        landType: value['type:'],
                        price: value['price:'].toString(),
                      );
                    })
                    .cast<Widget>()
                    .toList(),
              );
            }));
  }
}
