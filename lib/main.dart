import 'package:fip9/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:fip9/configuration/app_colors.dart';
import 'package:fip9/firebase_options.dart';
import 'package:fip9/get_state_management/counter/view/counter_screen.dart';
import 'package:fip9/get_state_management/counter/view/counter_screen_old.dart';
import 'package:fip9/login/login_screen.dart';
import 'package:fip9/register/register_screen_2.dart';
import 'package:fip9/splash_screen/splash_screen.dart';
import 'package:fip9/tabs/tabs_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';

import 'register/register_screen.dart';

const AndroidNotificationChannel androidChannel = AndroidNotificationChannel(
    "high_importance_channel", 'high importance channel',
    importance: Importance.max, playSound: true, enableVibration: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // thread
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (message.notification != null) {
    _showNotification(message, message.notification!);
  }
}

void _showNotification(RemoteMessage message, RemoteNotification notification) {
  flutterLocalNotificationsPlugin.show(
      message.hashCode,
      notification.title ?? '',
      notification.body,
      NotificationDetails(
          android: AndroidNotificationDetails(
              androidChannel.id, androidChannel.name,
              playSound: true,
              enableVibration: true,
              icon: '@mipmap/ic_launcher',
              color: Colors.orange),
          iOS: DarwinNotificationDetails(
              presentSound: true,
              presentBadge: true,
              presentAlert: true,
              badgeNumber: 1)));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessaging.instance.requestPermission();
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  String? token = await FirebaseMessaging.instance.getToken(); // abc123
  print(token);
  AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  DarwinInitializationSettings iosInitializationSettings =
      DarwinInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings, iOS: iosInitializationSettings);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(androidChannel); // native channel
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      sound: true, badge: true, alert: true);
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(const MyApp());
}
// stf   statefull widget
// stl stateless widget

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 1;

  @override
  void initState() {
    _listenFirebaseNotifications();

    super.initState();
  }

  // setState
  @override
  Widget build(BuildContext context) {
    // ctrl + s

    return OKToast(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/login": (_) => LoginScreen(),
          "/register": (_) => const RegisterScreen(),
          "/splash": (_) => const SplashScreen(),
          "/tabsScreen": (_) => const TabsScreen(),
          "/bottomNavBarScreen": (_) => const BottomNavBarScreen(),
          "/counterExample": (_) => const CounterScreenOld(),
          "/counterScreen": (_) => CounterScreen(),
        },
        //configuration
        initialRoute: '/login',
        theme: ThemeData(
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: AppColors.textColor),
              bodySmall: TextStyle(color: AppColors.textColor),
              bodyMedium: TextStyle(color: AppColors.textColor)),
          scaffoldBackgroundColor: Colors.white,
          dialogBackgroundColor: Colors.red,
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.red, highlightColor: Colors.orange),
          primaryTextTheme: const TextTheme(
              titleLarge: TextStyle(color: AppColors.textColor)),
        ),
        darkTheme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            dialogBackgroundColor: Colors.black,
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.blue,
              highlightColor: Colors.blueAccent,
            ),
            buttonBarTheme: ButtonBarThemeData()),
        // home: SplashScreen(),
      ),
    ); // widget confirguration
  }

  void _listenFirebaseNotifications() {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        RemoteNotification notification = message.notification!;
        _showNotification(message, notification);
      }
    });
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({super.key});

  int counter = 1;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // fontFamily: 'roboto',
          textTheme: GoogleFonts.openSansTextTheme(textTheme)),
      routes: {
        "/login": (_) => LoginScreen(),
        "/register": (_) => const RegisterScreen2(),
        "/splash": (_) => const SplashScreen(),
      },
      home: Container(
        color: Colors.white,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${counter}',
              style: GoogleFonts.actor(),
            ), // 15
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  counter++;
                  print(counter);
                },
                child: const Text('increase'))
          ],
        )),
      ),
    ); //
  }
}
