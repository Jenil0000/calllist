import 'package:calllist/Dbhelper.dart';
import 'package:calllist/secoundpage.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  List<Map<String,Object?>> l=[];
  bool status=false;


  @override
  void initState() {
    super.initState();
    getalldata();

  }
  getalldata()
  async{
    Database db=await Dbhelper().createdatabase();
    String qry ="Select * from Test";
    l = await db.rawQuery(qry);
    print(l);
    status=true;
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ContacBook"),),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return secoundpage();
        }));
      },child: Icon(Icons.add),),
      body: status ? (
    l.length>0 ? ListView.builder(
      itemCount: l.length,
      itemBuilder: (context, index) {
        Map m = l[index];
        print(l);
        print("hello");
        return ListTile(
          leading: Text("${m['id']}"),
          title: Text("${m['name']}"),
          subtitle: Text("${m['contact']}"),
        );
      },) : Center(child: Text("No Data Found."),)
    ) : Center(child: CircularProgressIndicator(),),
    );
  }
}
