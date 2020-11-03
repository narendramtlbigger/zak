import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakce/ui/dashboad/dashboard.dart';
import 'package:zakce/ui/loginRegister/loginpage.dart';
import 'package:zakce/ui/loginRegister/registerpage.dart';
import 'package:zakce/widget/rounded_button.dart';

class SplashThird extends StatefulWidget {
  @override
  _SplashThird createState() => _SplashThird();
}

class _SplashThird extends State<SplashThird> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Color(0xff3730D1),
        body: new Center(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildTitle(context),
                buildImage(context),
                buildMessage(context),
              /*  RoundedButton(
                  text: 'LOGIN',
                  onPressed: () => decideWhichPageToGo(),
                ),*/
                RoundedButton(
                  text: 'LOGIN / REGISTER',
                  onPressed: () => decideWhichPageToGoN(),
                ),
              ]),
        ));
  }

  void decideWhichPageToGo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (!preferences.containsKey('isLogin')) {
      gotoLoginPage();
    } else {
      if (!preferences.getBool('isLogin')) {
        gotoLoginPage();
      } else {
        gotoDesboardPage();
      }
    }
  }

  void decideWhichPageToGoN() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (!preferences.containsKey('isLogin')) {
      gotoResiterPage();
    } else {
      if (!preferences.getBool('isLogin')) {
        gotoResiterPage();
      } else {
        gotoDesboardPage();
      }
    }
  }

  buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(
              'images/logo_A.png',
              height: 40.0,
              fit: BoxFit.cover,
            ),
          ]),
    );
  }

  buildImage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        child: Image.asset('images/petbig.png', color: Colors.black38,),
      ),
    );
  }

  buildMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Text(
        'Manage your \nvet practice on the move',
        style: TextStyle(
            fontFamily: "UbuntuMono",
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.shortestSide * 0.06),
            textAlign: TextAlign.center,
      ),
    );
  }

  void gotoLoginPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  void gotoDesboardPage() {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) => DashBoard()),
        ModalRoute.withName('/'));
  }

  void gotoResiterPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
  }
}
