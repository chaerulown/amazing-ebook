import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:getwidget/getwidget.dart';

class DetailBook extends StatefulWidget {
  const DetailBook({Key? key}) : super(key: key);

  @override
  State<DetailBook> createState() => _DetailBookState();
}

class _DetailBookState extends State<DetailBook> {
  double _rating = 3;

  void _toUrl(String realUrl) async {
    Uri bookUrl = Uri.parse(realUrl);
    if(await canLaunchUrl(bookUrl)){
      await launchUrl(bookUrl);
    }else{
      throw 'Could not launch '+realUrl;
    }
  }

  void _goingToUrl(String strUrl) {
    setState(() {
      _toUrl(strUrl);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Detail of XYZ')),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  flex: 4,
                  child: Image(
                      height: 200,
                      image: NetworkImage(
                          'https://cdn3d.iconscout.com/3d/premium/thumb/book-4183205-3468959.png'))),
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
                                child: Text('Judul',
                                    style: TextStyle(
                                        color: Colors.cyan.shade500,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24),
                                    textAlign: TextAlign.left)),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text('SubJudul',
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic),
                                    textAlign: TextAlign.left)),
                            SizedBox(height: 8),
                            Container(
                              alignment: Alignment.topLeft,
                              child: GFRating(
                                value: _rating,
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
                                child: Text('\$80.00',
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
                  onPressed: (){_goingToUrl('https://www.google.com');},
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
              leading: Text('Deskripsi'),
              title: Text('Lorem ipsum dolor sit amet')
          ),
          ListTile(
              leading: Text('authors'),
              title: Text('Lorem ipsum dolor sit amet')
          ),
          ListTile(
              leading: Text('publisher'),
              title: Text('Lorem ipsum dolor sit amet')
          ),
          ListTile(
              leading: Text('language'),
              title: Text('Lorem ipsum dolor sit amet')
          ),
          ListTile(
              leading: Text('isbn10'),
              title: Text('Lorem ipsum dolor sit amet')
          ),
          ListTile(
              leading: Text('isbn13'),
              title: Text('Lorem ipsum dolor sit amet')
          ),
          ListTile(
              leading: Text('pages'),
              title: Text('Lorem ipsum dolor sit amet')
          ),
          ListTile(
              leading: Text('year'),
              title: Text('Lorem ipsum dolor sit amet')
          ),
        ],
      ),
    );
  }
}





