import 'package:flutter/material.dart';
import 'package:praktikum_crud_flutter/ui/registrasi_page.dart';
import 'package:praktikum_crud_flutter/ui/login_page.dart';
import 'package:praktikum_crud_flutter/ui/produk_form.dart';
import 'package:praktikum_crud_flutter/ui/produk_detail.dart';
import 'package:praktikum_crud_flutter/ui/produk_page.dart';
import 'package:praktikum_crud_flutter/helpers/user_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

 

  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  Widget page = const CircularProgressIndicator();

 @override
 void initState() {
 super.initState();
 isLogin();
 }

 void isLogin() async {
 var token = await UserInfo().getToken();
 if (token != null) {
 setState(() {
 page = const ProdukPage();
 });
 } else {
 setState(() {
  page = const LoginPage();
 });
 }
 }

 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 title: 'Toko Kita',
 debugShowCheckedModeBanner: false,
 home: page,
 );
 }
 }