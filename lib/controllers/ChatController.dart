import 'package:broadcast_movie/data/models/chat/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class ChatController extends GetxController {
  final databaseReference = FirebaseDatabase.instance.reference();
  var messages = <Message>[].obs;

  start() {
    messages.clear();
    databaseReference
        .child("fluttermessages")
        .onChildAdded
        .listen(_onEntryAdded);
    databaseReference
        .child("fluttermessages")
        .onChildAdded
        .listen(_onEntryChange);
  }

  stop() {
    databaseReference
        .child("fluttermessages")
        .onChildAdded
        .listen(_onEntryAdded)
        .cancel();

    databaseReference
        .child("fluttermessages")
        .onChildAdded
        .listen(_onEntryChange)
        .cancel();
  }

  _onEntryAdded(Event event) {
    print("Something was added");
    messages.add(Message.fromSnapshot(event.snapshot));
  }

  _onEntryChange(Event event) {
    var oldEntry = messages.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    messages[messages.indexOf(oldEntry)] = Message.fromSnapshot(event.snapshot);
  }

  Future<void> sendMsg(String text) async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    String? email = FirebaseAuth.instance.currentUser?.email;
    try {
      databaseReference
          .child("fluttermessages")
          .push()
          .set({'text': text, 'uid': uid, 'email': email});
    } catch (error) {
      logError("Error sending message $error");
      return Future.error(error);
    }
  }

  Future<void> updateMsg(Message message) async {
    logInfo('updateMsg with key ${message.key}');
    try {
      databaseReference
          .child("fluttermessages")
          .child(message.key!)
          .set({'text': 'updated ' + message.text, 'uid': message.user});
    } catch (error) {
      logError("Error updating msg $error");
      return Future.error(error);
    }
  }

  Future<void> deleteMsg(Message message, int index) async {
    logInfo('deleteMsg with key ${message.key}');
    try {
      databaseReference
          .child("fluttermessages")
          .child(message.key!)
          .remove()
          .then((value) => messages.removeAt(index));
    } catch (error) {
      logError("Error deleting msg $error");
      return Future.error(error);
    }
  }
}
