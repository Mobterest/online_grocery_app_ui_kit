import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../globals/dimensions.dart';
import '../globals/constants.dart';
import '../globals/styles.dart';
import '../pages/home.dart';
import '../pages/cart.dart';

class ProductDetail extends StatefulWidget {
  final Map<String, dynamic> product;
  final List cart;
  final int index;

  ProductDetail(this.product, this.cart, this.index);
  State<StatefulWidget> createState() => ProductDetailState();
}

class ProductDetailState extends State<ProductDetail> {
  int count = 1;

  @override
  void initState() {
    super.initState();
  }

  Widget build(context) {
    return Scaffold(
        backgroundColor: widget.product['bg'],
        appBar: AppBar(
            iconTheme: IconThemeData(color: BLACK_PALETTE),
            actions: [
              Stack(children: <Widget>[
                Padding(
                  padding: PD_PADDING_TYPE_2,
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
              ],)
              
            ],
            centerTitle: true,
            backgroundColor: widget.product['bg'],
            bottomOpacity: 0.0,
            elevation: 0.0),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Center(
              child: Container(
                  height:
                      MediaQuery.of(context).size.height * PD_CONTAINER_WIDTH,
                  child: Image.asset(widget.product['image'],
                      width: PD_PRODUCT_IMAGE_WIDTH,
                      height: PD_PRODUCT_IMAGE_HEIGHT))),
          ClipRRect(
              borderRadius: PD_CLIPRECT,
              child: Container(
                color: WHITE_PALETTE,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * PD_TOP_HEIGHT,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: PD_PADDING_TYPE_3,
                        child: Text(
                          widget.product['name'],
                          style: STYLE_PD_PRODUCT_NAME,
                        )),
                    Padding(
                        padding: PD_PADDING_TYPE_4,
                        child: Text(PROD_WEIGHT_TEXT,
                            style: TextStyle(color: widget.product['bg']))),
                    Padding(
                        padding: PD_PADDING_TYPE_5,
                        child:
                            Text(PD_PROD_DESC, style: STYLE_PD_PRODUCT_WEIGHT)),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: PD_PADDING_TYPE_8,
                              child: RaisedButton(
                                  color: WHITE_PALETTE,
                                  onPressed: () {
                                    if (count > 1) {
                                      setState(() {
                                        count--;
                                      });
                                    }
                                  },
                                  child: Icon(Icons.remove),
                                  shape: CircleBorder(
                                    side: BorderSide(
                                        width: 1, color: BLACK_PALETTE),
                                  ))),
                          Padding(
                              padding: PD_PADDING_TYPE_7,
                              child: Text(
                                count.toString(),
                                style: STYLE_PD_COUNT,
                              )),
                          Padding(
                              padding: PD_PADDING_TYPE_6,
                              child: RaisedButton(
                                  color: WHITE_PALETTE,
                                  onPressed: () {
                                    if (count >= 1) {
                                      setState(() {
                                        count++;
                                      });
                                    }
                                  },
                                  child: Icon(Icons.add),
                                  shape: CircleBorder(
                                    side: BorderSide(
                                        width: 1, color: BLACK_PALETTE),
                                  ))),
                          Spacer(),
                          Padding(
                              padding: PD_PADDING_TYPE_9,
                              child: Text(
                                CURRENCY + widget.product['price'],
                                style: STYLE_PD_PRICE,
                              ))
                        ]),
                    Padding(
                        padding: PD_PADDING_TYPE_10,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.local_shipping),
                            Padding(
                                padding: PD_PADDING_TYPE_11,
                                child: Text(PD_TIMING, style: STYLE_PD_TIMING)),
                            Spacer(),
                            Padding(
                                padding: PD_PADDING_TYPE_12,
                                child: Text(
                                  PD_DISCOUNT_MSG,
                                  style: TextStyle(
                                      fontSize: STYLE_PD_DISCOUNT,
                                      color: widget.product['bg'],
                                      fontWeight: FontWeight.w500),
                                ))
                          ],
                        )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: PD_PADDING_TYPE_13,
                            child: Container(
                              width: PD_FAVICON_WIDTH,
                              height: PD_FAVICON_HEIGHT,
                              child: OutlineButton(
                                borderSide: BorderSide(color: GRAY_PALETTE),
                                onPressed: () {},
                                child: Icon(Icons.favorite_border,
                                    color: GRAY_PALETTE),
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(FAVICON_RADIUS),
                              ),
                            )),
                        Padding(
                            padding: PD_PADDING_TYPE_14,
                            child: Container(
                                width: MediaQuery.of(context).size.width *
                                    PD_BTN_WIDTH,
                                height: PD_BTN_HEIGHT,
                                child: RaisedButton(
                                    shape: StadiumBorder(),
                                    color: widget.product['bg'],
                                    onPressed: () {
                                      Map map = {
                                        'index': widget.index,
                                        'count': count
                                      };
                                      widget.cart.add(map);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Home(widget.cart)));
                                    },
                                    child: Text(ADD_ITEM))))
                      ],
                    )
                  ],
                ),
              ))
        ])));
  }
}
