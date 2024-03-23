class Profil {
  String firstName;
  String lastName;
  String city;
  String country;
  String imageUrl;
  String gender;
  String email;

  Profil(
      {required this.firstName,
      required this.lastName,
      required this.city,
      required this.country,
      required this.imageUrl,
      required this.gender,
      required this.email});

  factory Profil.fromJson(Map<String, dynamic> json) {
    return Profil(
      firstName: json['name']['first'],
      lastName: json['name']['last'],
      city: json['location']['city'],
      country: json['location']['country'],
      imageUrl: json['picture']['large'],
      gender: json['gender'],
      email: json['email'],
    );
  }
}
