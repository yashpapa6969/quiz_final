
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:quiz_final/provider/auth_provider.dart';
import 'package:quiz_final/provider/register_provider.dart';
import 'package:quiz_final/screens/main_class.dart';
import 'package:quiz_final/screens/slider.dart';
import 'package:quiz_final/screens/splash.dart';



class AuthCheck extends StatelessWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
    return MultiProvider(
      providers: [

        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),

        ChangeNotifierProxyProvider<AuthProvider, RegisterProvider>(
                  create: (ctx) => RegisterProvider(),
                   update: (ctx,auth,_) => RegisterProvider(),
                 ),

      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) => MaterialApp(
            title: 'MyShop',
            theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrange,
              brightness: Brightness.light,
              fontFamily: 'medium',
            ),
            home: auth.isAuth
                ? const MainScreen()
                : FutureBuilder(
                  //  future: auth.tryAutoLogin(),
                    builder: (ctx, authResultSnapshot) => authResultSnapshot.connectionState == ConnectionState.waiting ? const SplashScreen() :  slider(),
                  ),
            //routes: {
          //               Login.routeName:(context)=>Login(),
          //             About.routeName: (context) => const About(),
          //
          //             }
           ),
      ),
    );
  }
}
