import 'package:flutter/material.dart';

class RetryDialog extends StatelessWidget {
  final VoidCallback onRetry;

  const RetryDialog({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Sem Conexão',
        textAlign: TextAlign.center,
      ),
      content: const Text(
          'Não foi possível carregar os dados de conversão. Deseja tentar novamente?'),
      actions: [
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onRetry();
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Tentar novamente',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
