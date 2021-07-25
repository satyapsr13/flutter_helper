//https://picsum.photos/200/300   // ⌘ ñ
//use lint
//import '../widget/detailscreen.dart';

import 'dart:convert';

import 'package:app3/glasscard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'homepage',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
//routes: {  targetscreen.routeName:(ctx)=>targetscreen(),},
    );
  }
}

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getuserData() async {
    var response =
        await http.get(Uri.http('jsonplaceholder.typicode.com', 'users'));
    var jsondata = jsonDecode(response.body);
    List<User> users = [];
    for (var u in jsondata) {
      // User user=User(u["name"],u["email"],u["username"]);
      User user = User(
        name: u["name"],
        email: u["email"],
        username: u["username"],
      );

      users.add(user);
    }
    print(users[5]);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbar'),
        // shape: CustomShapeBorder(),
        actions: [],
      ),
      
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: getuserData(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occured',
                style: TextStyle(fontSize: 18),
              ),
            );

            // if we got our data
          } else
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      // Image.network( '',  height: 400,  width: 250
                      //               ),
                      //https://picsum.photos/200/300

                      'https://picsum.photos/200'),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  // itemCount: snapshot.data!.snapshot.value.length,
                  itemBuilder: (context, index) {
                    return
                        //   ListTile(
                        //   title: Text(snapshot.data[index].name),
                        //   // leading: Icon(Icons.add),
                        //   // trailing: Icon(Icons.done),
                        //   // subtitle: Text('This is subtitle'),
                        //   // selected: true,
                        // );
                        GlassCard(
                      id: (index+1).toString(),
                      name: snapshot.data[index].name,
                      email: snapshot.data[index].email,
                      username: snapshot.data[index].username,
                    );
                  }),
            );
        },
      ),
      // drawer: Drawer(),
    );
  }
}

class User {
  final String name;
  final String email;
  final String username;
  User({
    this.name,
    this.email,
    this.username,
  });
  // email,username;

}
