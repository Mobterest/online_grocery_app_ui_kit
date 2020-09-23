import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../globals/dimensions.dart';
import '../globals/constants.dart';
import '../globals/styles.dart';
import '../globals/config.dart';
import '../pages/home.dart';

class Location extends StatefulWidget{
  State<StatefulWidget> createState() => LocationState();
}

class LocationState extends State<Location> {
  List cartItems = [];
  Widget build(context) {
    return Scaffold(
        backgroundColor: WHITE_PALETTE,
        body: SafeArea(
          child: Padding(
              padding: DIM_LOC_PADDING_1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    LOCATION_TITLE,
                    style: STYLE_LOC_TITLE,
                  ),
                     Align(
                    alignment: Alignment.center,
                    child:  Image.asset(MAP_IMG,
                      width: MediaQuery.of(context).size.width,
                      height:
                          MediaQuery.of(context).size.height * DIM_IMG_HEIGHT)),
                  Align(
                      alignment: Alignment.center,
                      child: Text(LOC_SUBTITLE, style: STYLE_LOC_SUBTITLE)),
                  Padding(
                      padding: DIM_LOC_PADDING_2,
                      child: Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: DIM_CONTAINER_WIDTH,
                              child: Text(LOC_DESC,
                                  style: STYLE_LOC_DESC,
                                  textAlign: TextAlign.center)))),
                  Padding(
                      padding: DIM_LOC_PADDING_3,
                      child: Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: MediaQuery.of(context).size.width *
                                  DIM_LOC_C_WIDTH,
                              height: DIM_LOC_C_HEIGHT,
                              child: RaisedButton(
                                color: ORANGE_PALETTE,
                                shape: StadiumBorder(),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home(cartItems)));
                                },
                                child: Text(LOC_BTN_TEXT,
                                    style: STYLE_LOC_BTN_TEXT),
                              ))))
                ],
              )),
        ));
  }
}
