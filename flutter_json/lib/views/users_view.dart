import 'package:flutter/material.dart';
import 'package:flutter_json/models/user_model.dart';
import 'package:flutter_json/services/services.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  late final Future<List<UserModel>> myList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: dataFutureBuilder(),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: const Text("User Model"),
    );
  }

  FutureBuilder<List<UserModel>> dataFutureBuilder() {
    return FutureBuilder<List<UserModel>>(
      future: userData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<UserModel> myUserList = snapshot.data!;
          return ListView.builder(
              itemCount: myUserList.length,
              itemBuilder: ((context, index) {
                var oankiUser = myUserList[index];
                return Card(
                  child: ListTile(
                    title: Text(oankiUser.name),
                    subtitle: Text(oankiUser.username),
                    trailing: CircleAvatar(
                      child: Text(oankiUser.id.toString()),
                    ),
                  ),
                );
              }));
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.hasError.toString(),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
