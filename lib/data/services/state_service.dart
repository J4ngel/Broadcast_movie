import 'package:broadcast_movie/data/models/state_model.dart';
import 'package:firebase_database/firebase_database.dart';

class State_service{
  final DatabaseReference _state_ref=FirebaseDatabase.instance.reference().child('states');

  void save_state(State_model state){
    _state_ref.push().set(state.toJson());
  }

  Query get_states() => _state_ref;
}
