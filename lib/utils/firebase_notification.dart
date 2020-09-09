import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:inshort_clone/app/dio/dio.dart';

class PushNotificationsManager {
  PushNotificationsManager._();

  // factory PushNotificationsManager() => _instance;

  // static final PushNotificationsManager _instance =
  //     PushNotificationsManager._();

  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  // bool _initialized = false;

  static Future<void> init() async {
    // if (!_initialized) {
    // For iOS request permission first.
    // _firebaseMessaging.requestNotificationPermissions();
    // _firebaseMessaging.configure();

    // For testing purposes print the Firebase Messaging token
    String token = await _firebaseMessaging.getToken();
    print("FirebaseMessaging token: $token");

    await GetDio.getDio()
        .post('device_token/add/$token')
        .then((res) => print(res.statusCode));

    // _initialized = true;
  }
}
// }
