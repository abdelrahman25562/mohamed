import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class CompleteTransactionScreen extends StatefulWidget {
  @override
  _CompleteTransactionScreenState createState() =>
      _CompleteTransactionScreenState();
}

class _CompleteTransactionScreenState extends State<CompleteTransactionScreen> {
  final format = DateFormat("yyyy-MM-dd");
  TextEditingController address = new TextEditingController();
  TextEditingController company = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phone = new TextEditingController();

  addData(String name, String e_mail, String number, String company,
      String address, String text, String time_start, time_END) {
    String myUrl = "http://p-prent.com/api/newOrder";
    http.post(myUrl, headers: {
      'Accept': 'application/json',
    }, body: {
      "name": "$name",
      "email": "$e_mail",
      "company_name": "$company",
      "address": "$address",
      "phone": "$number",
      "data": "$text",
      "time_start": "$format",
      "time_end": "$format"
    }).then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }

  final dateFormat = DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");
  DateTime date;

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;

  var currentSelectedValue;
  void initState() {
    super.initState();
    currentSelectedValue = "yearly";
  }

  Widget buildFirstCard() {
    return Form(
      key: _key,
      autovalidate: _validate,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 25.0, top: 2.0),
            child: TextFormField(
              obscureText: false,
              keyboardType: TextInputType.multiline,
              autofocus: true,
              controller: name,
              decoration: InputDecoration(
                  errorText: _validate ? 'Value Can\'t Be Empty' : null,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF9AB55))),
                  hintText: 'الإسم بالكامل',
                  hintStyle: TextStyle(fontFamily: 'Tajawal'),
                  labelText: 'الاسم بالكامل',
                  labelStyle: TextStyle(
                    color: Color(0xFFF9AB55),
                    fontSize: 15,
                    fontFamily: 'Tajawal',
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 25.0, top: 2.0),
            child: TextFormField(
              obscureText: false,
              keyboardType: TextInputType.multiline,
              autofocus: true,
              validator: validateEmail,
              controller: email,
              onSaved: (String val) {
                email = val as TextEditingController;
              },
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF9AB55))),
                  hintText: 'example.com',
                  hintStyle: TextStyle(fontFamily: 'Tajawal'),
                  labelText: 'أدخل الايميل',
                  labelStyle: TextStyle(
                    color: Color(0xFFF9AB55),
                    fontSize: 15,
                    fontFamily: 'Tajawal',
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 25.0, top: 2.0),
            child: TextFormField(
              obscureText: false,
              keyboardType: TextInputType.multiline,
              autofocus: true,
              validator: validateMobile,
              controller: phone,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF9AB55))),
                  hintText: '000 - 000 - 960+',
                  hintStyle: TextStyle(fontFamily: 'Tajawal'),
                  labelText: 'ادخل الرقم',
                  labelStyle: TextStyle(
                    color: Color(0xFFF9AB55),
                    fontSize: 15,
                    fontFamily: 'Tajawal',
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 25.0, top: 2.0),
            child: TextFormField(
              obscureText: false,
              keyboardType: TextInputType.multiline,
              controller: address,
              autofocus: true,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF9AB55))),
                  labelText: 'اسم المؤسسه',
                  labelStyle: TextStyle(
                    color: Color(0xFFF9AB55),
                    fontSize: 15,
                    fontFamily: 'Tajawal',
                  ),
                  hintText: 'إسم المؤسسه إن وجد',
                  hintStyle: TextStyle(fontFamily: 'Tajawal')),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 25.0, top: 2.0),
            child: TextFormField(
              obscureText: false,
              controller: company,
              keyboardType: TextInputType.multiline,
              autofocus: true,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF9AB55))),
                  hintText: 'عنوان المؤسسه',
                  hintStyle: TextStyle(fontFamily: 'Tajawal'),
                  labelText: 'عنوان المؤسسه',
                  labelStyle: TextStyle(
                    color: Color(0xFFF9AB55),
                    fontSize: 15,
                    fontFamily: 'Tajawal',
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 12.0, top: 25.0),
              child: FormField<String>(
                validator: validateName,
                onSaved: (String val) {
                  currentSelectedValue = val;
                },
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF9AB55)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    child: DropdownButtonHideUnderline(
                      child: new DropdownButton(
                        value: currentSelectedValue, //Default value
                        items: <DropdownMenuItem>[
                          new DropdownMenuItem(
                            value: "yearly",
                            child: new Text(
                              'yearly',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          new DropdownMenuItem(
                            value: "event",
                            child: new Text(
                              'event',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ],
                        onChanged: (v) {
                          currentSelectedValue = v;
                          setState(() {});
                        },
                      ),
                    ),
                  );
                },
              ),

          ),
          SizedBox(
            height: 5.0,
          ),
          SizedBox(
            height: 5.0,
          ),
        ],
      ),
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
          'تأكيد العمليه',
          style: TextStyle(fontFamily: 'Tajawal', color: Colors.white),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: ListView(
        children: <Widget>[
          buildFirstCard(),
          buildDropDown(),
          SizedBox(
            height: 10.0,
          ),
          InkWell(
            onTap: addData(
                name.text,
                email.text,
                phone.text,
                address.text,
                company.text,
                currentSelectedValue,
                format.toString(),
                format.toString()),
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 15.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40.0,
                decoration: BoxDecoration(
                  color: Color(0xFF59B95F),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                  child: Text(
                    'تاكيد',
                    style:
                        TextStyle(fontFamily: 'Tajawal', color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String validateName(String value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 11) {
      return "Mobile number must 11 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  Widget buildDropDown() {
    if (currentSelectedValue == "yaerly") {
      return Center(child: Text(""));
    } else if (currentSelectedValue == "event") {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: DateTimeField(
              decoration: InputDecoration(
                hintText: 'start event',
                hintStyle: TextStyle(color: Color(0xFFF9AB55)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF9AB55))),
              ),
              format: format,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: DateTimeField(
              decoration: InputDecoration(
                hintText: 'end event',
                hintStyle: TextStyle(color: Color(0xFFF9AB55)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFF9AB55))),
              ),
              format: format,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
            ),
          ),
        ],
      );
    }
    return Center(child: Text(""));
  }
}
