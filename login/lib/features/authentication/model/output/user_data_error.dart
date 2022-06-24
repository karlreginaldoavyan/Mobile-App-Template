class UserDataError {
  UserDataError({
    required this.message,
    required this.status,
    required this.data,
  });

  final String message;
  final bool status;
  final String data;

  factory UserDataError.fromMap(Map<String, dynamic> json) => UserDataError(
        message: json["message"],
        status: json["status"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "status": status,
        "data": data,
      };
}
