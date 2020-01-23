class Family {
  String id_famille;
  String nom;

  Family(String id_famille, String nom) {
    this.id_famille = id_famille;
    this.nom = nom;
  }

  Family.fromJson(Map json)
      : id_famille = json['id_famille'].toString(),
        nom = json['nom'];

  Map toJson() {
    return {'id_famille': id_famille, 'nom': nom};
  }
}
