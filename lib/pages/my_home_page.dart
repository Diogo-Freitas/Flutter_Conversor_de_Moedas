import 'package:flutter/material.dart';
import '../widgets/build_text_field.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text(widget.title,
            style: const TextStyle(fontWeight: FontWeight.w500)),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.monetization_on, size: 150, color: Colors.amber),
            SizedBox(height: 16),
            BuildTextField(label :'Reais', prefix: 'R\$ '),
            SizedBox(height: 16),
            BuildTextField(label :'Dólares', prefix: 'US\$ '),
            SizedBox(height: 16),
            BuildTextField(label :'Euros', prefix: '€ '),
            SizedBox(height: 16),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}