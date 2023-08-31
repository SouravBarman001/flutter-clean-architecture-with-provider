

import 'package:flutter_clean_architecture/feature/users_list/domain/entities/user_list_entities.dart';

abstract class UserListRepository{

  Future<List<UserListEntity>> getUserList();

}