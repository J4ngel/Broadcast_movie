class Location_users_model{
  String name;
  String latitude;
  String longitude;
  
  Location_users_model(this.name, this.latitude, this.longitude);

  Location_users_model.fromJson(Map<dynamic, dynamic>json)
  :name = json['name'] as String,
  latitude = json['latitude'] as String,
  longitude = json['longitude'] as String;

  Map<dynamic, dynamic>toJson() => <dynamic, dynamic>{
    'name':name,
    'latitude':latitude,
    'longitude':longitude
  };
}