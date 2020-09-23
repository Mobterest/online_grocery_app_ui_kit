import 'package:flutter/material.dart';
import '../globals/config.dart';
import '../globals/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../globals/dimensions.dart';
import '../globals/constants.dart';
import '../globals/styles.dart';
import './location.dart';

class Signin extends StatelessWidget {
  Widget build(context) {
    return Stack(children: <Widget>[
      Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(BG_IMAGE), fit: BoxFit.cover)),
          constraints: BoxConstraints.expand()),
      Positioned(
          left: DIM_POSITION_LEFT,
          top: DIM_POSITION_TOP,
          right: DIM_POSITION_RIGHT,
          child: Column(children: <Widget>[
            Image.asset(
              ICON_IMAGE,
              height: DIM_IMAGE_HEIGHT,
            ),
          ])),
      Positioned(
          top: DIM_POSITION_TOP_1,
          child: Padding(
              padding: DIM_LOGIN_PADDING_1,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      LOGIN_TITLE,
                      style: STYLE_LOGIN_TITLE,
                    ),
                    Padding(
                        padding: DIM_LOGIN_PADDING_2,
                        child:
                            Text(LOGIN_SUBTITLE, style: STYLE_LOGIN_SUBTITLE)),
                    Padding(
                        padding: DIM_LOGIN_PADDING_3,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width *
                                DIM_SIZEDBOX_WIDTH,
                            height: DIM_SIZEDBOX_HEIGHT,
                            child: TextField(
                                autocorrect: true,
                                decoration: InputDecoration(
                                  hintText: LOGIN_E_USERNAME,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: ORANGE_PALETTE,
                                  ),
                                  hintStyle: STYLE_LOGIN_TFIELD,
                                  filled: true,
                                  fillColor: WHITE_PALETTE,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: LOGIN_TFIELD_RADIUS,
                                    borderSide: BorderSide(
                                        color: WHITE_PALETTE,
                                        width: BORDERSIDE_WIDTH),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: LOGIN_TFIELD_RADIUS,
                                    borderSide: BorderSide(
                                        color: WHITE_PALETTE,
                                        width: BORDERSIDE_WIDTH),
                                  ),
                                )))),
                    Padding(
                        padding: DIM_LOGIN_PADDING_3,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width *
                                DIM_SIZEDBOX_WIDTH,
                            height: DIM_SIZEDBOX_HEIGHT,
                            child: TextField(
                                autocorrect: true,
                                decoration: InputDecoration(
                                  hintText: LOGIN_E_PASS,
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: ORANGE_PALETTE,
                                  ),
                                  hintStyle: STYLE_LOGIN_TFIELD,
                                  filled: true,
                                  fillColor: WHITE_PALETTE,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: LOGIN_TFIELD_RADIUS,
                                    borderSide: BorderSide(
                                        color: WHITE_PALETTE,
                                        width: BORDERSIDE_WIDTH),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: LOGIN_TFIELD_RADIUS,
                                    borderSide: BorderSide(
                                        color: WHITE_PALETTE,
                                        width: BORDERSIDE_WIDTH),
                                  ),
                                )))),
                    Padding(
                        padding: DIM_LOGIN_PADDING_4,
                        child: Container(
                            width: MediaQuery.of(context).size.width *
                                DIM_SIZEDBOX_WIDTH,
                            height: DIM_SIZEDBOX_HEIGHT,
                            child: RaisedButton(
                                color: WHITE_PALETTE,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Location()));
                                },
                                shape: StadiumBorder(),
                                child: Text(LOGIN_BTN_TEXT,
                                    style: STYLE_LOGIN_BTN)))),
                    Padding(
                        padding: DIM_LOGIN_PADDING_5,
                        child: Text(
                          LOGIN_SM_TITLE,
                          style: STYLE_LOGIN_SM_TITLE,
                        )),
                    Padding(
                        padding: DIM_LOGIN_PADDING_6,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  height: DIM_SIZEDBOX_HEIGHT,
                                  child: RaisedButton.icon(
                                    shape: StadiumBorder(),
                                    color: WHITE_PALETTE,
                                    icon: Padding(
                                        padding: DIM_LOGIN_PADDING_7,
                                        child: FaIcon(
                                            FontAwesomeIcons.facebookF,
                                            color: BLACK_PALETTE,
                                            size: FAICON_SIZE)),
                                    onPressed: () {},
                                    label: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                DIM_BTN_CONTAINER_WIDTH,
                                        child: Text(FB)),
                                  )),
                              SizedBox(width: DIM_SIZEDBOX_HEIGHT_1),
                              Container(
                                  height: DIM_SIZEDBOX_HEIGHT,
                                  child: RaisedButton.icon(
                                    shape: StadiumBorder(),
                                    color: WHITE_PALETTE,
                                    icon: Padding(
                                        padding: DIM_LOGIN_PADDING_7,
                                        child: FaIcon(FontAwesomeIcons.google,
                                            color: BLACK_PALETTE,
                                            size: FAICON_SIZE)),
                                    onPressed: () {},
                                    label: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                DIM_BTN_CONTAINER_WIDTH,
                                        child: Text(Gg)),
                                  ))
                            ]))
                  ])))
    ]);
  }
}
