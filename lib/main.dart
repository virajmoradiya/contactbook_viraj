import 'dart:ui';

import 'package:flutter/material.dart';

import 'addcontact.dart';

void main() {
  runApp(MaterialApp(
    home: contactlist(),
  ));
}

class contactlist extends StatefulWidget {
  const contactlist({Key? key}) : super(key: key);

  @override
  State<contactlist> createState() => _contactlistState();
}

class _contactlistState extends State<contactlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return addcontact();
              },
            ));
          },backgroundColor: Color(0xFF286090),
          label: Container(
            child: Row(children: [
              Icon(Icons.add, size: 30),
              Text(
                " Add Contact",
                style: TextStyle(fontSize: 25),
              )
            ]),
          )),
      appBar: AppBar(backgroundColor: Color(0xFF286090),
          title: Center(
        child: Text(
          "Contact Book",
          style: TextStyle(fontSize: 30),
        ),
      )),
    );
  }
}
