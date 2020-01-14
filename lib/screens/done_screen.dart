import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:prent/screens/mainpage.dart';

class DoneScreen extends StatefulWidget {
  @override
  _DoneScreenState createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffFFCA37),
        title: Text(
          AppLocalizations.of(context).tr('complete_form.ok',),style: TextStyle(fontFamily: 'Tajawal',color: Colors.white),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {Navigator.pop(context);}),
      ),
      body:
         Center(
           child: ListView(
             shrinkWrap: true,
             children: <Widget>[
               Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Container(
                     height: 180.0,
                     width: 180.0,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(180.0),
                     ),
                     child: Center(child: Text(
                       AppLocalizations.of(context).tr('complete_form.ok_done',),style: TextStyle(fontSize: 40.0,fontFamily: 'Tajawal',color: Color(0xff59B95F)),
                     ),),
                   ),
                   SizedBox(height: 20.0,),
                   Padding(
                     padding: const EdgeInsets.only(right:35.0,left: 35.0),
                     child: Container(
                       child: Center(child: Text(
                         AppLocalizations.of(context).tr('complete_form.thanks1',),style: TextStyle(fontSize: 20.0,fontFamily: 'Tajawal',color: Color(0xff707070)),
                       ),),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(right:35.0,left: 35.0),
                     child: Container(
                       child: Center(child: Text(
                         AppLocalizations.of(context).tr('complete_form.thanks2',),style: TextStyle(fontSize: 20.0,fontFamily: 'Tajawal',color: Color(0xff707070)),
                       ),),
                     ),
                   ),
                   SizedBox(height: 30.0,),
                   Padding(
                     padding: const EdgeInsets.only(right:30.0,left: 30.0),
                     child: InkWell(
                       onTap: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainPageScreen()));
                       },
                       child: Container(
                           decoration: BoxDecoration(
                             color: Color(0xffF7B600),
                             borderRadius: BorderRadius.circular(5.0),
                           ),
                           width: MediaQuery.of(context).size.width,
                           height: 40.0,
                           child:
                               Center(
                                 child: Text(
                                   AppLocalizations.of(context).tr('complete_form.go_home',),style: TextStyle(fontSize: 18.0,fontFamily: 'Tajawal',color: Colors.white),
                                 ),
                               ),
                       ),
                     ),
                   ),
                 ],
               )
             ],
           ),
         )

    );
  }
}
