import 'package:conversor_de_moedas/pages/my_home_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Moedas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<Map>(
        future: getResponse(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Erro ao carregar dados!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            );
          } else {
            return MyHomePage(
              title: '\$ Conversor \$',
              response: snapshot.data,
            );
          }
        },
      ),
    );
  }
}

Future<Map> getResponse() async {
  var response = await http.get(
      Uri.https('economia.awesomeapi.com.br', '/json/last/USD-BRL,EUR-BRL'));

  return json.decode(response.body);
}