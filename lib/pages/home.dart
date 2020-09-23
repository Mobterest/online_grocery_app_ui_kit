import 'package:flutter/material.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../globals/colors.dart';
import '../globals/config.dart';
import '../globals/constants.dart';
import '../globals/dimensions.dart';
import '../globals/styles.dart';
import '../pages/productDetail.dart';
import '../pages/cart.dart';

class Home extends StatefulWidget {
  final List cart;

  Home(this.cart);

  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  List<Map<String, dynamic>> data = [];
  List<Map<String, dynamic>> result = [];
  TextEditingController _searchController = new TextEditingController();
  int numberOfItems;

  @override
  void initState() {
    super.initState();
    data = GROCERIES;
    numberOfItems = widget.cart.length;
  }

  Widget build(context) {
    return Scaffold(
        backgroundColor: WHITE_PALETTE,
        appBar: AppBar(
            title: Text(APP_TITLE,
                style: TextStyle(
                    color: BLACK_PALETTE,
                    fontSize: 12,
                    fontWeight: FontWeight.w700)),
            actions: [
              Stack(children: <Widget>[
                Padding(
                    padding: HOME_PADDING_TYPE_2,
                    child: IconButton(
                      icon: Icon((widget.cart.length > 0)
                          ? Icons.shopping_cart
                          : Icons.add_shopping_cart),
                      color: (widget.cart.length > 0)
                          ? ORANGE_PALETTE
                          : BLACK_PALETTE,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Cart(widget.cart)));
                      },
                    )),
                Positioned(
                    top: 4,
                    right: 26,
                    child: Text(
                      (widget.cart.length > 0)
                          ? widget.cart.length.toString()
                          : '',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                          color: Colors.green),
                    ))
              ])
            ],
            centerTitle: true,
            backgroundColor: WHITE_PALETTE,
            bottomOpacity: 0.0,
            elevation: 0.0),
        body: Stack(children: <Widget>[
          FloatingSearchBar(
              controller: _searchController,
              trailing: IconButton(
                icon: new Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  setState(() {
                    data = GROCERIES;
                  });
                },
              ),
              children: <Widget>[],
              pinned: true,
              onChanged: (String value) {
                if (value == '') {
                  setState(() {
                    data = GROCERIES;
                  });
                } else {
                  result = [];
                  GROCERIES.forEach((userDetail) {
                    if (userDetail['name']
                        .toUpperCase()
                        .contains(value.toUpperCase())) {
                      result.add(userDetail);
                    }
                  });
                  setState(() {
                    data = result;
                    _buildList();
                  });
                }
              },
              onTap: () {},
              decoration: InputDecoration.collapsed(
                  hintText: SEARCH, hintStyle: STYLE_HOME_SEARCH)),
          Padding(
              padding: HOME_PADDING_TYPE_3,
              child: StaggeredGridView.count(
                crossAxisCount: CROSSAXISCOUNT,
                staggeredTiles: _buildTiles(),
                children: _buildList(),
                mainAxisSpacing: MAINAXISSPACING,
                crossAxisSpacing: CROSSAXISSPACING,
                padding: HOME_PADDING_TYPE_4,
              )),
        ]));
  }

  List<Widget> _buildList() {
    List<Widget> _tiles = [];
    for (var i = 0; i < data.length; i++) {
      _tiles.add((data[i]['type'] == 1)
          ? GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductDetail(data[i], widget.cart, i)));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(CARD_RADIUS),
                ),
                child: Container(
                    child: Padding(
                        padding: HOME_PADDING_TYPE_5,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: HOME_PADDING_TYPE_6,
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Image.asset(data[i]['image'],
                                          width: HOME_PRODUCT_IMAGE_WIDTH,
                                          height: HOME_PRODUCT_IMAGE_HEIGHT))),
                              Padding(
                                  padding: HOME_PADDING_TYPE_7,
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(data[i]['name'],
                                          style: STYLE_PRODUCT_NAME))),
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(PROD_DESC,
                                      style: STYLE_PRODUCT_DESC)),
                              Padding(
                                  padding: HOME_PADDING_TYPE_8,
                                  child: Text(CURRENCY + data[i]['price'],
                                      style: STYLE_PRODUCT_PRICE)),
                              Text('per ' + data[i]['measure'],
                                  style: STYLE_PRODUCT_WEIGHT)
                            ])),
                    decoration: BoxDecoration(
                        color: data[i]['bg'], borderRadius: containerReadius)),
              ))
          : Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(CARD_RADIUS),
              ),
              child: Container(
                  child: Padding(
                      padding: HOME_PADDING_TYPE_5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(data[i]['name'],
                              style:
                                  TextStyle(fontSize: 11, color: GRAY_PALETTE)),
                          Text(data[i]['price'],
                              style: TextStyle(
                                  fontSize: 18,
                                  color: BLACK_PALETTE,
                                  fontWeight: FontWeight.w700)),
                          Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: RaisedButton(
                                  color: ORANGE_PALETTE,
                                  onPressed: () {},
                                  child: Text(data[i]['code'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)))),
                          Text(data[i]['description'],
                              style: TextStyle(
                                  fontSize: 10,
                                  color: GRAY_PALETTE,
                                  fontWeight: FontWeight.w700)),
                        ],
                      )),
                  decoration: BoxDecoration(
                      color: data[i]['bg'], borderRadius: containerReadius))));
    }
    return _tiles;
  }

  List<StaggeredTile> _buildTiles() {
    List<StaggeredTile> _staggeredTiles = [];
    for (var i = 0; i < data.length; i++) {
      _staggeredTiles.add(data[i]['staggeredTile']);
    }
    return _staggeredTiles;
  }
}
