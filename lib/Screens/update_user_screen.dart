import 'package:flutter/material.dart';

import '../Controller/user_controller.dart';

class UpdateUserView extends StatelessWidget {
  final int id;
  final String name;
  final String userName;
  final String email;
  UpdateUserView(
      {super.key,
      required this.name,
      required this.userName,
      required this.email,
      required this.id});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = name;
    emailController.text = email;
    userNameController.text = userName;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(controller: nameController),
          TextField(controller: emailController),
          TextField(controller: userNameController),
          ElevatedButton(
              onPressed: () async {
                var response = await updateUser(
                    id: id,
                    name: nameController.text,
                    userName: userNameController.text,
                    email: emailController.text);
                if (response["success"]) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("User updated Successfully")));
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("User not updated")));
                }
              },
              child: const Text("Update User"))
        ],
      ),
    );
  }
}
