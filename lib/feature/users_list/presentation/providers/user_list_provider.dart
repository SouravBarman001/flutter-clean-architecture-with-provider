

import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/feature/users_list/data/repositories/user_list_repository_impl.dart';
import 'package:flutter_clean_architecture/feature/users_list/domain/repositories/user_list_repository.dart';

import '../../domain/entities/user_list_entities.dart';
import '../../domain/use_cases/user_list_use_case.dart';

class UserListProvider extends ChangeNotifier{

  late UserListUseCase useCase;
   UserListProvider(this.useCase);
  late List<UserListEntity> _userList = [];

  List<UserListEntity> get userList => _userList;

   Future<void> fetchList() async{

    _userList = await useCase.call();
    notifyListeners();
  }
}