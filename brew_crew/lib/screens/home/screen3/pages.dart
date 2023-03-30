import 'package:flutter/material.dart';
import 'product.dart';

class pages extends StatefulWidget {
  const pages({super.key});

  @override
  State<pages> createState() => _pagesState();
}

class _pagesState extends State<pages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProductScreen())),
          // onPressed: () => Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => NewTemplate())),
          backgroundColor: Color(0xffA85CF9),
          child: Icon(Icons.add),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(0, 15, 0, 7),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 4, 15, 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [],
                ),
              ),
            ),
            // Container(
            //   child: Text('Title:' + title.toString()),
            // )
          ],
        ));
  }
}
