import 'dart:async';

import 'package:flutter/material.dart';

import 'home_page.dart';
import 'test_page.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String id = "splash_page";
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _initTimer(){
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, HomePageTwo.id);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Column(
                  children: [
                    const Text("My tasks", style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                    Image.asset("assets/icons/arabic.png")
                  ],
                )),

                const SizedBox(height: 40,),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.of(context).size.height/2.5,
                    width: MediaQuery.of(context).size.width > MediaQuery.of(context).size.height ? MediaQuery.of(context).size.width/2:MediaQuery.of(context).size.width,
                    child: const Image(
                      image: AssetImage("assets/icons/ic_logo.png"),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width > MediaQuery.of(context).size.height ?0:150),
                Center(
                  child: const Image(
                    image: AssetImage("assets/icons/ic_line.png"),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/1000,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Good", style: TextStyle(color: Colors.white.withOpacity(.5),fontSize: 15),),
                    const Text("Consistency", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
                  ],
                )
              ],
            ),
          ),
        ),

      ),
      floatingActionButton: const Image(
        image: AssetImage("assets/icons/ic_cup.png"),
      ),
    );
  }

}
