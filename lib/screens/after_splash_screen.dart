import 'package:flutter/material.dart';
import 'package:prent/screens/mainpage.dart';
import 'package:easy_localization/easy_localization.dart';
class AfterSplashScreen extends StatefulWidget {
  @override
  _AfterSplashScreenState createState() => _AfterSplashScreenState();
}

class _AfterSplashScreenState extends State<AfterSplashScreen> {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;

    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2 + 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(
                          bottomLeft: (Radius.elliptical(280, 250)),
                          bottomRight: (Radius.elliptical(200, 55)))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 10.0, top: 15.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width / 3 + 20.0,
                          color: Colors.orangeAccent,
                          child: FlatButton(
                            color: Colors.orangeAccent,
                            child: Text(
                              'العربيه',
                              style:
                              TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPageScreen()));
                              this.setState(() {
                                data.changeLocale(Locale("ar", "DZ"));
                                print(Localizations.localeOf(context).languageCode);
                              });
                              }
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 10.0, top: 15.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width / 3 + 20.0,
                          color: Colors.orangeAccent,
                          child: FlatButton(
                            color: Colors.orangeAccent,
                            child: Text(
                              'English',
                              style:
                              TextStyle(fontSize: 20.0, color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPageScreen()));
                              this.setState(() {
                                data.changeLocale(Locale("en", "US"));
                                print(Localizations.localeOf(context).languageCode);
                              });
                            },
                          )),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
