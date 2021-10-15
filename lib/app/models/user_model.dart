class User {
  String? image;
  String? firstName;
  String? lastName;
  String? id;

  User({this.id, this.image, this.firstName, this.lastName});

  User.fromJson(Map<String, dynamic> json) {
    image = json['picture'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    id = json['id'];
  }
}
