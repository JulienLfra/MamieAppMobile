class Family {
  int family_id;
  String family_name;

  Family(int id, String name) {
    this.family_id = id;
    this.family_name = family_name;
  }

  Family.fromJson(Map json)
      : family_id = json['family_id'],
        family_name = json['family_name'];

  Map toJson() {
    return {'family_id': family_id, 'family_name': family_name};
  }
}
