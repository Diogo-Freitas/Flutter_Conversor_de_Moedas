import 'package:conversor_de_moedas/pages/my_home_page.dart';
import 'package:conversor_de_moedas/widgets/retry_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Map> _futureResponse;
  bool _isShowingDialog = false;

  @override
  void initState() {
    super.initState();
    _futureResponse = getResponse();
  }

  void _showErrorDialog(BuildContext context) {
    if (_isShowingDialog) return;

    setState(() {
      _isShowingDialog = true;
    });

    showDialog(
      context: context,
      builder: (context) {
        return RetryDialog(
          onRetry: () {
            setState(() {
              _isShowingDialog = false;
              _futureResponse = getResponse();
            });
          },
        );
      },
    ).then((_) {
      setState(() {
        _isShowingDialog = false;
      });
    });
  }

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
        future: _futureResponse,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!_isShowingDialog) {
                _showErrorDialog(context);
              }
            });
            return const Center(
              child: CircularProgressIndicator(),
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