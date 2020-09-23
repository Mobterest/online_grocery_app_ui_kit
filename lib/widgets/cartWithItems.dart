import 'package:flutter/material.dart';
import '../globals/dimensions.dart';
import '../globals/constants.dart';
import '../globals/styles.dart';
import '../globals/config.dart';
import '../globals/colors.dart';
import '../pages/home.dart';
import '../utils/func.dart';
import '../pages/payment.dart';

class WithItems extends StatefulWidget {
  final List cart;

  WithItems(this.cart);
  State<StatefulWidget> createState() => WithItemsState();
}

class WithItemsState extends State<WithItems> {
  int total = 0;
  Func f = new Func();

  @override
  void initState() {
    super.initState();
    setState(() {
      total = f.getSum(widget.cart);
    });
  }

  Widget build(context) {
    return WillPopScope(
        onWillPop: () async => Future.value(false),
        child: SafeArea(
          child: Padding(
              padding: DIM_CART_PADDING_1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    CART_TITLE,
                    style: STYLE_CART_TITLE,
                  ),
                  Text(CART_SEL, style: STYLE_CART_SEL),
                  Padding(
                      padding: DIM_CART_PADDING_4,
                      child: Container(
                        width: MediaQuery.of(context).size.width *
                            DIM_CART_C_WIDTH_1,
                        height: DIM_CART_C_HEIGHT_1,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Payment()));
                          },
                          color: ORANGE_PALETTE,
                          child: Row(children: [
                            Text(widget.cart.length.toString(),
                                style: STYLE_CART_LEN),
                            Text(CART_TOTALE, style: STYLE_CART_TOTALE),
                            Padding(
                                padding: DIM_CART_PADDING_5,
                                child: Text(CURRENCY + f.numberFormat(total),
                                    style: STYLE_CART_TVALUE)),
                            Spacer(),
                            Text(COUT, style: STYLE_CART_COUT),
                            Icon(
                              Icons.last_page,
                              color: WHITE_PALETTE,
                            )
                          ]),
                        ),
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width *
                          DIM_CART_C_WIDTH_1,
                      height: MediaQuery.of(context).size.height *
                          DIM_CART_C_HEIGHT_2,
                      child:
                          ListView(shrinkWrap: true, children: _buildList())),
                  Padding(
                      padding: DIM_CART_PADDING_6,
                      child: Container(
                        width: MediaQuery.of(context).size.width *
                            DIM_CART_C_WIDTH_1,
                        height: DIM_CART_C_HEIGHT,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home(widget.cart)));
                          },
                          color: ORANGE_PALETTE,
                          child: Row(children: [
                            Icon(
                              Icons.first_page,
                              color: WHITE_PALETTE,
                            ),
                            Text(BCK, style: STYLE_BCK),
                          ]),
                        ),
                      )),
                ],
              )),
        ));
  }

  List<Widget> _buildList() {
    List x = <Widget>[];

    for (var i = 0; i < widget.cart.length; i++) {
      x.add(Padding(
          padding: DIM_CART_PADDING_6,
          child: Card(
            child: ListTile(
              leading: Image.asset(GROCERIES[widget.cart[i]['index']]['image']),
              title: Text(
                  GROCERIES[widget.cart[i]['index']]['name'] +
                      PER +
                      GROCERIES[widget.cart[i]['index']]['measure'],
                  style: STYLE_CART_MEASURE),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(TIMES + widget.cart[i]['count'].toString(),
                        style: STYLE_CART_COUNT),
                    Text(
                        CURRENCY +
                            (int.parse(GROCERIES[widget.cart[i]['index']]
                                        ['price']) *
                                    widget.cart[i]['count'])
                                .toString(),
                        style: STYLE_CART_AMOUNT)
                  ]),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.cart.removeAt(i);
                      total = f.getSum(widget.cart);
                    });
                  },
                  icon: Icon(
                    Icons.delete_forever,
                    color: ORANGE_PALETTE,
                  )),
            ),
          )));
    }

    return x;
  }
}
