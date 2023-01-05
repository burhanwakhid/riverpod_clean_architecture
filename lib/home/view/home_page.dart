import 'package:flutter/material.dart';
import 'package:riverpod_app/cart/cart.dart';
import 'package:riverpod_app/github_trending/github_trending.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const CartPage()));
            },
            child: const Text('Cart example'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const GithubTrendingPage()));
            },
            child: const Text('github api example'),
          ),
        ],
      ),
    );
  }
}
