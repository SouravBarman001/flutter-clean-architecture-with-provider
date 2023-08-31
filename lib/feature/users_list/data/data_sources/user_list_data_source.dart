
import 'package:flutter_clean_architecture/feature/users_list/data/models/user_list_model.dart';
import 'package:http/http.dart' as http;
abstract class UserListDataSource{
  Future<List<dynamic>> getResponse();
}