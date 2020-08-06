class User {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String email;

  User({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.email,
  });

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        phoneNumber = data['phoneNumber'],
        email = data['email'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }
}
