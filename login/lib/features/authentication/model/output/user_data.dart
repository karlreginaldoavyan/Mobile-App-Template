// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

class UserData {
  UserData({
    required this.user,
    required this.token,
    required this.accessLevel,
  });

  final User user;
  final String token;
  final dynamic accessLevel;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        user: User.fromJson(json["user"]),
        token: json["token"],
        accessLevel: json["access_level"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
        "access_level": accessLevel,
      };
}

class User {
  User({
    required this.id,
    required this.u,
    required this.email,
    required this.fb,
    required this.uDateRegistered,
    required this.uDateRegisteredString,
    required this.v,
  });

  final String id;
  final String u;
  final String email;
  final String fb;
  final int uDateRegistered;
  final String uDateRegisteredString;
  final int v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        u: json["u"],
        email: json["email"],
        fb: json["fb"],
        uDateRegistered: json["u_date_registered"],
        uDateRegisteredString: json["u_date_registered_string"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "u": u,
        "email": email,
        "fb": fb,
        "u_date_registered": uDateRegistered,
        "u_date_registered_string": uDateRegisteredString,
        "__v": v,
      };
}
