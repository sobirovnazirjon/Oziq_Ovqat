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
            "Shorwa is a traditional Afghan dish which is a simple dish which is usually mixed with bread on the dastarkhān. It is a long process and a pressure-cooker is usually used, as it reduces the process to 2 hours. The main ingredients for shorwa are potatoes, beans and meat. It is commonly served with Afghan bread.",
        photo:
            "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D",
        price: 33000),
    OvqatModel(
        title: "Ovqat 2",
        description:
            "Shorwa is a traditional Afghan dish which is a simple dish which is usually mixed with bread on the dastarkhān. It is a long process and a pressure-cooker is usually used, as it reduces the process to 2 hours. The main ingredients for shorwa are potatoes, beans and meat. It is commonly served with Afghan bread.",
        photo:
            "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTB8fHxlbnwwfHx8fHw%3D",
        price: 66000),
    OvqatModel(
        title: "Ovqat 3",
        description:
            "Shorwa is a traditional Afghan dish which is a simple dish which is usually mixed with bread on the dastarkhān. It is a long process and a pressure-cooker is usually used, as it reduces the process to 2 hours. The main ingredients for shorwa are potatoes, beans and meat. It is commonly served with Afghan bread.",
        photo:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXqZudfVlYvy3JYn1auBHENSe4v6W3qHXpE5c6XdnmHi1ggI5zQu70IWFbUDKZXHILn_k&usqp=CAU",
        price: 44000),
    OvqatModel(
        title: "Ovqat 4",
        description:
            "Shorwa is a traditional Afghan dish which is a simple dish which is usually mixed with bread on the dastarkhān. It is a long process and a pressure-cooker is usually used, as it reduces the process to 2 hours. The main ingredients for shorwa are potatoes, beans and meat. It is commonly served with Afghan bread.",
        photo: "https://api.time.com/wp-content/uploads/2015/06/veggies.jpg",
        price: 23000),
    OvqatModel(
        title: "Ovqat 5",
        description:
            "Shorwa is a traditional Afghan dish which is a simple dish which is usually mixed with bread on the dastarkhān. It is a long process and a pressure-cooker is usually used, as it reduces the process to 2 hours. The main ingredients for shorwa are potatoes, beans and meat. It is commonly served with Afghan bread.",
        photo:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwg9cO6O2h0G3IueLJLHzAivfuWaGbEfSRgUwHeaBvuFptTrMyyH5JwToCQXoIpQQKRJM&usqp=CAU",
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
            color: Colors.blue,
            image: DecorationImage(
                image: NetworkImage(model.photo), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(13)),
      ),
    );
  }
}
