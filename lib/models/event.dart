class Event {
  int id;
  String nom;
  String date;
  String lieu;
  String photo;
  String famille;


  Event(this.id, this.nom, this.date, this.lieu, this.photo, this.famille);
  //User();

  Event.fromJson(Map json)
      : id = json['id'],
        nom = json['nom'],
        date= json['date'],
        lieu = json['lieu'],
        photo = json['photo'],
        famille = json['famille']
  ;

  Map<String, dynamic> toJson() =>
      {
        'id':id,
        'nom': nom,
        'date':date ,
        'lieu': lieu,
        'photo': photo,
        'famille': famille,

      };
}
