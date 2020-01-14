import 'package:flutter/material.dart';

class fliter extends StatefulWidget {
  @override
  _fliterState createState() => _fliterState();
}

class _fliterState extends State<fliter> {
  bool monVal = false;
  bool tuVal = false;
  bool wedVal = false;
  bool thurVal = false;
  bool friVal = false;
  bool satVal = false;
  bool sunVal = false;
  bool a = false;
  bool b = false;
  bool c = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('تخصيص النتائج',style: TextStyle(color: Colors.white,fontSize: 20.0),),
        centerTitle: true,
        actions: <Widget>[
          Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20.0,)
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:180.0,top: 20.0),
                child: Text('تخصيص نتائج بحثك', style: TextStyle(color: Colors.black,fontSize: 20.0),),
              ),
               Padding(
                 padding: const EdgeInsets.only(left: 200.0,top: 40.0),
                 child: Text('العلامه التجاريه', style: TextStyle(color: Colors.grey,fontSize: 18.0),),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget>[
                   SizedBox(width: 31.5,),
                  check('richo',tuVal),
                   SizedBox(width: 6.5,),
                   check('canon',wedVal),
                   SizedBox(width: 35.0,),
                   check('hp',monVal),
                 ],
               ),
                Padding(
                 padding: const EdgeInsets.only(left: 265.0,top: 10.0),
                 child: Text('الحجم', style: TextStyle(color: Colors.grey,fontSize: 18.0),),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget>[
                   SizedBox(width: 23.0,),
check1('صغير',thurVal),

                   check1('متوسط',friVal),
                   SizedBox(width: 17.0,),
                   check1('كبير',satVal)

               ],),
                 Padding(
                 padding: const EdgeInsets.only(left: 275.0,top: 10.0),
                 child: Text('النوع', style: TextStyle(color: Colors.grey,fontSize: 18.0),),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget>[
                   SizedBox(width: 33.0,),
check2('كبير',a),


                   check2("ناسخات",b),
SizedBox(width: 2.0,),

                   check2('طابعات',c)

               ],),
               SizedBox(height: MediaQuery.of(context).size.height/10,),
               Container(

                 height: 45.0,
                 width: MediaQuery.of(context).size.width -60,
                 child: FlatButton(
                   onPressed: (){},
                   color: Colors.orangeAccent,
                   child: Text('تم',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                 ),
               )
            ],
          )
        ],
      )
    );
  }
  Widget check(String title, bool boolValue){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Text('$title',style: TextStyle(fontSize: 20.0),),
                         Checkbox(
      activeColor: Colors.orange,
      checkColor: Colors.white,
      value: boolValue,
      onChanged: (bool value) {
        /// manage the state of each value
        setState(() {
          switch (title) {
            case "hp":
              monVal = value;
              break;
            case "richo":
              tuVal = value;
              break;
            case "canon":
              wedVal = value;
              break;

          }
        });
      },),

      ],


                   );
  }
  Widget check1(String title, bool boolValue){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('$title',style: TextStyle(fontSize: 20.0),),
        Checkbox(
          activeColor: Colors.orange,
          checkColor: Colors.white,
          value: boolValue,
          onChanged: (bool value) {
            /// manage the state of each value
            setState(() {
              switch (title) {
                case "صغير":
                  thurVal = value;
                  break;
                case "متوسط":
                  friVal = value;
                  break;
                case "كبير":
                  satVal = value;
                  break;

              }
            });
          },),

      ],


    );
  }
  Widget check2(String title, bool boolValue){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('$title',style: TextStyle(fontSize: 20.0),),
        Checkbox(
          activeColor: Colors.orange,
          checkColor: Colors.white,
          value: boolValue,
          onChanged: (bool value) {
            /// manage the state of each value
            setState(() {
              switch (title) {
                case "كبير":
                  a = value;
                  break;
                case "ناسخات":
                  b = value;
                  break;
                case "طابعات":
                  c = value;
                  break;

              }
            });
          },),
      ],


    );
  }

}