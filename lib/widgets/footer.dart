import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBarColor,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                  children:[
                    Text("CONTACT US",style: footerTextStyle,),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.email,color: Colors.white,),
                        Text(" csm@gmail.com",style: footerTextStyle,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone,color: Colors.white,),
                        Text(" 9059186409      ",style: footerTextStyle,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone,color: Colors.white,),
                        Text(" 9951539257      ",style: footerTextStyle,),
                      ],
                    ),
                  ]
              ),
              Column(
                //social
                  children:[
                    Text("SOCIAL",style: footerTextStyle,),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook,color: Colors.white,),
                        Text(" Facebook",style: footerTextStyle,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.twitter,color: Colors.white,),
                        Text(" Twitter    ",style: footerTextStyle,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.instagram,color: Colors.white,),
                        Text(" Instagram",style: footerTextStyle,),
                      ],
                    ),
                  ]
              ),
            ],
          ),
          //contact us
          SizedBox(height: 20),
          Center(child: Text("Rajam | Dolapeta | Palakonda | Vijayanagaram | Ponduru | Srikakulam",textAlign: TextAlign.center,style: footerTextStyle)),
          SizedBox(height: 10,),
          Text('© 2022 City Super Market',style: footerTextStyle,)
        ],
      ),
    );
  }
}