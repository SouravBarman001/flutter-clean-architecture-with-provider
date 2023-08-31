
import 'package:flutter_clean_architecture/feature/users_list/domain/entities/user_list_entities.dart';
import 'package:flutter_clean_architecture/feature/users_list/domain/repositories/user_list_repository.dart';

import '../../../../use_case/use_case.dart';

class UserListUseCase implements UseCase<List<UserListEntity>,void>{

  late final UserListRepository userListRepository;

  UserListUseCase(this.userListRepository); // ???

  @override
   Future<List<UserListEntity>> call({void params}) {
    return userListRepository.getUserList();
  }

}