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
            "Shorwa is a traditional Afghan dish which is a simple dish which is usually mixed with bread on the dastarkhān. It is a long process and a pressure-cooker is usually used, as it reduces the process to 2 hours. The main ingredients for shorwa are potatoes, beans and meat. It is commonly served with Afghan bread.",
        photo:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAorkgg8NfSx0Qk3h7nFzqJJzKvRJ2c7x3NxCOrt4A9B87p3DKbXDsEuX709R8ATF1Xfk&usqp=CAU",
        price: 13000),
    OvqatModel(
        title: "Fanta",
        description:
            "Shorwa is a traditional Afghan dish which is a simple dish which is usually mixed with bread on the dastarkhān. It is a long process and a pressure-cooker is usually used, as it reduces the process to 2 hours. The main ingredients for shorwa are potatoes, beans and meat. It is commonly served with Afghan bread.",
        photo:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSO5zEnTCfIMoubFYVbIkGRmUI7MZ3AbLS8NA&usqp=CAU",
        price: 12000),
    OvqatModel(
        title: "Chortoq",
        description:
            "Shorwa is a traditional Afghan dish which is a simple dish which is usually mixed with bread on the dastarkhān. It is a long process and a pressure-cooker is usually used, as it reduces the process to 2 hours. The main ingredients for shorwa are potatoes, beans and meat. It is commonly served with Afghan bread.",
        photo:
            "https://storage.kun.uz/source/1/EaBHvheuq-Sbd6uU2sUsYl8X6NIYWSwJ.jpg",
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
            color: Colors.blue,
            image: DecorationImage(
                image: NetworkImage(model.photo), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(13)),
      ),
    );
  }
}
