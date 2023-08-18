

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerrr/productlist.dart';
import 'package:providerrr/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> ProviderClass(),
      child: const MaterialApp(

        home: ProductList(),
      ),
    ); // MaterialApp
  }
}






