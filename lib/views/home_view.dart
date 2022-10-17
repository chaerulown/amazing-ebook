import 'package:amazing_e_book/views/list_of_books_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _gotListBooks() {
    Get.to(ListOfBooks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("../lib/images/background_with_books.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Welcome to',
              ),
              Text(
                  widget.title,
                  style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: _gotListBooks,
          tooltip: 'Go to List of Books',
          icon: const Icon(Icons.list),
          label: Text('Go to List of Books')
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}