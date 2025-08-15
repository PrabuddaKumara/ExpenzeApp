class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final String conformpasword;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.conformpasword,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'emal': email,
      'password': password,
      'confpassword': conformpasword,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['emal'] ?? '',
      password: json['password'] ?? '',
      conformpasword: json['confpassword'] ?? '',
    );
  }
}
