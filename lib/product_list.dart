import 'package:flutter/material.dart';
import 'package:shop_app/global_variable.dart';
import 'package:shop_app/product_details_page.dart';
import 'package:shop_app/product_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  final List<String> filters = const [
    "All",
    "Adidas",
    "Puma",
    "Nikes"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filters[0];
  }

  late String selectedFilter;

  static const border = OutlineInputBorder(
    borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    borderSide: BorderSide(
      color: Color.fromRGBO(225, 225, 225, 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
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
              child: size.width > 600 ?
                  GridView.builder(
                      itemCount: products.length,

                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.5,
                      ),
                      itemBuilder: (context, index) {
                        final item = products[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return ProductDetailsPage(item: item,);
                                }
                            ),
                            );
                          },
                          child: ProductCard(
                            title: item['title'] as String,
                            price: item['price'] as double,
                            image: item['imageUrl'] as String,
                            backgroundColor: index.isEven ? const Color.fromRGBO(216, 240, 253, 1) : const Color.fromRGBO(245, 247, 249, 1),
                          ),
                        );
                      }
                      )
                  :
                ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index){
                    final item = products[index];
                    return  GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailsPage(item: item,);
                            }
                        ),
                        );
                      },
                      child: ProductCard(
                        title: item['title'] as String,
                        price: item['price'] as double,
                        image: item['imageUrl'] as String,
                        backgroundColor: index.isEven ? const Color.fromRGBO(216, 240, 253, 1) : const Color.fromRGBO(245, 247, 249, 1),
                      ),
                    );
                  }
              )
          )
        ],
      ),
    );
  }
}
