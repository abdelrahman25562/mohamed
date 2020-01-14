import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_gallery/flutter_scroll_gallery.dart';
import 'package:prent/screens/cart_screen.dart';
class DescriptionScreen extends StatefulWidget {
  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        backgroundColor: Color(0xffFFCA37),
        title: Text('طابعه ليزر كانون أي سينس الكل في واحد',style: TextStyle(fontFamily: "Tajawal"),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pop(context);}),
        actions: <Widget>[
      InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
        },
          child: Tab(icon: new Image.asset("assets/images/shopping-bag.png")))
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.35,
            child: ScrollGallery(<ImageProvider>[
              AssetImage('assets/images/test.png'),
              AssetImage('assets/images/test.png'),
              AssetImage('assets/images/test.png'),
              AssetImage('assets/images/test.png'),
            ],
              borderColor: Colors.orange,
              thumbnailSize: 40.0,
            ),
          ),
          Container(
            color: Colors.white,
            alignment: Alignment.topRight,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('طابعه ليزر كانون أي سينس الكل في واحد',style: TextStyle(color: Colors.black),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:  Text(
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
            padding: const EdgeInsets.only(right:12.0,left:12.0),
            child: Container(
              alignment: Alignment.topRight,
              width: MediaQuery.of(context).size.width,
              child: Center(child: Text('هذه الطابعة الليزرية من كانون تقدم لك صور واضحة ورائعة بدقة وضوح تصل الى 2400×600 نقطة لكل انش،وتتميز هذه الطابعة بافضل عجلة مغناطيسية لتمنحك اداء عالي ونتائج رائعة. تبلغ سرعة الطباعة للمرة الاولى على هذه الطابعة 7.8 ثانية، اما سرعات طباعة الليزر، فتبلغ 18 ورقة بالدقيقة الواحدة.هذه الطابعة تستهلك 0.8 واط في وضع النوم، ذلك بفضل تقنية التحديد المطلوبة. هذه التقنية تضمن لك اداء رائع ومتميز. هذه الطابعة مصممة بشكل متين، لتمنحك مطبوعات عالية الجودة ومع ادنى حد للقيام بالصيانة او تبديل جزء من هذه الاجزاء،وفي حال القيام بتبديل اي جزء من هذه الاجزاء يمكنك القيام بذلك بكل سهولة ودون اي عناء. هذه الطابعة تاتيك بتصميم انيق وبابعاد 364×249×198 ملم مما يجعلها مثالية ومتوافقة مع استخدام المكاتب',style: TextStyle(color: Colors.black,fontFamily: "Tajawal"),)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:  Text(
              AppLocalizations.of(context).tr(
                'desc_page.adv',
              ),
              style: TextStyle(
                  fontFamily: 'Tajawal',
                  color: Colors.black,
                  fontSize: 18.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                       Image.asset('assets/images/database.png'),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Text(
                                'الذاكره 32 ميجا بايت',style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),

                      ]
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Icon(Icons.info,color: Colors.orange,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.35,
                          child: Text(
                              'سرعه الطباعه 18ورقه/الدقيقه A4 أحاديه اللون قياسي',style: TextStyle(fontSize: 10.0,color: Colors.grey),
                          ),
                        ),

                      ]
                  ),
                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffF7B600),
                  borderRadius: BorderRadius.circular(5.0)),
              height: 40.0,
              child: FlatButton(
                onPressed: () {},
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context).tr(
                        'desc_page.similar_prints',
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                content(),
                content(),
                content(),
                content()

              ],
            ),
          )
        ],
      ),
    );
  }
  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DescriptionScreen()));
        },
        child: Card(
          elevation: 10.0,
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/test.png',
                height: 80.0,
              ),
              Text('طابعه ليزر كانون اى سينس\n   MF3010الكل فى واحد',style: TextStyle(fontFamily: 'Tajawal'),),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'دقيقه/ورقه18',
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
                          'أضف الى السله',
                          style: TextStyle(color: Colors.white,fontFamily: 'Tajawal'),
                        ),
                        Icon(
                          Icons.shopping_cart,
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