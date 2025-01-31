import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_chat/features/app/home/home_page.dart';
import 'package:lets_chat/features/app/splash/splash_screen.dart';
import 'package:lets_chat/features/app/theme/style.dart';
import 'package:lets_chat/features/chat/presentation/cubit/chat/chat_cubit.dart';
import 'package:lets_chat/features/chat/presentation/cubit/message/message_cubit.dart';
import 'package:lets_chat/features/status/presentation/cubit/get_my_status/get_my_status_cubit.dart';
import 'package:lets_chat/features/status/presentation/cubit/status/status_cubit.dart';
import 'package:lets_chat/features/user/presentation/cubit/auth/auth_cubit.dart';
import 'package:lets_chat/features/user/presentation/cubit/credential/credential_cubit.dart';
import 'package:lets_chat/features/user/presentation/cubit/get_device_number/get_device_number_cubit.dart';
import 'package:lets_chat/features/user/presentation/cubit/get_single_user/get_single_user_cubit.dart';
import 'package:lets_chat/features/user/presentation/cubit/user/user_cubit.dart';
import 'package:lets_chat/firebase_options.dart';
import 'package:lets_chat/routes/on_generate_routes.dart';
import 'main_injection_container.dart' as di;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider(
          create: (context) => di.sl<CredentialCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<GetSingleUserCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<UserCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<GetDeviceNumberCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<ChatCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<MessageCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<StatusCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<GetMyStatusCubit>(),
        ),
        // BlocProvider(
        //   create: (context) => di.sl<CallCubit>(),
        // ),
        // BlocProvider(
        //   create: (context) => di.sl<MyCallHistoryCubit>(),
        // ),
        // BlocProvider(
        //   create: (context) => di.sl<AgoraCubit>(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(
              seedColor: tabColor,
              brightness: Brightness.dark
          ),
          scaffoldBackgroundColor: searchBarColor,
          dialogBackgroundColor: appBarColor,
          appBarTheme: const AppBarTheme(
            color: appBarColor,
          ),
        ),
        initialRoute: "/",
        onGenerateRoute: OnGenerateRoute.route,
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return HomePage(uid: authState.uid);
                }
                return SplashScreen();
              },
            );
          },
        },
      ),
    );
  }
}