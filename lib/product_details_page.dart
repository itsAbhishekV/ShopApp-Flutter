import 'package:flutter/material.dart';
import 'package:shop_app/global_variable.dart';

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
        child: Column(
          children: [
            Text(item['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(item['imageUrl'] as String),
            ),
            const Spacer(flex: 2),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                height: 220,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  color: Color.fromRGBO(245, 247, 249, 1),
                ),
              child: Column(
                children: [
                  Text('\$${item['price']}',
                  style: Theme.of(context).textTheme.titleMedium,),
                  const SizedBox(height: 14,),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (item['sizes'] as List<int>).length,
                      itemBuilder: (BuildContext context, int index) {
                        final size = (item['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Chip(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              label: Text(size.toString()),
                          ),
                        );
                      },
                    ),
                  ),
                ]
              ),
              ),
          ]
        )
      )
    );
  }
}
