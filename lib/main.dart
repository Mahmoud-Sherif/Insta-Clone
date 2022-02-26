import 'package:chat_app/features/cubit/main_cubit.dart';
import 'package:chat_app/features/home/view.dart';
import 'package:chat_app/widgets/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'const/colors.dart';
import 'core/routes/magic_router.dart';
import 'features/sign_in/view.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDRjwxBQ_PR_pjTDqQTocNnFBHhZrCT6uA",
          authDomain: "fir-auth-56ce9.firebaseapp.com",
          projectId: "fir-auth-56ce9",
          storageBucket: "fir-auth-56ce9.appspot.com",
          messagingSenderId: "1030723160167",
          appId: "1:1030723160167:web:ec547c20ebc732395b2cc2",
          measurementId: "G-LW39GTYNDH"),
    );
  }
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit()..getUserData(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        onGenerateRoute: onGenerateRoute,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const HomeView();
              } else if (snapshot.hasError) {
                showSnackBar(snapshot.error.toString());
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                color: primaryColor,
              );
            }
            return const SignInView();
          },
        ),
      ),
    );
  }
}
