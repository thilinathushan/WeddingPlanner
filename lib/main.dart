import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/user_model.dart';
import 'services/auth_services.dart';
import 'package:provider/provider.dart';
import 'pages/auth/social_login_second.dart';
import 'pages/onboarding_page.dart';
import 'wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

int? seenOnboard;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  //Show status bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom,
    SystemUiOverlay.top,
  ]);

  //to load onboard shared preferences for the first time
  SharedPreferences prefs = await SharedPreferences.getInstance();
  seenOnboard = prefs.getInt('seenOnboard');
  await prefs.setInt('seenOnboard', 1);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: UserModel(uid: ""),
      value: AuthServices().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wedding Planner',
        home: const Wrapper(),
        initialRoute: seenOnboard == 0 || seenOnboard == null
            ? 'onboardingPage'
            : 'socialLoginSecond',
        routes: {
          'onboardingPage': (context) => const OnboardingPage(),
          'socialLoginSecond': (context) => const SocialLoginSecond(),
        },
      ),
    );
  }
}
