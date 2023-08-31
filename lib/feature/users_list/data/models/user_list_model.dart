import '../../domain/entities/user_list_entities.dart';

class UserListModel extends UserListEntity {
  UserListModel(
      {required super.id,
      required super.name,
      required super.username,
      required super.email});

  factory UserListModel.fromJson(Map<String, dynamic> json) {
  return UserListModel(
      id: json['id'] ?? '',
      name: json['name'] ?? 'sourav',
      username: json['username'] ?? '',
      email: json['email'] ?? '');
  }
}

