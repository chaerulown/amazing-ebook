// To parse this JSON data, do
//
//     final bookDetail = bookDetailFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BookDetail bookDetailFromJson(String str) => BookDetail.fromJson(json.decode(str));

String bookDetailToJson(BookDetail data) => json.encode(data.toJson());

class BookDetail {
  BookDetail({
    required this.error,
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.language,
    required this.isbn10,
    required this.isbn13,
    required this.pages,
    required this.year,
    required this.rating,
    required this.desc,
    required this.price,
    required this.image,
    required this.url,
  });

  String error;
  String title;
  String subtitle;
  String authors;
  String publisher;
  String language;
  String isbn10;
  String isbn13;
  String pages;
  String year;
  String rating;
  String desc;
  String price;
  String image;
  String url;

  factory BookDetail.fromJson(Map<String, dynamic> json) => BookDetail(
    error: json["error"],
    title: json["title"],
    subtitle: json["subtitle"],
    authors: json["authors"],
    publisher: json["publisher"],
    language: json["language"],
    isbn10: json["isbn10"],
    isbn13: json["isbn13"],
    pages: json["pages"],
    year: json["year"],
    rating: json["rating"],
    desc: json["desc"],
    price: json["price"],
    image: json["image"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "title": title,
    "subtitle": subtitle,
    "authors": authors,
    "publisher": publisher,
    "language": language,
    "isbn10": isbn10,
    "isbn13": isbn13,
    "pages": pages,
    "year": year,
    "rating": rating,
    "desc": desc,
    "price": price,
    "image": image,
    "url": url,
  };
}
