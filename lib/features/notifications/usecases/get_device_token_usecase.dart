import 'package:firebase_messaging/firebase_messaging.dart';

class GetDeviceTokenUseCase{
  final FirebaseMessaging firebaseMessaging;

  GetDeviceTokenUseCase({required this.firebaseMessaging});

  Future<String?> call() async {
    return await firebaseMessaging.getToken();
  }
}