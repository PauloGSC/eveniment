class UserModel {
  UserModel();

  int id;
  String name;
  String password;
  String image;
  String email;
  bool isAdmin;
  int registration;
  String ocupation;
  DateTime createdAt;
  DateTime updatedAt;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['name'] = this.name;
    map['password'] = this.password;
    map['image'] = this.image != null ? this.image : null;
    map['isAdmin'] = this.isAdmin;
    map['email'] = this.email;
    map['registration'] =
        this.registration != null ? this.registration.toString() : '';
    map['ocupation'] = this.ocupation != null ? this.ocupation.toString() : '';

    return map;
  }

  UserModel.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        name = jsonMap['name'],
        password = jsonMap['password'],
        image = jsonMap['image'],
        isAdmin = jsonMap['isAdmin'],
        email = jsonMap['email'],
        registration = jsonMap['registration'],
        ocupation = jsonMap['ocupation'],
        createdAt = DateTime.parse(jsonMap['createdAt']),
        updatedAt = DateTime.parse(jsonMap['updatedAt']);
}
