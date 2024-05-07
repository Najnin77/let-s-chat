
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_chat/features/chat/chat_injection_container.dart';
import 'package:lets_chat/features/notifications/repository/notification_repository.dart';
import 'package:lets_chat/features/notifications/usecases/get_device_token_usecase.dart';
import 'package:lets_chat/features/status/presentation/status_injection_container.dart';
import 'package:lets_chat/features/user/user_injecttion_container.dart';

final sl = GetIt.instance;

Future<void> init() async {

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final firebaseMessaging = FirebaseMessaging.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
  sl.registerLazySingleton(() => firebaseMessaging);
  sl.registerLazySingleton<GetDeviceTokenUseCase>(() => GetDeviceTokenUseCase(firebaseMessaging: firebaseMessaging));
  sl.registerLazySingleton<NotificationRepository>(() => NotificationRepository(fireStore: fireStore));

  await userInjectionContainer();
  await chatInjectionContainer();
  await statusInjectionContainer();

}