import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization_delegate.dart';

class MakeDrawer extends StatefulWidget {
  @override
  _MakeDrawerState createState() => _MakeDrawerState();
}

class _MakeDrawerState extends State<MakeDrawer> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      elevation: 20.0,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('logo'),
            decoration: BoxDecoration(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.home,
                  color: Color(0xffFFCA37),
                ),
                Text(
                  AppLocalizations.of(context).tr(
                    'drawer.main',
                  ),
                  style: TextStyle(
                      fontFamily: 'Tajawal',
                      color: Color(0xff505050),
                      fontSize: 18.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.shopping_cart,
                  color: Color(0xffFFCA37),
                ),
                Text(
                  AppLocalizations.of(context).tr('drawer.cart_shopping'),
                  style: TextStyle(
                      fontFamily: 'Tajawal',
                      color: Color(0xff505050),
                      fontSize: 18.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.question_answer,
                  color: Color(0xffFFCA37),
                ),
                Text(
                  AppLocalizations.of(context).tr('drawer.question'),
                  style: TextStyle(
                      fontFamily: 'Tajawal',
                      color: Color(0xff505050),
                      fontSize: 18.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.web_asset,
                  color: Color(0xffFFCA37),
                ),
                Text(
                  AppLocalizations.of(context).tr('drawer.visit_website'),
                  style: TextStyle(
                      fontFamily: 'Tajawal',
                      color: Color(0xff505050),
                      fontSize: 18.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.local_laundry_service,
                  color: Color(0xffFFCA37),
                ),
                Text(
                  AppLocalizations.of(context).tr('drawer.service'),
                  style: TextStyle(
                      fontFamily: 'Tajawal',
                      color: Color(0xff505050),
                      fontSize: 18.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.add_box,
                  color: Color(0xffFFCA37),
                ),
                Text(
                  AppLocalizations.of(context).tr('drawer.about'),
                  style: TextStyle(
                      fontFamily: 'Tajawal',
                      color: Color(0xff505050),
                      fontSize: 18.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.ac_unit,
                  color: Color(0xffFFCA37),
                ),
                Text(
                  AppLocalizations.of(context).tr('drawer.conditions'),
                  style: TextStyle(
                      fontFamily: 'Tajawal',
                      color: Color(0xff505050),
                      fontSize: 18.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
