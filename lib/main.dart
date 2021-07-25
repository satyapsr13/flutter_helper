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
















YML FILE
  name: app3
description: A new Flutter project.

# The following line prevents the package from being accidentally published to
# pub.dev using `pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
version: 1.0.0+1

environment:
  sdk: ">=2.7.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.2
  http: ^0.13.3

dev_dependencies:
  flutter_test:
    sdk: flutter

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec
# The following section is specific to Flutter.
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true
  # To add assets to your application, add an assets section, like this:
  # assets:
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg
  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/assets-and-images/#resolution-aware.
  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/assets-and-images/#from-packages
  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  # fonts:
  #   - family: Schyler
  #     fonts:
  #       - asset: fonts/Schyler-Regular.ttf
  #       - asset: fonts/Schyler-Italic.ttf
  #         style: italic
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/custom-fonts/#from-packages
