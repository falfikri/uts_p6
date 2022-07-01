import 'package:firebase_core/firebase_core.dart';
// import 'package:uts_1220428/ui/uts_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      projectId: "uts1220428",
      appId: "1:422923385747:android:2cb70f27a39c676f2e0666",
      apiKey: "AIzaSyAunRNwpq_Xrn4IvJm_39tfAMvLuaHUXfo",
      messagingSenderId: "",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firestore App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const FirestoreScreen(),
    );
  }
}