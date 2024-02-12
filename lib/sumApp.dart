import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'style.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sum App',
      home: MyhomePage(),
    );

  }
}

class MyhomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyhomePageUI();
  }

}

class MyhomePageUI extends State<MyhomePage>{

  Map<String,double> FormValue = {"num1":0,"num2":0,"num3":0};
  double Sum = 0;


  @override
  Widget build(BuildContext context) {

    MyInputOnChange(InputKey,InputValue){
      setState(() {
        FormValue.update(InputKey, (value) => double.parse(InputValue));
      });
    };

    AddAllNumber(){
      setState(() {
        Sum =  FormValue['num1']! + FormValue['num2']! + FormValue['num3']!;
      });
    };




    return Scaffold(
      appBar: AppBar(title: Text("Add"),),
      body: Padding(
        padding:EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(Sum.toString(),style : HeadTextStyle(),),
            SizedBox(height: 20,),
            TextFormField(onChanged: (value){
              MyInputOnChange("num1",value);

            },decoration: AppInputStyle("First Number : "),),
            SizedBox(height: 20,),
            TextFormField(onChanged: (value){
              MyInputOnChange("num2",value);

            },decoration: AppInputStyle("2nd number : "),),
            SizedBox(height: 20,),
            TextFormField(onChanged: (value){
              MyInputOnChange("num3",value);

            },decoration: AppInputStyle("Third number : "),),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: AppButtonStyle(),
                child: Text("Add"),
                onPressed:(){
                  AddAllNumber();


                },
              ),

            )
          ],
        ),

      ),
    );
  }


}

