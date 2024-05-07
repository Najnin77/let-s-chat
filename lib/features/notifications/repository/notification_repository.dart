
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lets_chat/features/app/const/firebase_collection_const.dart';
import 'package:lets_chat/features/notifications/entities/notification_entity.dart';


class NotificationRepository {
  final FirebaseFirestore fireStore;

  NotificationRepository({required this.fireStore});


  Future<void> generateNotification(NotificationEntity notification) async {

    final notificationCollection =
    fireStore.collection(FirebaseCollectionConst.users)
        .doc(notification.otherUid)
        .collection(FirebaseCollectionConst.notifications);

    final String notificationId = notificationCollection.doc().id;

    final notificationData = NotificationEntity(
        notificationId: notificationId,
        uid: notification.uid,
        otherUid: notification.otherUid,
        username: notification.username,
        userProfile: notification.userProfile,
        createdAt: Timestamp.now(),
        description: notification.description
    ).toDocument();

    try {

      await notificationCollection.doc(notificationId).set(notificationData);

    } catch (e) {
      print("error occur while generating notification $e");
    }


  }
}