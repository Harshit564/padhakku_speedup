import 'package:flutter/material.dart';
import 'package:flutterapp/Drawer/drawer.dart';
import 'package:flutterapp/data.dart';
import 'package:flutterapp/detail.dart';
import 'package:flutterapp/main_image.dart';

class PageList extends StatefulWidget {
  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  createTile(Book book) => Hero(
        tag: book.title,
        child: Material(
          elevation: 15.0,
          shadowColor: Colors.yellow.shade900,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'detail/${book.title}');

            },
            child: Image(
              image: AssetImage(book.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
  final grid = SliverPadding(
    padding: EdgeInsets.all(16.0),
    sliver: SliverGrid.count(
      childAspectRatio: 2 / 3,
      crossAxisCount: 3,
      mainAxisSpacing: 20.0,
      crossAxisSpacing: 20.0,
      children: books.map((book) => createTile(book)).toList(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        physics: ScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: Colors.white),
              expandedHeight: 500,
              flexibleSpace: FlexibleSpaceBar(
                background: MainImage(),
              )),
          grid,
        ],
      ),
      drawer: GuillotineMenu(),
    );
  }
}
