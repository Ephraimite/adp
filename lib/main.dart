import 'package:adp/auth_state.dart';
import 'package:adp/screens/e_voting_screen/e_voting_main.dart';
import 'package:adp/screens/e_voting_screen/vote_result_tab.dart';
import 'package:adp/screens/news_feed_screen/feeds_main.dart';
import 'package:adp/screens/sign_up.dart';
import 'package:adp/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(
        MultiProvider(
            providers: [
                ChangeNotifierProvider(create: (_)=> AuthState(),),
            ],
            child: MaterialApp(
                home: SplashScreen(),
                theme: ThemeData(
                    primaryColor: kCOLOR_PRIMARY,
                ),
                debugShowCheckedModeBanner: false,
            ),
        ),
    );
}

