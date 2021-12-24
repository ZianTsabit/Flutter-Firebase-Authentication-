import 'package:flutter/material.dart';

class Product {
  String id, title, author;
  DateTime createdAt, updatedAt;

  Product({
    @required this.id,
    @required this.title,
    @required this.author,
    @required this.createdAt,
    this.updatedAt,
  });
}
