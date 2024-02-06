import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {

  final Map<String, Object> item;

  const ProductDetailsPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        leading: Center(
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              debugPrint('hiii');
            }
          ),
        ),
      ),
      body: Center(
        child: Text(item['title'] as String)
      )
    );
  }
}
