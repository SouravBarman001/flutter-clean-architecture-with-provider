
import 'dart:convert';

import 'package:flutter_clean_architecture/feature/users_list/data/models/user_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_clean_architecture/feature/users_list/data/data_sources/user_list_data_source.dart';

class UserListDataSourceImpl implements UserListDataSource {

  String endpoint = "https://jsonplaceholder.typicode.com/users";
  @override
  Future<List<dynamic>> getResponse() async {
    print('inside getResponse-----------');
    //const url = "https://jsonplaceholder.typicode.com/users";
   // final response = await http.get(Uri.parse(url));
    http.Response response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      print('inside json response');
      List<dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to load user list');
    }
  }
}
