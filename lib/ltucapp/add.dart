import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController urlController = TextEditingController();

  final CollectionReference _products =
      FirebaseFirestore.instance.collection('students');

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    final String name = nameController.text;
    final String url = urlController.text;
    final double? price = double.tryParse(priceController.text);
    if (price != null) {
      await _products.add({"name": name, "age": price});

      nameController.text = '';
      priceController.text = '';
      urlController.text = '';
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Added Successfully")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Empty field")));
    }

    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Add new student: ",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.orange),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.orange),
                      ),
                      focusColor: Colors.orange,
                      label: Text(
                        "Student Name",
                        style: TextStyle(color: Colors.orange),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 2),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 25.0, left: 25, bottom: 25),
                  child: TextField(
                    controller: priceController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.orange),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.orange),
                      ),
                      label: Text(
                        "Student Age",
                        style: TextStyle(color: Colors.orange),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 2),
                    ),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15),
                        backgroundColor: Colors.orange),
                    onPressed: () {
                      _create();
                    },
                    child: Text("Add"))
              ]),
        ),
      ),
    );
  }
}
