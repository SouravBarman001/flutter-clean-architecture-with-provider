

import 'package:flutter_clean_architecture/feature/users_list/data/models/user_list_model.dart';
import 'package:flutter_clean_architecture/feature/users_list/domain/entities/user_list_entities.dart';
import 'package:flutter_clean_architecture/feature/users_list/domain/repositories/user_list_repository.dart';

import '../data_sources/user_list_data_source_impl.dart';

class UserListRepositoryImpl implements UserListRepository{

  late List<UserListModel> list;
  late final UserListDataSourceImpl _userListDataSourceImpl;
  UserListRepositoryImpl(this._userListDataSourceImpl);


  @override
  Future<List<UserListModel>> getUserList() async {
    final response = await _userListDataSourceImpl.getResponse(); // Wait for the Future to complete
    final userList = List<UserListModel>.from((response).map((item) => UserListModel.fromJson(item)));

    return userList;
  }

}