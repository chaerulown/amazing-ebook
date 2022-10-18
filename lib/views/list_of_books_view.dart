import 'package:amazing_e_book/views/book_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amazing_e_book/controllers/books_controller.dart';
import '../models/books_model.dart';

class ItemBook extends StatelessWidget{
  final Book book;
  final String overrideImageUrl = 'https://cdn3d.iconscout.com/3d/premium/thumb/book-4183205-3468959.png';
  const ItemBook({required this.book, super.key});

  void _toDetail(){
    Get.to(DetailBook());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius:20,
          backgroundImage: NetworkImage(this.overrideImageUrl)
        ),
        title: Text(book.title,style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text(book.subtitle, style: Theme.of(context).textTheme.subtitle1),
        hoverColor: Colors.blueAccent,
        tileColor: Colors.grey.shade100,
        trailing: Text('\$'+book.price),
        onTap: _toDetail,
      )
    );
  }
}


class ListOfBooks extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Books b = Get.put(Books());
    b.getBooks();
    List<Book> listOfBook = b.listOfBook;

    /*Map<String, dynamic> currentBook = b.listBook[0];

    final Book book = Book(
        title: currentBook['title'],
        subtitle: currentBook['subtitle'],
        isbn13: currentBook['isbn13'],
        price: currentBook['price'],
        image: currentBook['image'],
        url: currentBook['url']
    );*/


    List<Widget> listItemBook = <Widget>[];
    //int len = b.listBook.length;
    int len = b.listOfBook.length;

    if(len > 0){
      for(int i=0;i<len;i++){
        debugPrint('tes => hehe');
        listItemBook.add(new ItemBook(book: listOfBook[i]));
      }
    }
    
    //listItemBook.add(new ItemBook(book: book));

    return Scaffold(
      appBar: AppBar(
        title: Text(b.titleList),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: listItemBook,
      )
    );
  }

}