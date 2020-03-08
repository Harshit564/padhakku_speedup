import 'package:flutter/material.dart';
import 'package:flutterapp/Drawer/drawer.dart';
import 'package:flutterapp/data.dart';

import 'Animation/FadeAnimation.dart';
import 'main_image.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Report',
      style: optionStyle,
    ),
    Text(
      'Index 1: Shop',
      style: optionStyle,
    ),
    Text(
      'Index 2: Orders',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<FadeAnimation> _appBarActions = [
    FadeAnimation(
        1.2,
        IconButton(
            icon: Icon(Icons.favorite, color: Colors.white), onPressed: () {})),
    FadeAnimation(
        1.3,
        IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {})),
  ];

  @override
  Widget build(BuildContext context) {
    //app bar
    final appBar = AppBar(
      elevation: .5,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      title: Text('Padhakku',style: TextStyle(color: Colors.black),),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );

    ///create book tile hero
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

    ///create book grid tiles
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

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        physics: ScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
              backgroundColor: Colors.transparent,
              actions: _appBarActions,
              iconTheme: IconThemeData(color: Colors.white),
              expandedHeight: 500,
              flexibleSpace: FlexibleSpaceBar(
                background: MainImage(),
              )),
          grid,
        ],
      ),
      drawer: GuillotineMenu(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            title: Text('Report'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            title: Text('Shop'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            title: Text('Orders'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
