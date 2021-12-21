
import 'package:broadcast_movie/data/models/location_user_Model.dart';
import 'package:firebase_database/firebase_database.dart';
class Near_me_service{
  final DatabaseReference _near_me_ref = FirebaseDatabase.instance.reference().child('Near_me');

  void save_near_me(Location_users_model location){
    _near_me_ref.push().set(location.toJson());
  }

  Query get_near_me() => _near_me_ref;
}