import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/screens/welcome_screen.dart';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flashchat/screens/registration_screen.dart';
import 'package:flashchat/screens/chat_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // try {
  //
  // } catch (e) {
  //   print('Error initializing Firebase: $e');
  // }
  runApp(FlashChat());
}

// class FlashChat extends StatelessWidget {
//   final Future<FirebaseApp> _fApp=Firebase.initializeApp();
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: _fApp,
//         builder: (context,snapshot){
//           if(snapshot.hasError){
//             print("error");
//           }else if(snapshot.hasData){
//             return MaterialApp(
//               initialRoute: WelcomeScreen.id,
//               routes: {
//                 WelcomeScreen.id:(context)=> WelcomeScreen(),
//                 ChatScreen.id:(context)=>ChatScreen(),
//                 LoginScreen.id:(context)=>LoginScreen(),
//                 RegistrationScreen.id:(context)=>RegistrationScreen()
//               },
//             );
//           }else{
//             return CircularProgressIndicator();
//           }
//         }
//     );
//   }
// }
class FlashChat extends StatelessWidget {
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fApp,
      builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
        if (snapshot.hasError) {
          print("Error initializing Firebase: ${snapshot.error}");
          // You might want to return an error widget here.
           return MaterialApp(
            initialRoute: WelcomeScreen.id,
            routes: {
              WelcomeScreen.id: (context) => WelcomeScreen(),
              ChatScreen.id: (context) => ChatScreen(),
              LoginScreen.id: (context) => LoginScreen(),
              RegistrationScreen.id: (context) => RegistrationScreen()
            },
          ); // Replace with an appropriate error widget.
        } else if (snapshot.hasData) {
          return MaterialApp(
            initialRoute: WelcomeScreen.id,
            routes: {
              WelcomeScreen.id: (context) => WelcomeScreen(),
              ChatScreen.id: (context) => ChatScreen(),
              LoginScreen.id: (context) => LoginScreen(),
              RegistrationScreen.id: (context) => RegistrationScreen()
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

