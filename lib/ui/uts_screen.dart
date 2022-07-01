import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  Future<void> updateFirestore(String? value) {
    print("send perintah");
    return iot.doc('perintah').update({'lampu_1': value}).then((value) {
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
        
      ),
    );
  }
}