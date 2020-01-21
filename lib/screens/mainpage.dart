import 'package:flutter/material.dart';
import 'package:prent/components/drawer_component.dart';
import 'package:prent/components/product_container_home_page.dart';
import 'package:prent/components/cart_button.dart';
import 'package:provider/provider.dart';
import 'package:prent/provider_service/product_service.dart';

class MainPageScreen extends StatefulWidget {
  @override
  _MainPageScreenState createState() => _MainPageScreenState();
}
class _MainPageScreenState extends State<MainPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        drawer: MakeDrawer(),
        appBar: AppBar(
            backgroundColor: Color(0xffFFCA37),
            actions: <Widget>[
              shoppingCartIconButton(context),
            ],
            centerTitle: true,
            title: Text(
              'المكان الخاص بالبحث',
              style: TextStyle(fontFamily: 'Tajawal', fontSize: 12),
            )),
        body: FutureBuilder(
          future: Provider.of<Category>(context, listen: false).fetchData(),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapShot.error != null) {
                return Center(
                  child: Text(
                    'حدث خطأ في الإتصال بالإنترنت' + snapShot.error.toString(),
                    style: TextStyle(
                      fontFamily: 'beINNormal',
                      color: Colors.grey,
                      fontSize: 16.0,
                    ),
                  ),
                );
              } else {
                return Consumer<Category>(
                    builder: (context, data, child) => Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            children: <Widget>[
                              SizedBox(height: 10.0,),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 140,
                                child: Image.network(data.subCat.data[0].models[0].images[0].images),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: data.subCat.data.length,
                                  itemBuilder: (context, index) {
                                    return SubCategory(
                                        title: data.subCat.data[index].name,
                                        models: data.subCat.data[index].models,
                                    id: data.subCat.data[index].id,
                                    );
                                  }
                              ),
                            ],
                          )
                        ));
              }
            }
          },
        ));
  }
}
