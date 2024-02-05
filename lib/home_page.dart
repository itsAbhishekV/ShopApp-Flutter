import 'package:flutter/material.dart';
import 'package:shop_app/global_variable.dart';
import 'package:shop_app/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const [
    "All",
    "Adidas",
    "Puma",
    "Nikes"
  ];

  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {

    const border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Shoes\nCollection',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,

                ),),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                    hintText: 'Search',
                  ),
                )
              )
            ],
          ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                        child: Chip(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            backgroundColor: selectedFilter == filter ? Theme.of(context).colorScheme.primary :  const Color.fromRGBO(245, 247, 249, 1),
                            side: const BorderSide(
                              width: 2,
                              color: Color.fromRGBO(245, 247, 249, 1),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            label: Text(filter),
                            labelStyle: const TextStyle(
                              fontSize: 16,
                            ),
                        ),
                      ),
                    );
                  }
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index){
                      final item = products[index];
                      return  ProductCard(
                          title: item['title'] as String,
                          price: item['price'] as double,
                          image: item['imageUrl'] as String,
                          backgroundColor: index.isEven ? const Color.fromRGBO(216, 240, 253, 1) : const Color.fromRGBO(245, 247, 249, 1),
                      );
                    }
                )
            )
        ],
        ),
      )
    );
  }
}
