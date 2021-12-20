class State_model {
  late final String name;
  late final String state;
  late final DateTime day;

  State_model(this.name, this.state, this.day);

  State_model.fromJson(Map<dynamic, dynamic>json)
  :name = json['name'] as String,
  state = json['state'] as String,
  day = DateTime.parse(json['day'] as String);

  Map<dynamic, dynamic>toJson() => <dynamic, dynamic>{
    'name':name,
    'state':state,
    'day':day.toString()
  };
}
