import 'package:flutter/material.dart';
import 'package:task_1/screens/category/drinks.dart';
import 'package:task_1/screens/category/food.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Foods()));
              },
              child: Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text(
                    'Ovqatlar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Drinks()));
              },
              child: Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text(
                    'Ichimliklar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
