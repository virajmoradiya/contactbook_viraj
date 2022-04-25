import 'package:contactbook_viraj/dbase.dart';
import 'package:contactbook_viraj/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';

class addcontact extends StatefulWidget {
  const addcontact({Key? key}) : super(key: key);

  @override
  State<addcontact> createState() => _addcontactState();
}

class _addcontactState extends State<addcontact> {

  Database? db;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatabase();
  }

  getdatabase(){

    Dabase().Getdatabase().then((value) {

      setState(() {
        db = value;
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    double twidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double navbarheight = MediaQuery.of(context).padding.bottom;
    double appbarheight = kToolbarHeight;

    double bodyheight = theight - statusbarheight - navbarheight;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF286090),
          title: Text(
            "Create New Contact",
            style: TextStyle(fontSize: 25),
          )),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          child: Column(children: [
            Container(
              child: Stack(children: [
                Container(
                  child: Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF286090),
                        maxRadius: 53,
                        child: CircleAvatar(
                          backgroundImage: AssetImage("images/profile.png"),
                          maxRadius: 50,
                        ),
                      )),
                )
              ]),
              width: twidth,
              height: theight * 0.25,
              color: Color(0x6A286090),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, left: 35, right: 35, top: 35),
              child: TextField(
                  controller: name,
                  cursorColor: Color(0xFF286090),
                  cursorHeight: 20,
                  cursorRadius: Radius.circular(20),
                  decoration: InputDecoration(
                      hintText: "Enter Name",
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF286090), width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF286090))),
                      fillColor: Color(0xFF286090)),
                  style: TextStyle(fontSize: 20)),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 35, left: 35, right: 35, top: 25),
              child: TextField(
                  controller: number,
                  cursorColor: Color(0xFF286090),
                  cursorHeight: 20,
                  cursorRadius: Radius.circular(20),
                  decoration: InputDecoration(
                      hintText: "Enter Number",
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF286090), width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF286090))),
                      fillColor: Color(0xFF286090)),
                  style: TextStyle(fontSize: 20)),
            ),
            InkWell(onTap: () {
              String nname = name.text;
              String nnumber = number.text;

              Dabase().insertdata(nname,nnumber,db!);

              Fluttertoast.showToast(
                  msg: "Contact Saved Succesfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color(0xFF286090),
                  textColor: Colors.white,
                  fontSize: 18.0
              );

              Future.delayed(Duration(seconds: 2)).then((value){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return contactlist();
                },));
              });

            },
              child: Container(
                child: Center(
                    child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                )),
                height: bodyheight * 0.08,
                width: twidth * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFF286090)),
              ),
            )
          ]),
        )),
      ),
    );
  }

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
}
