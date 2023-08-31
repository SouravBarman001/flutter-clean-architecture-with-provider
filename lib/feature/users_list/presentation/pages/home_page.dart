import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/feature/users_list/presentation/providers/user_list_provider.dart';
import 'package:provider/provider.dart';

import '../../data/data_sources/user_list_data_source_impl.dart';
import '../../data/repositories/user_list_repository_impl.dart';
import '../../domain/use_cases/user_list_use_case.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserListProvider>(context, listen: false).fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('User list'),
        ),
        body: Consumer<UserListProvider>(
          builder: (context,provider,_){
            if(provider.userList.isEmpty){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemBuilder: (BuildContext context, index) {
                  return  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.cyan,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(provider.userList[index].name.toString(), style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600
                        ),),
                        const Icon(Icons.person,color: Colors.white,size: 30,),
                      ],
                    ),
                  );
                },
                itemCount: provider.userList.length);
          },
        ));
  }
}
