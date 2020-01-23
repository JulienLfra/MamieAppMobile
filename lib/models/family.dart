class Family {
  String id;
  String nom;

  Family(String id, String nom) {
    this.id = id;
    this.nom = nom;
  }

  Family.fromJson(Map json)
      : id = json['id'].toString(),
        nom = json['nom'];

  Map toJson() {
    return {'id': id, 'nom': nom};
  }
}
