class User {
  /*String name;
  String firstname;
  String thumbnail;

  User(this.name, this.firstname, this.thumbnail);

  User.fromJson(Map json)
      : name = json['user_name'],
        firstname = json['user_firstname'],
        thumbnail = json['user_thumbnail'];
  */
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
  double latitude;
  double longitude;
  int age;

  User(this.id, this.nom, this.prenom, this.mail, this.dateDeNaissance, this.ville, this.pays, this.photo, this.profession, this.diplome, this.statut, this.latitude, this.longitude, this.age);
  //User();

  User.fromJson(Map json)
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
      latitude = json['latitude'],
      longitude = json['longitude'],
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
}
