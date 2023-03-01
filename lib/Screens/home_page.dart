import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_api/Controller/user_controller.dart';
import 'package:post_api/Screens/add_user_screen.dart';
import 'package:post_api/Screens/update_user_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddUserScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: getUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    snapshot.data.data[index].name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    snapshot.data.data[index].id.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: Wrap(
                    children: [
                      IconButton(
                          onPressed: () async {
                            await deleteUser(901);
                            setState(() {});
                          },
                          icon: const Icon(
                            CupertinoIcons.delete,
                            color: Colors.black,
                          )),
                      IconButton(
                          onPressed: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateUserView(
                                          id: snapshot.data.data[index].id,
                                          name: snapshot.data.data[index].name,
                                          email:
                                              snapshot.data.data[index].email,
                                          userName: snapshot
                                              .data.data[index].username,
                                        )));
                            print("hello world");
                            setState(() {});
                          },
                          icon: const Icon(Icons.edit)),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
