import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:amazing_e_book/networking/api_request.dart';
import 'package:amazing_e_book/models/books_model.dart';

import '../models/book_detail_model.dart';


class Books extends GetxController{
  String titleList = 'List of Books';
  List<Book> listOfBook = [];
  late BookDetail bookDetail;

  // Map<String, dynamic> theBook = {
  //   'title': 'Microsoft Excel Data Analysis and Business Modeling, 7th Edition',
  //   'subtitle': 'Office 2021 and Microsoft 365',
  //   'isbn13': '9780137613663',
  //   'price': '34.87',
  //   'image': 'https://itbook.store/img/books/9780137613663.png',
  //   'url': 'https://itbook.store/books/9780137613663',
  // };
  //
  // late List<Map<String,dynamic>> listBook = List.generate(3, (index) => theBook, growable: true);


  Future<List<Book>> getBooks() async {
    ApiRequest apiRequest = ApiRequest();
    List? resdata = await apiRequest.getListBook();
    if(resdata is List){
      int len = resdata.length;
      for(int i=0;i<len;i++){
        this.listOfBook.add(new Book(
            title: resdata[i]['title'],
            subtitle: resdata[i]['subtitle'],
            isbn13: resdata[i]['isbn13'],
            price: resdata[i]['price'],
            image: resdata[i]['image'],
            url: resdata[i]['url']
        ));
      }
    }
    return this.listOfBook;

  }

  Future<BookDetail> getBookDetail(String id) async {
    ApiRequest apiRequest = ApiRequest();
    var resdata = await apiRequest.getBookDetail(id);

    bookDetail = BookDetail.fromJson(resdata.data);

    return this.bookDetail;

  }
}