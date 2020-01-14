import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization_delegate.dart';
import 'package:prent/screens/done_screen.dart';


class CompleteTransactionScreen extends StatefulWidget {
  @override
  _CompleteTransactionScreenState createState() => _CompleteTransactionScreenState();
}

class _CompleteTransactionScreenState extends State<CompleteTransactionScreen> {
  var currentSelectedValue;
  var deviceTypes = ["إيفنت", "سنوي",];
  Widget buildFirstCard() {
    return Stack(
      children: <Widget>[
        Form(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0,),
                  Padding(
                      padding:
                      EdgeInsets.only(left: 15.0, right: 25.0, top: 2.0),
                      child: Directionality(
                        child: TextFormField(
                          obscureText: false,
                          keyboardType: TextInputType.multiline,
                          autofocus: true,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFF9AB55))),
                               hintText: 'الإسم بالكامل',
                              hintStyle: TextStyle(fontFamily: 'Tajawal'),
                              labelText: AppLocalizations.of(context).tr('check_out.Name',),
                              labelStyle: TextStyle(
                                color: Color(0xFFF9AB55),
                                fontSize: 15,
                                fontFamily: 'Tajawal',
                              )),
                        ),
                        textDirection: TextDirection.rtl,
                      )),
                  Padding(
                      padding:
                      EdgeInsets.only(left: 15.0, right: 25.0, top: 2.0),
                      child: Directionality(
                        child: TextFormField(
                          obscureText: false,
                          keyboardType: TextInputType.multiline,
                          autofocus: true,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFF9AB55))),
                              hintText: 'example.com',
                              hintStyle: TextStyle(fontFamily: 'Tajawal'),
                              labelText: AppLocalizations.of(context).tr('check_out.e_mail',),
                              labelStyle: TextStyle(
                                color: Color(0xFFF9AB55),
                                fontSize: 15,
                                fontFamily: 'Tajawal',
                              )),
                        ),
                        textDirection: TextDirection.rtl,
                      )),
                  Padding(
                      padding:
                      EdgeInsets.only(left: 15.0, right: 25.0, top: 2.0),
                      child: Directionality(
                        child: TextFormField(
                          obscureText: false,
                          keyboardType: TextInputType.multiline,
                          autofocus: true,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFF9AB55))),
                              hintText: '000 - 000 - 960+',
                              hintStyle: TextStyle(fontFamily: 'Tajawal'),
                              labelText: AppLocalizations.of(context).tr('check_out.phone number',),
                              labelStyle: TextStyle(
                                color: Color(0xFFF9AB55),
                                fontSize: 15,
                                fontFamily: 'Tajawal',
                              )),
                        ),
                        textDirection: TextDirection.rtl,
                      )),
                  Padding(
                      padding:
                      EdgeInsets.only(left: 15.0, right: 25.0, top: 2.0),
                      child: Directionality(
                        child: TextFormField(
                          obscureText: false,
                          keyboardType: TextInputType.multiline,
                          autofocus: true,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFF9AB55))),
                              labelText: AppLocalizations.of(context).tr('check_out.company name',),
                              labelStyle: TextStyle(
                                color: Color(0xFFF9AB55),
                                fontSize: 15,
                                fontFamily: 'Tajawal',
                              ),
                            hintText: 'إسم المؤسسه إن وجد',
                            hintStyle: TextStyle(fontFamily: 'Tajawal')
                          ),
                        ),
                        textDirection: TextDirection.rtl,
                      )),
                  Padding(
                      padding:
                      EdgeInsets.only(left: 15.0, right: 25.0, top: 2.0),
                      child: Directionality(
                        child: TextFormField(
                          obscureText: false,
                          keyboardType: TextInputType.multiline,
                          autofocus: true,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFF9AB55))),
                              hintText: 'عنوان المؤسسه',
                              hintStyle: TextStyle(fontFamily: 'Tajawal'),
                              labelText: AppLocalizations.of(context).tr('check_out.address',),
                              labelStyle: TextStyle(
                                color: Color(0xFFF9AB55),
                                fontSize: 15,
                                fontFamily: 'Tajawal',
                              )),
                        ),
                        textDirection: TextDirection.rtl,
                      )),

          Padding(
            padding: const EdgeInsets.only(right: 20.0,left: 12.0,top: 25.0),
            child: Container(
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFF9AB55)),
                      ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text("نوع الإشتراك"),
                        value: currentSelectedValue,
                        isDense: true,
                        onChanged: (newValue) {
                          setState(() {
                            currentSelectedValue = newValue;
                          });
                          print(currentSelectedValue);
                        },
                        items: deviceTypes.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
                  SizedBox(
                    height: 60.0,
                  ),
                ],
              ),
            ),


        Padding(
          padding: const EdgeInsets.only(right:19.0,left: 19.0,top: 450.0),
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DoneScreen()));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40.0,
              decoration: BoxDecoration(
                color: Color(0xFF59B95F),
               borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text(
                  AppLocalizations.of(context).tr('check_out.title',),style: TextStyle(fontFamily: 'Tajawal',color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffFFCA37),
        title: Text(
          AppLocalizations.of(context).tr('check_out.title',),style: TextStyle(fontFamily: 'Tajawal',color: Colors.white),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {Navigator.pop(context);}),
      ),
      body: ListView(
        children: <Widget>[
          buildFirstCard()
        ],
      ),
    );
  }
}
