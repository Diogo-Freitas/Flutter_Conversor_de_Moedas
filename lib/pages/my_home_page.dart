import 'package:flutter/material.dart';
import '../widgets/build_text_field.dart';
import '../controllers/converter_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ConverterController _controller = ConverterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text(widget.title,
            style: const TextStyle(fontWeight: FontWeight.w500)),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _controller.clearFields();
              });
            },
            icon: const Icon(Icons.refresh),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.monetization_on, size: 150, color: Colors.amber),
            const SizedBox(height: 16),
            BuildTextField(
              label: 'Reais',
              prefix: 'R\$ ',
              controller: _controller.realController,
              onChanged: _controller.realChanged,
            ),
            const SizedBox(height: 16),
            BuildTextField(
              label: 'Dólares',
              prefix: 'US\$ ',
              controller: _controller.dolarController,
              onChanged: _controller.dolarChanged,
            ),
            const SizedBox(height: 16),
            BuildTextField(
              label: 'Euros',
              prefix: '€ ',
              controller: _controller.euroController,
              onChanged: _controller.euroChanged,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}