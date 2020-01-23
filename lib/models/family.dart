class Family {
  int id;
  String nom;

  Family(int id, String nom) {
    this.id = id;
    this.nom = nom;
  }

  Family.fromJson(Map json)
      : id = json['id'],
        nom = json['nom'];

  Map toJson() {
    return {'id': id, 'nom': nom};
  }
}
