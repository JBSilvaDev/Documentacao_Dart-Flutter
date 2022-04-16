import 'dart:convert';

class UserTypes {
  final String id;
  final String name;
  final String userId;

  UserTypes({
    required this.id,
    required this.name,
    required this.userId,
  });

  factory UserTypes.fromMap(Map<String, dynamic> map) {
    return UserTypes(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      name: map['name'] ?? '',
    );
  }
  
  factory UserTypes.fromJSON(String source) => UserTypes.fromMap(jsonDecode(source));

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userID': userId,
    };
  }
  String toJson() => jsonEncode(toMap());

  @override
  String toString() => 'UserTypes(id: $id, name: $name, userId: $userId)';
}

/*
    {
      "id": "1",
      "userId": "1",
      "name": "Ms. Forrest Stroman",
    }

*/