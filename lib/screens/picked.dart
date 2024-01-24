// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task_1/database/db.dart';
import 'package:task_1/screens/add.dart';

class PickedObject extends StatefulWidget {
  const PickedObject({super.key});

  @override
  State<PickedObject> createState() => _PickedObjectState();
}

class _PickedObjectState extends State<PickedObject> {
  List<Map<String, dynamic>> pickedFiles = [];

  Future<dynamic> getItems() async {
    final data = await DBHelper.getItems();
    setState(() {
      pickedFiles = data;
    });
    if (pickedFiles.isEmpty) {
      print("Uzunligi: ${pickedFiles.length}");
    } else {
      print("Uzunligi: ${pickedFiles.length}");
    }
  }

  @override
  void initState() {
    getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: getItems,
      child: ListView.builder(
          itemCount: pickedFiles.length,
          itemBuilder: (context, index) {
            return Slidable(
                endActionPane:
                    ActionPane(motion: const StretchMotion(), children: [
                  SlidableAction(
                      icon: Icons.edit,
                      label: 'Edit',
                      onPressed: (context) async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Add(
                                      id: pickedFiles[index]['id'],
                                      title: pickedFiles[index]['title'],
                                      photo: pickedFiles[index]['photo'],
                                      description: pickedFiles[index]
                                          ['description'],
                                      price: pickedFiles[index]['summ'] ~/
                                          pickedFiles[index]['number'],
                                      summ: pickedFiles[index]['summ'],
                                    )));
                        getItems();
                      }),
                  SlidableAction(
                      icon: Icons.delete,
                      label: 'Delete',
                      onPressed: (context) async {
                        await DBHelper.deleteItems(pickedFiles[index]['id']);
                        await getItems();
                      })
                ]),
                child: design(pickedFiles[index]));
          }),
    );
  }

  Container design(Map<String, dynamic> pickedFiles) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: double.infinity,
      height: MediaQuery.of(context).size.width * .3,
      decoration: BoxDecoration(
          color: Colors.blue.shade200, borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        Container(
          height: MediaQuery.of(context).size.width * .3,
          width: MediaQuery.of(context).size.width * .3,
          decoration: BoxDecoration(
            color: Colors.amber,
            image: DecorationImage(
                image: AssetImage(
                  "assets/${pickedFiles['photo']}",
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(pickedFiles['title']),
            Text("${pickedFiles['summ']} so'm"),
          ],
        ),
      ]),
    );
  }
}
