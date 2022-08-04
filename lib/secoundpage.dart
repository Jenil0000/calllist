
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'Dbhelper.dart';

class secoundpage extends StatefulWidget {
  const secoundpage({Key? key}) : super(key: key);

  @override
  State<secoundpage> createState() => _secoundpageState();
}


class _secoundpageState extends State<secoundpage> {
  TextEditingController name=TextEditingController();
  TextEditingController contact=TextEditingController();
  Database? db;
  late int id1;
  String msg="";
  @override
  void initState() {
    super.initState();
    Dbhelper().createdatabase().then((value){
      db=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Contact")),
      body: ListView(
        children: [
          TextField(controller: name,
          decoration: InputDecoration(
            hintText: "Enter name",
            prefixIcon: Icon(Icons.person),
          ),),
          TextField(controller: contact,
            decoration: InputDecoration(
              hintText: "Enter number",
              prefixIcon: Icon(Icons.calculate),
            ),),
          ElevatedButton(onPressed: () async{
            String tname=name.text;
            String tcontact=contact.text;

            String qry ="insert into Test(tname,tcontact) values('$tname','$tcontact')";
            int id = await db!.rawInsert(qry);
            print(id);


          }, child: Text("Save"))
  ],
      ),
    );
  }
}
