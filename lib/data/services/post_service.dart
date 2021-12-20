import 'package:broadcast_movie/data/models/post_model.dart';
import 'package:firebase_database/firebase_database.dart';

class Post_service{
  final DatabaseReference _post_ref=FirebaseDatabase.instance.reference().child('Posts');

  void save_post(Post_model post){
    _post_ref.push().set(post.toJson());
  }

  Query get_posts() => _post_ref;
}
