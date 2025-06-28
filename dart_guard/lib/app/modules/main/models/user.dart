class User {
  String id;
  String name;
  String document;
  String email;
  String profilePicture;

  User({
    required this.id,
    required this.name,
    required this.document,
    required this.email,
    required this.profilePicture,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: '',
      name: map['name'],
      document: map['document'],
      email: map['email'],
      profilePicture: map['profilePicture'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'document': document, 'email': email, 'profilePicture': profilePicture};
  }

  User copyWith({String? id, String? name, String? document, String? email, String? profilePicture}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      document: document ?? this.document,
      email: email ?? this.email,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  @override
  bool operator ==(covariant User other) {
    return other.id == id &&
        other.name == name &&
        other.document == document &&
        other.email == email &&
        other.profilePicture == profilePicture;
  }
}
