class NewUserModel {
  String? name;
  String? email;
  String? password;
  String? phone;
  String? gender;
  String? address;
  String? confirmPassword;

  NewUserModel({
    this.name,
    this.password,
    this.address,
    this.email,
    this.gender,
    this.phone,
    this.confirmPassword,
  });

  factory NewUserModel.fromJson(Map<String, dynamic> json) =>
      NewUserModel(
        name: json["name"],
        password: json["password"],
        address: json["address"],
        email: json["email"],
        gender: json["gender"],
        phone: json["phone"],
        confirmPassword: json["confirmPassword"],
      );

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "gender": gender,
      "address": address,
    };
  }

  NewUserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? phone,
    String? gender,
    String? address,
    String? confirmPassword,
  }) {
    return NewUserModel(
      name: name ?? this.name,
      address: address ?? this.address,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
