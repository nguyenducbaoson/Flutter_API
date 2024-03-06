import 'package:baitapapi/services/user_api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest API'),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: ((context, index) {
            final user = users[index];
            final color = user.gender == 'male' ? Colors.blue : Colors.pink;
            return ListTile(
              title: Text(user.fullName),
              subtitle: Text(user.phone),
              // tileColor: color,
            );
          })),
    );
  }

  void fetchUsers() async {
    final response = await UserAPI.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
