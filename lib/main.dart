import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_task2/pages/form_page.dart';
import 'package:cloud_task2/pages/group_list_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'firebase_options.dart';

final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Log the payload when received in the background
  print('Background message received: ${message.data}');
  await handleIncomingMessage(message);
}

Future<void> handleIncomingMessage(RemoteMessage message) async {
  final data = message.data;

  // Log the payload for debugging
  print('Message payload: $data');

  // Subscribe or unsubscribe to topics based on data payload
  if (data.containsKey("subscribeToTopic")) {
    await FirebaseMessaging.instance.subscribeToTopic(data["subscribeToTopic"]);
  }
  if (data.containsKey("unsubscribeToTopic")) {
    await FirebaseMessaging.instance
        .unsubscribeFromTopic(data["unsubscribeToTopic"]);
  }

  // Save the message in Firestore
  await FirebaseFirestore.instance.collection('notifications').add({
    'data': data,
    'notification': message.notification != null
        ? {
            'title': message.notification!.title,
            'body': message.notification!.body
          }
        : {},
    'timestamp': Timestamp.now(),
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Firebase Messaging
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Initialize Local Notifications
  const AndroidInitializationSettings androidInitSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initSettings =
      InitializationSettings(android: androidInitSettings);
  await _localNotificationsPlugin.initialize(initSettings);

  // Handle messages when the app is opened from a terminated state
  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    if (message != null) {
      print('Initial message received: ${message.data}');
      handleIncomingMessage(message);
    }
  });

  // Handle messages when the app is in the foreground
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print('Foreground message received: ${message.data}');
    await handleIncomingMessage(message);

    RemoteNotification? notification = message.notification;
    if (notification != null) {
      _localNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
          ),
        ),
      );
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cloud Task App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cloud Task")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FormPage()),
                );
              },
              child: const Text("Add Group"),
            ),
            const SizedBox(height: 20), // Spacing between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => GroupsListPage()),
                );
              },
              child: const Text("View Groups"),
            ),
          ],
        ),
      ),
    );
  }
}
