import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/feature/users_list/data/repositories/user_list_repository_impl.dart';
import 'package:provider/provider.dart';

import 'feature/users_list/data/data_sources/user_list_data_source_impl.dart';
import 'feature/users_list/domain/repositories/user_list_repository.dart';
import 'feature/users_list/domain/use_cases/user_list_use_case.dart';
import 'feature/users_list/presentation/pages/home_page.dart';
import 'feature/users_list/presentation/providers/user_list_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserListProvider(UserListUseCase(UserListRepositoryImpl(UserListDataSourceImpl())))),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
