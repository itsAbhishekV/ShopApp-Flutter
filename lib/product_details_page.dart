import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';
// import 'package:shop_app/global_variable.dart';

class ProductDetailsPage extends StatefulWidget {

  final Map<String, Object> item;

  const ProductDetailsPage({
    super.key,
    required this.item,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  late int selectedSize = 0;

  void onTap(){
    if(selectedSize != 0){
      Provider.of<CartProvider>(context, listen: false).addProduct(
          {'id': widget.item['id'],
            'title': widget.item['title'],
            'price': widget.item['price'],
            'imageUrl': widget.item['imageUrl'],
            'company': widget.item['company'],
            'size': selectedSize
          }
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${widget.item['title']} added to Cart!')));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a size')));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
          ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.item['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(widget.item['imageUrl'] as String, height: 230,),
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
                  Text('\$${widget.item['price']}',
                  style: Theme.of(context).textTheme.titleMedium,),
                  const SizedBox(height: 14,),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.item['sizes'] as List<int>).length,
                      itemBuilder: (BuildContext context, int index) {
                        final size = (widget.item['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                                backgroundColor: selectedSize == size ? Theme.of(context).colorScheme.primary : const Color.fromRGBO(245, 247, 249, 1),
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                label: Text(size.toString()),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton.icon(
                        icon: const Icon(Icons.shopping_cart),
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.black,
                          fixedSize: const Size(320, 50),
                        ),
                        label: const Text('Add to cart'),
                    ),
                  )
                ]
              ),
              ),
          ]
        )
      )
    );
  }
}
