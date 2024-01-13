import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flashchat/components/RoundButton.dart';

class WelcomeScreen extends StatefulWidget {

  static String id='welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();

    controller=AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
    );
    animation=CurvedAnimation(parent: controller, curve: Curves.decelerate);
    // animation=ColorTween(begin: Colors.red,end: Colors.green).animate(controller);

    controller.forward();
    // animation.addStatusListener((status) {
    //   if(status==AnimationStatus.completed){
    //     controller.reverse(from: 1);
    //   }else if(status==AnimationStatus.dismissed){
    //     controller.forward();
    //   }
    // });
    controller.addListener(() {
      setState(() {
      });
      // print(controller.value);
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: controller.value*100,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle:TextStyle(
                        color: Colors.yellow.shade900,
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ]
                  //
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                color: Colors.lightBlue,
                title: 'Log in ',
                onpressed: (){
                  Navigator.pushNamed(context, LoginScreen.id);
                }
             ),
             RoundedButton(
               color: Colors.blueAccent,
                 title: 'Register Now',
                 onpressed:(){
                 Navigator.pushNamed(context, RegistrationScreen.id);
                 }
             ),
          ],
        ),
      ),
    );
  }
}

