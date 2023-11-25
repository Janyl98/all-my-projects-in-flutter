import 'package:counter_app_bloc/bloc/bloc.dart';
import 'package:counter_app_bloc/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, int>(builder: (context, state) {
              return Text(
                '$state',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const SecondPage(),
                  ),
                );
              },
              child: const Text('go to second page'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterCubit>().increment(),
        // onPressed: context.read<CounterCubit>().increment,
        // onPressed: () {
        //   context.read<CounterCubit>().increment();
        // },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
