import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intership_cycle_two/task_provider.dart';
import 'package:provider/provider.dart';

import 'package:intership_cycle_two/user_profile_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: kIsWeb
        ? const FirebaseOptions(
      apiKey: "AIzaSyCkWuspvlmBniW30Lor-e9PT-9IxOBcXzM",
      authDomain: "project-6433460138144569208.firebaseapp.com",
      projectId: "project-6433460138144569208",
      storageBucket: "project-6433460138144569208.appspot.com",
      messagingSenderId: "1069182109322",
      appId: "1:1069182109322:web:1d60d48e874bb11c2ecf73",
      measurementId: "G-XCGWXNTCTS",
    )
        : null,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()), // 🔥 Task State Provider
      ],
      child: MaterialApp(
        title: 'Firebase Auth + API',
        theme: ThemeData(
          fontFamily: null,
          primarySwatch: Colors.green,
        ),
        home: const UserWrapper(), // checks login and navigates
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
