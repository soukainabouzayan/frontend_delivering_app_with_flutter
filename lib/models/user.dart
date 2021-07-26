class User {
  int id;
  String nom;
  String prenom;
  String email;
  String adresse;
  String tel;
  String role;
  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nom = json['nom'],
        prenom = json['prenom'],
        email = json['email'],
        adresse = json['adresse'],
        tel = json['tel'],
        role = json['role'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'nom': nom,
    'prenom': prenom,
    'adresse': adresse,
    'email': email,
    'tel': tel,
    'role': role,
  };

  @override
  String toString() {
    return '{ ${this.id}, ${this.nom}, ${this.prenom}, ${this.adresse}, ${this.email}, ${this.tel}, ${this.role} }';
  }
}
