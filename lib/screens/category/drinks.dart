import 'package:flutter/material.dart';

import '../../model/ovqat_model.dart';
import '../add.dart';

class Drinks extends StatefulWidget {
  const Drinks({super.key});

  @override
  State<Drinks> createState() => _DrinksState();
}

class _DrinksState extends State<Drinks> {
  List<OvqatModel> ovqatlar = [
    OvqatModel(
        title: "Coca Cola",
        description:
            "Coca-Cola's exact formula is a closely guarded secret, but generally, it contains carbonated water, high fructose corn syrup or sucrose, caramel color, phosphoric acid, natural flavors, and caffeine. Keep in mind that ingredient lists may vary slightly based on the region and specific product variations.",
        photo: "cola.jpg",
        price: 13000),
    OvqatModel(
        title: "Fanta",
        description:
            "Fanta's ingredients can vary by region, but a typical composition includes carbonated water, high fructose corn syrup or sugar, citric acid, natural and artificial flavors, sodium benzoate (preservative), and food coloring. It's important to check the specific product label for accurate information based on your location.",
        photo: "fanta.jpg",
        price: 12000),
    OvqatModel(
        title: "Chortoq",
        description:
            "healing, odorless and colorless water. According to its chemical composition, it is sodium sulfate chloride, water mineralization is 2.6 g/l with rN=7.2, and it contains 14 mg/l silicic acid.",
        photo: "chortoq.jpg",
        price: 20000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ichimliklar',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => design(ovqatlar[index]),
        itemCount: ovqatlar.length,
      ),
    );
  }

  InkWell design(OvqatModel model) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Add(
                    title: model.title,
                    photo: model.photo,
                    description: model.description,
                    price: model.price)));
      },
      child: Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/${model.photo}"),
                fit: BoxFit.fitHeight),
            borderRadius: BorderRadius.circular(13)),
      ),
    );
  }
}
