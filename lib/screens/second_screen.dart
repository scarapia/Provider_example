import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/counter_provider.dart';
import 'package:provider_example/providers/second_counter.dart';
import 'package:provider_example/providers/shopping_cart_provider.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example App (${context.watch<SecondCounter>().count})'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('${context.watch<ShoppingCart>().count}'),
            Text('${context.watch<ShoppingCart>().cart}'),
          ],
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          heroTag: null,
          key: Key('addItem_floatingActionButton'),
          onPressed: () => context.read<ShoppingCart>().addItem('Bread'),
          tooltip: 'Add Item',
          child: Icon(Icons.add),
        ),
        FloatingActionButton(
          heroTag: null,
          key: Key('removeItem_floatingActionButton'),
          onPressed: () => context.read<ShoppingCart>().removeItem("Bread"),
          tooltip: 'Remove Item',
          child: Icon(Icons.remove),
        ),
      ]),
    );
  }
}
