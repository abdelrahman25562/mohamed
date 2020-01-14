import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:prent/screens/cart_screen.dart';
import 'package:prent/screens/descreption_screen.dart';
import 'package:prent/scoped_model/main_model.dart';
import 'package:prent/model/products_model.dart';

class MainPageScreen extends StatefulWidget {
  @override
  _MainPageScreenState createState() => _MainPageScreenState();
}
List<Products>product;
Products products = Products();
List<Models> myModel;
MainModel model = MainModel();

class _MainPageScreenState extends State<MainPageScreen> {
  void initState(){
    _getCats();
    super.initState();
  }
  bool _loading = false;
  _getCats()async{
    setState(() {
      _loading = true;
    });
    Products _products = await model.loadCategoriesResponse();
    setState(() {
      products = _products;
      print(products.data[0].name);
      _loading = false;
    });
  }
  TextEditingController searchController = new TextEditingController();
  String filter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      drawer: Drawer(
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
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffFFCA37),
        actions: <Widget>[
          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
            },
              child: Tab(icon: new Image.asset("assets/images/shopping-bag.png"))),
        ],
        centerTitle: true,
        title: Container(
          width: MediaQuery.of(context).size.width + 20.0,
          height: 35.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xffF7B600)),
          child: Padding(
            padding: const EdgeInsets.only(left: 60.0),
            child: TextField(
              controller:searchController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'البحث',
                hintStyle: TextStyle(color: Colors.white, fontSize: 15.0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 22.0,
                ),
              ),
            ),
          ),
        ),
      ),
      body: _loading? Center(child: CircularProgressIndicator(),): GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image.asset('assets/images/test.png'),
                ),

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
                        ],
                      ),
                      Container(
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  height: 220,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount:products.data.length,
                      itemBuilder: (context,index){
                        return content(
                          products.data[index].name
                        );
                      }
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
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
                        ],
                      ),
                      Container(
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
                              color: Colors.orangeAccent,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 220,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount:products.data.length,
                      itemBuilder: (context,index){
                        return content(
                          products.data[index].name
                        );
                      }
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
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
                        ],
                      ),
                      Container(
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
                              color: Color(0xffFFCA37),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 220,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount:products.data.length,
                      itemBuilder: (context,index){
                        return content(
                          products.data[index].name,
                        );
                      }
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }

  Widget content(String name) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DescriptionScreen()));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/test.png'),
              Text(name,style: TextStyle(fontFamily: 'Tajawal',fontSize: 14.0),),
              SizedBox(
                height: 5.0,
              ),
              Text(
               'cannon512',
                style: TextStyle(color: Colors.grey,fontFamily: 'Tajawal'),
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
                    onPressed: () {},
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
  }
}
