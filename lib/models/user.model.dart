class UserModel {
  const UserModel(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.birthDate,
      required this.gender,
      required this.password,
      required this.experience,
      required this.role,
      this.avatar});

  final String firstName;
  final String lastName;
  final String email;
  final DateTime birthDate;
  final String gender;
  final String password;
  final int experience;
  final String role;
  final String? avatar;

  UserModel.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'] as String,
        lastName = json['lastName'] as String,
        email = json['email'] as String,
        birthDate = DateTime.parse(json['birthDate'] as String),
        gender = json['gender'] as String,
        password = json['password'] as String,
        experience = json['experience'] as int,
        role = json['role'] as String,
        avatar = json['avatar'] as String?;

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'birthDate': birthDate,
        'gender': gender,
        'password': password,
        'experience': experience,
        'role': role,
        if (avatar != null) 'avatar': avatar,
      };

  int get level => (experience ~/ 4000);
  double get progress => (experience % 4000) / 4000; // between 0 and 1
}
