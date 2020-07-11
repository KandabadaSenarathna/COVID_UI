import 'dart:ui';
import 'package:Covid_UI/constant.dart';
import 'package:Covid_UI/info_screen.dart';
import 'package:Covid_UI/widgets/counter.dart';
import 'package:Covid_UI/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       scaffoldBackgroundColor: kBackgroundColor,
       fontFamily: "Poppins",
       textTheme: TextTheme(bodyText1: TextStyle(color: kBodyTextColor),
       )
      ),
      home: InfoScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      children: <Widget>[
        MyHeader(
          image: "assets/icons/Drcorona.svg",
          textTop: "All you need",
          textMid: "is Stay",
          textBottom: "at home",
        ),
        Container(
        margin: EdgeInsets.symmetric(horizontal:20),
        padding: EdgeInsets.symmetric(vertical:10, horizontal:20),
        height:60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
              color: Color(0xFFE5E5E5),
          ),
        ),
        child: Row(
          children:<Widget>[
            SvgPicture.asset("assets/icons/maps-and-flags.svg"),
          SizedBox(width: 20,),
          Expanded(
           
            child: DropdownButton(
              isExpanded: true,
              underline: SizedBox(),
              icon: SvgPicture.asset("assets/icons/dropdown.svg"),
              value: "SriLanka",
            items: ['SriLanka','India','United States','Japan']
            .map<DropdownMenuItem<String>>((String value){
              return DropdownMenuItem<String>(
              value : value,
              child:Text(value),
            );

            }).toList(),
            onChanged: (value){},
          ),
          ),
          ],
        ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [TextSpan(text: "Case Update \n", style: kTitleTextstyle,
                      ),
                      TextSpan(text: "Newest update March 28", style: TextStyle(color: kTextLightColor,
                      ),
                      ),
                      ],
                      ),
                      ),
                      Spacer(),
                      Text("See details", 
                      style: TextStyle(
                        color: kPrimaryColor, 
                        fontWeight: FontWeight.w600,
                        ),
                        ),
                ],
              ),
              SizedBox(height:20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                  offset: Offset(0,4),
                  blurRadius: 30,
                  color: kShadowColor,
                  ),
                ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget>[
                  Counter(
                    color: kInfectedColor,
                    number: 1046,
                    title: "Infected",
                  ),
                  Counter(
                    color: kDeathColor,
                    number: 87,
                    title: "Deaths",
                  ),
                  Counter(
                    color: kRecoverColor,
                    number: 46,
                    title: "Recovered",
                  ),
                ],
                ),
              ),
              SizedBox(height: 20),
              
            
            ],
          ),
        ),
            ],
      ),
      
      );
      
  }
}

