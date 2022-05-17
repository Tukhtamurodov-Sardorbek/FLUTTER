import 'package:flutter/material.dart';

class SliverAppBarTitle extends StatelessWidget {
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            backgroundColor: Colors.indigo,
            floating: true,
            pinned: true,
            snap: true,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              top = constraints.biggest.height;
              return FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  title: AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        top < 100.0 ? Alignment.center : Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          top > 100.0 ? 20.0 : 0.0,
                          15.0,
                          0.0,
                          top > 100.0 ? 10.0 : 0.0,
                      ),
                      child: const Text(
                        'Title',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  background: Image.network(
                    'https://images.pexels.com/photos/443356/pexels-photo-443356.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                    fit: BoxFit.cover,
                  ));
            }),
          ),
        ];
      },
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 100,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(20.0),
              child:
                  Text('Item $index', style: const TextStyle(fontSize: 25.0)));
        },
      ),
    ));
  }
}
