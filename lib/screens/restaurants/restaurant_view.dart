import 'package:flutter/material.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant Name"),
        backgroundColor: Colors.blue,
      ),
      body: const Text("RESTAURANT VIEW"),
    );
  }
}
