
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_final/provider/auth_provider.dart';
import 'screens/splash.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),
      ],
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MyShop',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'Poppins',
            ),
            home: const SplashScreen()),
      ),
    );
  }
}
