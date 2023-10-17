import 'package:declarative_and_imperative_practice/view/declarative.dart';
import 'package:declarative_and_imperative_practice/view/imperative.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Declarative(),
                  ),
                );
              },
              child: const Text('declarative method'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Imperative(),
                  ),
                );
              },
              child: const Text('imperative method'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('imperative method with the flutter widget'),
            ),
          ],
        ),
      ),
    );
  }
}
