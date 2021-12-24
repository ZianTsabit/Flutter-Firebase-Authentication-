import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class EditProductPage extends StatelessWidget {
  static const route = "/edit-product";

  @override
  Widget build(BuildContext context) {
    String prodId = ModalRoute.of(context).settings.arguments as String;

    var prov = Provider.of<Products>(context, listen: false);

    var selectedProduct = prov.selectById(prodId);

    final TextEditingController titleController =
        TextEditingController(text: selectedProduct.title);
    final TextEditingController authorController =
        TextEditingController(text: selectedProduct.author);

    void edit(String title, String author) {
      prov.editProduct(prodId, title, author);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Book"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => edit(titleController.text, authorController.text),
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
                    edit(titleController.text, authorController.text),
                child: Text(
                  "Edit",
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
