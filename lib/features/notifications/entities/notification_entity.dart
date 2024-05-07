import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationEntity {

  final String? notificationId;
  final String? uid;
  final String? otherUid;
  final String? username;
  final String? userProfile;
  final Timestamp? createdAt;
  final String? description;

  NotificationEntity(
      {this.notificationId,
        this.uid,
        this.otherUid,
        this.username,
        this.userProfile,
        this.createdAt,
        this.description,
      });


  factory NotificationEntity.fromSnapshot(DocumentSnapshot snapshot) {
    var snapshotMap = snapshot.data() as Map<String, dynamic>;

    return NotificationEntity(
      notificationId: snapshot.get('notificationId'),
      uid: snapshot.get('uid'),
      otherUid: snapshot.get('otherUid'),
      username: snapshot.get('username'),
      userProfile: snapshot.get('userProfile'),
      description: snapshot.get('description'),
      createdAt: snapshot.get("createdAt"),
    );
  }


  Map<String, dynamic> toDocument() {
    return {
      "uid": uid,
      "otherUid": otherUid,
      "username": username,
      "notificationId": notificationId,
      "userProfile": userProfile,
      "description": description,
      "createdAt": createdAt,
    };
  }
}