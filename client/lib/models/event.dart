class EventModel {
  EventModel();

  int id;
  String name;
  String subscriptionLink;
  String description;
  String image;
  int idUser;
  int idSubscribe;
  DateTime dtUpdate;
  DateTime dtInit;
  DateTime dtEnd;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['name'] = this.name;
    map['description'] = this.description;
    map['subscriptionLink'] = this.subscriptionLink;
    map['dtInit'] = this.dtInit != null ? this.dtInit.toString() : '';
    map['dtEnd'] = this.dtEnd != null ? this.dtEnd.toString() : '';
    map['image'] = this.image != null ? this.image : null;

    return map;
  }

  EventModel.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        name = jsonMap['name'],
        subscriptionLink = jsonMap['subscriptionLink'],
        description = jsonMap['description'],
        image = jsonMap['image'],
        idUser = jsonMap['idUser'],
        dtInit = DateTime.parse(jsonMap['dtInit']),
        dtEnd = DateTime.parse(jsonMap['dtEnd']),
        idSubscribe = jsonMap['idSubscribe'];
}
