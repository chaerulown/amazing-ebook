import 'package:flutter/material.dart';

class Book{
  late String title, subtitle, isbn13,  price, image, url;

  Book({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url
  });

  Book.loading() : this(title: '...',subtitle: '...',isbn13: '...',price: '...',image: '...',url: '...');

  bool get isLoading => title == '...';
}