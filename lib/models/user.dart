import '../HomeState.dart';

class User {
  String name;
  String firstname;
  String thumbnail;

  User(this.name, this.firstname, this.thumbnail);

  User.fromJson(Map json)
      : name = json['user_name'],
        firstname = json['user_firstname'],
        thumbnail = json['user_thumbnail'];
}
