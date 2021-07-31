class UserModel {
  //
  final String name;
  final String phone;
  final String imageUrl;
  final String? email;

  UserModel({
    this.email,
    required this.name,
    required this.phone,
    required this.imageUrl,
  });
}
