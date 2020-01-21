import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prent/provider.dart';
import 'package:prent/screens/descreption_screen.dart';
import 'package:provider/provider.dart';
import 'package:prent/model/category_model.dart';
import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:prent/screens/product_screen.dart';

class SubCategory extends StatefulWidget {
  final String title;
  final List<Models> models;
  var id;
  SubCategory({this.title, this.models, this.id});

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  @override
  Widget build(BuildContext context) {
    Logic logic = Provider.of<Logic>(context);
    bool iFoundIt = false;
    if (logic.pref == null) {
      return Center(child: Text(''));
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlatButton(
              onPressed: () {
                logic.pref.clear();
              },
              child: Text('clear')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).tr(
                        'home_page.printers',
                      ),
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          color: Colors.black,
                          fontSize: 18.0),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(widget.title),
                  ],
                ),
                InkWell(
                  onTap: () {
                    print('::::::::id:::::::${widget.id}');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductScreen(widget.id)));
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context).tr(
                            'home_page.more',
                          ),
                          style: TextStyle(
                              fontFamily: 'Tajawal',
                              color: Color(0xffF7B600),
                              fontSize: 18.0),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffF7B600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 240,
            child: ListView.builder(
              itemCount: widget.models.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                widget.id;
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DescriptionScreen(
                                subModel: widget.models[index],
                                type: 'sub',
                              )));
                    },
                    child: Card(
                      elevation: 2.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.network(
                            '${widget.models[index].images[0].images}',
                            height: 110,
                            width: 110,
                          ),
                          Text(
                            widget.models[index].modelName,
                            style: TextStyle(
                                fontFamily: 'Tajawal', fontSize: 14.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            widget.models[index].features[0].feature,
                            style: TextStyle(
                                color: Colors.grey, fontFamily: 'Tajawal'),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffFFCA37),
                                  borderRadius: BorderRadius.circular(5.0)),
                              height: 40.0,
                              child: FlatButton(
                                onPressed: () {
                                  iFoundIt = false;
                                  List<String> cartItems =
                                      logic.pref.getStringList('cartItems');
                                  for (int i = 0; i < cartItems.length; i++) {
                                    if (jsonDecode(cartItems[i])['id'] ==
                                        widget.models[index].id) {
                                      iFoundIt = true;
                                      cartItems[index] = jsonEncode({
                                        'name':
                                            '${widget.models[index].modelName}',
                                        'image':
                                            '${widget.models[index].images[0].images}',
                                        'amount': jsonDecode(
                                            cartItems[i])['amount'] += 1,
                                        'id': widget.models[index].id
                                      });

                                      break;
                                    }
                                  }
                                  if (!iFoundIt) {
                                    cartItems.add(jsonEncode({
                                      'name':
                                          '${widget.models[index].modelName}',
                                      'image':
                                          '${widget.models[index].images[0].images}',
                                      'amount': 1,
                                      'id': widget.models[index].id
                                    }));
                                  }

                                  logic.pref
                                      .setStringList('cartItems', cartItems);
                                  logic.notifyListeners();
                                },
                                child: Row(
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
                                      Icons.add_shopping_cart,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
  }
}
