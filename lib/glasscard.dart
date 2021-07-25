import 'package:flutter/material.dart';
//import '../widget/detailscreen.dart';
import 'dart:ui';

class GlassCard extends StatelessWidget {
   final String id;
   final String name;
  final String email;
  final String username;
  GlassCard({
    this.id,
    this.name,
    this.email,
    this.username,
  });
  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.all(10),
     

      child: Center(
        child: Container(
          decoration: BoxDecoration(
              // color: ,
              color: Colors.black54,
              boxShadow: [
                BoxShadow(
                  blurRadius: 16,
                  spreadRadius: 16,
                  color: Colors.black.withOpacity(0.1),
                )
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20.0,
                sigmaY: 20.0,
              ),
              child: Container(
                  width: 360,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        width: 1.5,
                        color: Colors.white.withOpacity(0.2),
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(name,
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationStyle: TextDecorationStyle.solid,
                                      color: Colors.white.withOpacity(0.75),
                                      fontSize: 30)),
                            ),
                             Text(id,
                                style: TextStyle(fontSize: 40,
                                    color: Colors.white)),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          
                               Flexible(
                                 child: Text(username,
                                 overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.75))),
                               ),
                            
                           
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(email,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.75))),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
