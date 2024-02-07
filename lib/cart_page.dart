import 'package:flutter/material.dart';
import 'package:shop_app/global_variable.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (BuildContext context, int index){
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              ),
              trailing: IconButton(onPressed: (){
                debugPrint('hiii');
              },
              color: Colors.red, icon: const Icon(Icons.delete),),
              title: Text(cartItem['title'] as String),
              subtitle: Text('Size: ${cartItem['size']}'),
            );
          }
          )
    );
  }
}
