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
        trailing: Text(book.price),
        onTap: _toDetail,
      )
    );
  }
}

class ListOfBooks extends StatefulWidget {
  const ListOfBooks({super.key});

  @override
  State<ListOfBooks> createState() => ListBookState();


}

class ListBookState extends State<ListOfBooks>{
  Future _getListBook(){
    final Books b = Get.put(Books());
    return b.getBooks();
  }
  
  List<Widget> _buildList(List<Book> listOfBook){
    List<Widget> listItemBook = <Widget>[];

    int len = listOfBook.length;

    if(len > 0) {
      for (int i = 0; i < len; i++) {
        debugPrint('tes => hehe');
        listItemBook.add(new ItemBook(book: listOfBook[i]));
      }
    }
      
    return listItemBook;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List of Books'),
        ),
        body: FutureBuilder(
          future: _getListBook(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView(
                padding: const EdgeInsets.all(8),
                children: _buildList(snapshot.data),
              );
            }else if (snapshot.hasError){
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Error: ${snapshot.error}'),
                    TextButton(onPressed: ()=>{Get.back()}, child: Text('Back'))
                  ],
                ),
              );
            }else{
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    )
                  ],
                ),
              );
            }
          },
        )
    );


  }

}

