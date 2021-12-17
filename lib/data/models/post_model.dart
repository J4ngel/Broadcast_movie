class Post_model{
  late final String user;
  late final String post;
  late final DateTime date;

  Post_model(this.user, this.post, this.date);

  Post_model.fromJson(Map<dynamic,dynamic>json)
  :user = json['user'] as String,
  post = json['post'] as String,
  date = DateTime.parse(json['date'] as String);

  Map<dynamic,dynamic>toJson()=> <dynamic,dynamic>{
    'user': user,
    'post': post,
    'date': date.toString()
  };
}