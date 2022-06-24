class UserRegister {
  UserRegister({
    required this.u,
    required this.email,
    required this.password,
    required this.fb,
  });

  final String u;
  final String email;
  final String password;
  final String fb;

  factory UserRegister.fromMap(Map<String, dynamic> json) => UserRegister(
        u: json["u"],
        email: json["email"],
        password: json["password"],
        fb: json["fb"],
      );

  Map<String, dynamic> toMap() => {
        "u": u,
        "email": email.toLowerCase(),
        "password": password,
        "fb": fb,
      };
}
