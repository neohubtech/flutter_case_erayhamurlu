import 'package:flutter/material.dart';
import 'package:test_app/provider/bottom_bar_view_provider.dart';
import 'package:test_app/provider/cart_view_provider.dart';
import 'package:test_app/view/bottom_bar_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => BottomBarViewProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => CartViewProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BottomBarView(),
    );
  }
}
