import 'package:doodle_app/bloc/product/product_bloc.dart';
import 'package:doodle_app/bloc/product/product_event.dart';
import 'package:doodle_app/models/product_detail.dart';
import 'package:doodle_app/presentation/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ProductDetailAdapter());
  await Hive.openBox<ProductDetail>('cart'); 

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => ProductBloc()..add(FetchProducts()),
        child: ProductListScreen(),
      ),
    );
  }
}