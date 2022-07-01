import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';

class utsScreen extends StatefulWidget{
  const utsScreen({Key? key}) : super(key: key);
  @override
    utsScreenstate createState()=>
      utsScreenstate();
}

class utsScreenstate extends State<utsScreen>{
  final TextEditingController? controllerlampu1 = TextEditingController();
  final TextEditingController? controllerlampu2 = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference iot = FirebaseFirestore.instance.collection('iot');

  @override
  void initState(){
    super.initState();
  }

  Future<void> updateFirestore(String perintah1, String perintah2) {
    print("send perintah");
    return iot.doc('perintah').update({'lampu_1': perintah1, 'lampu_2': perintah2}).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Berhasil")));
    }).catchError((error) {
      print("$error");
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to update firestore")));
    });
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Uts 1220428",
          style: TextStyle(color: Colors.white)
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(15,30,15,5),
            child: TextFormField(
              controller: controllerlampu1,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),

              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.abc_rounded,
                  color: Colors.grey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                    const BorderSide(color: Colors.orange, width: 0.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.grey,
                hintText: "Masukkan Perintah 1",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: "verdana_regular",
                ),
                labelText: 'Perintah 1',
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: "verdana_regular",
                ),
              ),
            ),
          ),
          
          Container(
            margin: EdgeInsets.fromLTRB(15,20,15,15),
            child: TextFormField(
              controller: controllerlampu2,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),

              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.abc_rounded,
                  color: Colors.grey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                    const BorderSide(color: Colors.orange, width: 0.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                fillColor: Colors.grey,
                hintText: "Masukkan Perintah 2",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: "verdana_regular",
                ),
                labelText: 'Perintah 2',
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: "verdana_regular",
                ),
              ),
            ),
          ),

          Container(
            height: 20,
          ),

          GFButton(
            onPressed: () async{
            String? perintah1 = controllerlampu1!.text.toString();
            String? perintah2 = controllerlampu2!.text.toString();
            updateFirestore(perintah1, perintah2);
            },
            text: "Kirim",
            shape: GFButtonShape.pills,
            fullWidthButton: true,
          ),
        ],
      ),
    );
  }
}