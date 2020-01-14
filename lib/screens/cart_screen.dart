import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:prent/screens/complete_transaction_screen.dart';
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Widget buildItem(){
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, left: 12,top:8.0,bottom: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Stack(
          children: <Widget>[
            Container(
                  height: 25.0,
                  width: 25.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25.0)
                  ),
                    alignment: Alignment.topRight,child: Center(
                  child: Icon(Icons.close,color: Colors.white,),
                )),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    width: 150,
                    child: Text('طابعه ليزر كانون أي سينس الكل في واحد')
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/test.png',height: 120.0,width: 120,),
                    Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.green
                            ),
                            child: Center(child: Text('+',style: TextStyle(color: Colors.white),),),
                          ),
                          Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white
                            ),
                            child: Center(child: Text('4'),),
                          ),
                          Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.red
                            ),
                            child: Center(child: Text('-',style: TextStyle(color: Colors.white),),),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        backgroundColor: Color(0xffFFCA37),
        title: Text(
          AppLocalizations.of(context).tr('cart.cart',),style: TextStyle(fontFamily: 'Tajawal',color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {Navigator.pop(context);}),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white
                  ),
                  child: Center(child: Text('4'),),
                ),
                SizedBox(width: 12.0,),
                Text(
                  AppLocalizations.of(context).tr('cart.prod',),style: TextStyle(fontFamily: 'Tajawal',),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0,),
           ListView.builder(
             shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context,index){
                  return buildItem();
                }
            ),

          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.only(right:10.0,left: 10.0),
            child: InkWell(
              onTap: (){
                Navigator.push((context), MaterialPageRoute(builder: (context)=>CompleteTransactionScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                  width: MediaQuery.of(context).size.width,
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(child: Icon(Icons.done,color: Colors.green,size: 10.0,),),
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        AppLocalizations.of(context).tr('cart.done',),style: TextStyle(fontFamily: 'Tajawal',color: Colors.white),
                      ),
                    ],
                  )
                ),
            ),
          ),

          SizedBox(height: 10.0,),
        ],
      )
    );
  }
}


