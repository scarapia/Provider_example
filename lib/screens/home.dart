import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/counter_provider.dart';
import 'package:provider_example/providers/second_counter.dart';
import 'package:provider_example/providers/shopping_cart_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Provider Example App (${context.watch<SecondCounter>().count})'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'You have pushed the button this many times: ${context.watch<SecondCounter>().count}'),
            Text( //Displaying times pushed
              "${context.watch<SecondCounter>().count}",
              style: Theme.of(context).textTheme.headline1,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Launch screen'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: context.watch<ShoppingCart>().count,
                  itemBuilder: (bc, index) {
                    return Text("dsa");
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            key: Key('decrement_floatingActionButton'),
            onPressed: () =>
                context.read<SecondCounter>().decrementFromCounterTwo(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            heroTag: null,
            key: Key('reset_floatingActionButton'),
            onPressed: () => context.read<SecondCounter>().resetCounterTwo(),
            tooltip: 'Reset',
            child: Icon(Icons.exposure_zero),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            heroTag: null,
            key: Key('increment_floatingActionButton'),
            onPressed: () => context.read<SecondCounter>().addToCounterTwo(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
