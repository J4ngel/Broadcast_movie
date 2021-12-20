import 'package:firebase_database/firebase_database.dart';

class Message {
  String? key;
  String text;
  String user;
  String mail;

  Message(this.text, this.user, this.mail);

  Message.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        text = snapshot.value["text"],
        user = snapshot.value["uid"],
        mail = snapshot.value["email"];

  toJson() {
    return {"text": text, "user": user, "email": mail};
  }
}
