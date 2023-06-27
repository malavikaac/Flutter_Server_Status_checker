import 'package:flutter/material.dart';
import 'package:server_status_demo/serverPage.dart';
import 'package:provider/provider.dart';

import 'apiservice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ApiService>(create: ((context) => ApiService()))
      ],
      child: MaterialApp(
        home: ServerPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
