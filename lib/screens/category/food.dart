import 'package:flutter/material.dart';

import '../../model/ovqat_model.dart';
import '../add.dart';

class Foods extends StatefulWidget {
  const Foods({super.key});

  @override
  State<Foods> createState() => _DrinksState();
}

class _DrinksState extends State<Foods> {
  List<OvqatModel> ovqatlar = [
    OvqatModel(
        title: "Ovqat 1",
        description:
            "Ingredients: beef, tomatoes, cucumbers, eggs, beans, greens.Will be ready 40 minutes",
        photo: "1.jpg",
        price: 33000),
    OvqatModel(
        title: "Ovqat 2",
        description:
            "Ingredients: small tomatoes, peas, peppers and greens.Will be ready 40 minutes",
        photo: "2.jpg",
        price: 66000),
    OvqatModel(
        title: "Ovqat 3",
        description:
            "Ingredients: small tomatoes, peas, greens, lemon and avocado. Will be ready 40 minutes",
        photo: "3.jpg",
        price: 44000),
    OvqatModel(
        title: "Ovqat 4",
        description:
            "Salad composition: small tomatoes, cucumbers, greens, mushrooms and mint. Will be ready 40 minutes",
        photo: "4.jpg",
        price: 23000),
    OvqatModel(
        title: "Ovqat 5",
        description: "six types of soup and bread will be ready in 40 minutes",
        photo: "5.jpg",
        price: 12000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ovqatlar',
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
                image: AssetImage("assets/${model.photo}"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(13)),
      ),
    );
  }
}
