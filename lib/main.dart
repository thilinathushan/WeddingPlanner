import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'providers/user_details_provider.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Firebase App Check
  await FirebaseAppCheck.instance.activate();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Show status bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom,
    SystemUiOverlay.top,
  ]);

  // To load onboard shared preferences for the first time
  SharedPreferences prefs = await SharedPreferences.getInstance();
  seenOnboard = prefs.getInt('seenOnboard');
  await prefs.setInt('seenOnboard', 1);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Stream<UserModel?> authUser = AuthServices().user;

    return StreamProvider<UserModel?>.value(
      initialData: UserModel(uid: ""),
      value: authUser,
      child: ChangeNotifierProvider(
        create: (context) => UserDetailsProvider(),
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
      ),
    );
  }
}
