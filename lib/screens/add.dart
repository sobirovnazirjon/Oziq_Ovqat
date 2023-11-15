// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_1/database/db.dart';

class Add extends StatefulWidget {
  Add(
      {super.key,
      this.id,
      required this.title,
      required this.photo,
      required this.description,
      required this.price,
      this.summ});
  int? id;
  String title;
  String photo;
  String description;
  int price;
  int? summ;
  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  int number = 1;
  getCount() {
    if (widget.summ != null) {
      setState(() {
        number = widget.summ! ~/ widget.price;
      });
    }
  }

  @override
  void initState() {
    getCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buyurtma qilish',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                if (widget.id == null) {
                  await DBHelper.createItems(
                      title: widget.title,
                      photo: widget.photo,
                      description: widget.description,
                      number: number,
                      summ: widget.price * number);
                } else if (widget.id != null) {
                  await DBHelper.updateItems(
                      id: widget.id!,
                      title: widget.title,
                      photo: widget.photo,
                      description: widget.description,
                      number: number,
                      summ: widget.price * number);
                }
                Navigator.pop(context);
              },
              icon: const Icon(Icons.playlist_add_outlined))
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width * .25,
        color: Colors.blue,
        child: Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text('Jami: ${widget.price * number} sum'),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      if (number > 1) {
                        setState(() {
                          number--;
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                Text(
                  "${number == 10 ? 'Max' : number}",
                  style: const TextStyle(color: Colors.white),
                ),
                Transform.rotate(
                  angle: pi,
                  child: IconButton(
                      onPressed: () {
                        if (number < 10) {
                          setState(() {
                            number++;
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                ),
              ],
            )
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(widget.photo))),
            ),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              widget.description,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            )
          ],
        ),
      ),
    );
  }
}
