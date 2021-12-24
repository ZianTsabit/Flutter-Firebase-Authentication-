import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class AddProductPage extends StatelessWidget {
  static const route = "/add-product";

  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void save(String title, String author) {
      try {
        Provider.of<Products>(context, listen: false)
            .addProduct(title, author)
            .then((value) => Navigator.pop(context));
      } catch (err) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("ERROR"),
              content: Text("Error : $err"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Okay"),
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Book"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => save(titleController.text, authorController.text),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  autocorrect: false,
                  autofocus: true,
                  controller: titleController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Book Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  autocorrect: false,
                  controller: authorController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: "Author",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                onPressed: () =>
                    save(titleController.text, authorController.text),
                child: Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
