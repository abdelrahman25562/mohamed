import 'dart:convert';
import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_gallery/flutter_scroll_gallery.dart';
import 'package:prent/components/cart_button.dart';
import 'package:prent/model/product_model.dart';
import 'package:prent/model/category_model.dart';
import 'package:provider/provider.dart';
import '../provider.dart';
class DescriptionScreen extends StatefulWidget {
  final MyData productModel;
  final Models subModel;
  final String type;
  DescriptionScreen({this.subModel, this.productModel, this.type});

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    Logic logic = Provider.of<Logic>(context);
    return widget.type == 'sub'
        ? Scaffold(
            backgroundColor: Color(0xfff4f4f4),
            appBar: AppBar(
              backgroundColor: Color(0xffFFCA37),
              title: Text(
                widget.subModel.modelName,
                style: TextStyle(fontFamily: "Tajawal"),
              ),
              centerTitle: true,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              actions: <Widget>[
                shoppingCartIconButton(context),
              ],
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: ScrollGallery(
                    <ImageProvider>[
                      NetworkImage(widget.subModel.images[0].images),
                      NetworkImage(widget.subModel.images[1].images),
                      NetworkImage(widget.subModel.images[2].images),
                      NetworkImage(widget.subModel.images[3].images)
                    ],
                    borderColor: Color(0xffFFCA37),
                    thumbnailSize: 40.0,
                  ),
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.topRight,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.subModel.modelName,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context).tr(
                      'desc_page.desc',
                    ),
                    style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, left: 12.0),
                  child: Container(
                    alignment: Alignment.topRight,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Text(
                      widget.subModel.description,
                      style:
                          TextStyle(color: Colors.black, fontFamily: "Tajawal"),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context).tr(
                      'desc_page.adv',
                    ),
                    style: TextStyle(
                        fontFamily: 'Tajawal',
                        color: Colors.black,
                        fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info,
                            color: Color(0xffFFCA37),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: Text(
                                  widget.subModel.features[0].feature,
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.grey),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: Text(
                                  widget.subModel.features[1].feature,
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.grey),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: Text(
                                  widget.subModel.features[2].feature,
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.grey),
                                ),
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF7B600),
                        borderRadius: BorderRadius.circular(5.0)),
                    height: 40.0,
                    child: FlatButton(
                      onPressed: () {
                        List<String> cartItems =
                        logic.pref.getStringList('cartItems');
                        cartItems.add(jsonEncode({
                          'name': '${widget.subModel.modelName}',
                          'image':
                          '${widget.subModel.images[0].images}',
                          'amount': 1,
                        }));
                        logic.pref
                            .setStringList('cartItems', cartItems);
                        logic.notifyListeners();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context).tr(
                              'home_page.cart',
                            ),
                            style: TextStyle(
                                fontFamily: 'Tajawal',
                                color: Colors.white,
                                fontSize: 18.0),
                          ),
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            backgroundColor: Color(0xfff4f4f4),
            appBar: AppBar(
              backgroundColor: Color(0xffFFCA37),
              title: Text(
                widget.productModel.modelName,
                style: TextStyle(fontFamily: "Tajawal"),
              ),
              centerTitle: true,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              actions: <Widget>[
                shoppingCartIconButton(context),
              ],
            ),
            body: ListView(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: ScrollGallery(
                    <ImageProvider>[
                      NetworkImage(widget.productModel.images[0].images),
                      NetworkImage(widget.productModel.images[1].images),
                      NetworkImage(widget.productModel.images[2].images),
                      NetworkImage(widget.productModel.images[3].images)
                    ],
                    borderColor: Color(0xffFFCA37),
                    thumbnailSize: 40.0,
                  ),
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.topRight,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.productModel.modelName,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context).tr(
                      'desc_page.desc',
                    ),
                    style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0, left: 12.0),
                  child: Container(
                    alignment: Alignment.topRight,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Text(
                      widget.productModel.description,
                      style:
                          TextStyle(color: Colors.black, fontFamily: "Tajawal"),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context).tr(
                      'desc_page.adv',
                    ),
                    style: TextStyle(
                        fontFamily: 'Tajawal',
                        color: Colors.black,
                        fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info,
                            color: Color(0xffFFCA37),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: Text(
                                  widget.productModel.features[0].feature,
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.grey),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: Text(
                                  widget.productModel.features[1].feature,
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.grey),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: Text(
                                  widget.productModel.features[2].feature,
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.grey),
                                ),
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF7B600),
                        borderRadius: BorderRadius.circular(5.0)),
                    height: 40.0,
                    child: FlatButton(
                      onPressed: () {
                        List<String> cartItems =
                        logic.pref.getStringList('cartItems');
                        cartItems.add(jsonEncode({
                          'name': '${widget.productModel.modelName}',
                          'image':
                          '${widget.productModel.images[0].images}',
                          'amount': 1,
                        }));
                        logic.pref
                            .setStringList('cartItems', cartItems);
                        logic.notifyListeners();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context).tr(
                              'home_page.cart',
                            ),
                            style: TextStyle(
                                fontFamily: 'Tajawal',
                                color: Colors.white,
                                fontSize: 18.0),
                          ),
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
