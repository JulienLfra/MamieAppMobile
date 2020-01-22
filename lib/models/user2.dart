class User2 {
  int id;
  String nom;
  String prenom;
  String mail;
  String dateDeNaissance;
  String ville;
  String pays;
  String photo;
  String profession;
  String diplome;
  String statut;
  int age;

  //User2(this.id, this.nom, this.prenom, this.mail, this.dateDeNaissance, this.ville, this.pays, this.photo, this.profession, this.diplome, this.statut, this.age);
  User2();

  User2.fromJson(Map json)
    : id = json['id'],
      nom = json['nom'],
      prenom = json['prenom'],
      mail = json['mail'],
      dateDeNaissance = json['dateDeNaissance'],
      ville = json['ville'],
      pays = json['pays'],
      photo = json['photo'],
      profession = json['profession'],
      diplome = json['diplome'],
      statut = json['statut'],
      age = json['age']
    ;

  Map<String, dynamic> toJson() =>
      {
        'id':id,
        'nom': nom,
        'prenom': prenom,
        'mail':mail,
        'dateDeNaissance':dateDeNaissance ,
        'ville': ville,
        'pays' :pays,
        'photo': photo,
        'profession': profession,
        'diplome': diplome,
        'statut': statut,
        'age':age
      };


  // Facto de Julien
  /*
    factory User2.fromJson(dynamic json) {
      return User2(json['id']as int, json['nom'] as String,json['prenom'] as String, json['mail'] as String,json['dateDeNaissance'] as String, json['ville'] as String,json['pays'] as String,json['photo'] as String,json['profession'] as String,json['diplome'] as String,json['statut'] as String,json['age'] as int );
    }
  */
}
