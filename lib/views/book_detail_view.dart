import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/books_controller.dart';
import '../models/book_detail_model.dart';

class DetailBook extends StatefulWidget {
  const DetailBook({super.key, required this.id});
  final String id;

  @override
  State<DetailBook> createState() => _DetailBookState();
}

class _DetailBookState extends State<DetailBook> {
  double _rating = 3;

  Future _getDataDetailBook(String id) {
    final Books b = Get.put(Books());
    return b.getBookDetail(id);
  }

  void _toUrl(String realUrl) async {
    Uri bookUrl = Uri.parse(realUrl);
    if (await canLaunchUrl(bookUrl)) {
      await launchUrl(bookUrl);
    } else {
      throw 'Could not launch ' + realUrl;
    }
  }

  void _goingToUrl(String strUrl) {
    setState(() {
      _toUrl(strUrl);
    });
  }

  ListView _buildDetail(BookDetail bookDetail) {
    return ListView(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image(
                      height: 200,
                      image: NetworkImage(
                          bookDetail.image)),
                )),
            Expanded(
                flex: 6,
                child: Container(
                    alignment: Alignment.topLeft,
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              child: Text(bookDetail.title,
                                  style: TextStyle(
                                      color: Colors.cyan.shade500,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24),
                                  textAlign: TextAlign.left)),
                          Container(
                              alignment: Alignment.topLeft,
                              child: Text(bookDetail.subtitle,
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic),
                                  textAlign: TextAlign.left)),
                          SizedBox(height: 8),
                          Container(
                            alignment: Alignment.topLeft,
                            child: GFRating(
                              value: double.parse(bookDetail.rating),
                              color: Colors.deepOrange,
                              borderColor: Colors.deepOrange,
                              onChanged: (value) {
                                setState(() {
                                  _rating = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                              alignment: Alignment.topLeft,
                              child: Text(bookDetail.price,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 16),
                                  textAlign: TextAlign.left)),
                        ],
                      ),
                    )))
          ],
        ),
        Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  _goingToUrl(bookDetail.url);
                },
                child: const Text(
                  'Buy Now',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            )),
        SizedBox(
          height: 6,
        ),
        ListTile(
            leading: Container(width: 100, child: Text('Deskripsi')),
            title: Text(bookDetail.desc)),
        ListTile(
            leading: Container(width: 100, child: Text('Authors')),
            title: Text(bookDetail.authors)),
        ListTile(
            leading: Container(width: 100, child: Text('Publisher')),
            title: Text(bookDetail.publisher)),
        ListTile(
            leading: Container(width: 100, child: Text('Language')),
            title: Text(bookDetail.language)),
        ListTile(
            leading: Container(width: 100, child: Text('ISBN10')),
            title: Text(bookDetail.isbn10)),
        ListTile(
            leading: Container(width: 100, child: Text('ISBN13')),
            title: Text(bookDetail.isbn13)),
        ListTile(
            leading: Container(width: 100, child: Text('Pages')),
            title: Text(bookDetail.pages)),
        ListTile(
            leading: Container(width: 100, child: Text('Year')),
            title: Text(bookDetail.year)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Book Detail')),
        body: FutureBuilder(
          future: _getDataDetailBook(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildDetail(snapshot.data);
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Error: ${snapshot.error}'),
                    TextButton(
                        onPressed: () => {Get.back()}, child: Text('Back'))
                  ],
                ),
              );
            } else {
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
                      child: Text('Loading...'),
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
