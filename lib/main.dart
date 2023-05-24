import 'package:flutter/material.dart';
import 'package:web_portal/loginscreen.dart';
import 'package:web_portal/registerscreen.dart';
import 'package:web_portal/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const ResponsiveNavbar(),
      routes: {
        loginRoute: (context) => const LoginScreen(),
        registerRoute: (context) => const Registerscreen(),
      },
    );
  }
}

class ResponsiveNavbar extends StatefulWidget {
  const ResponsiveNavbar({super.key});

  @override
  State<ResponsiveNavbar> createState() => _ResponsiveNavbarState();
}

class _ResponsiveNavbarState extends State<ResponsiveNavbar> {

  @override
  Widget build(BuildContext context) {
    //Navbar item list
    List<Widget> navItems = [
      const Text('Web Portal'),
      const Spacer(),
      ElevatedButton(onPressed: () {}, child: const Text("Home")),
      ElevatedButton(onPressed: () {}, child: const Text("Add Cafeteria")),
      ElevatedButton(onPressed: () {}, child: const Text("Add menu")),
      ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, loginRoute);
          },
          child: const Text("Login")),
      ElevatedButton(onPressed: () {
        Navigator.pushNamed(context, registerRoute);
      }, child: const Text("Register")),
    ];
    bool mobile = false;
    mobile = MediaQuery.of(context).size.width > 700 ? false : true;

//Alert box in drawer home button
    showAlertDialog(BuildContext context) {
// Create button
      Widget okButton = TextButton(
        child: const Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

// Create AlertDialog
      AlertDialog alert = AlertDialog(
        title: const Text("Simple Alert"),
        content: const Text("This is an alert message."),
        actions: [
          okButton,
        ],
      );

// show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

//Return Scaffold
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web Portal'),
        centerTitle: true,
        actions: mobile ? null : navItems,
      ),
//Drawer
      drawer: mobile
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Drawer Header'),
                  ),
                  ListTile(
                    title: const Text('Home'),
                    onTap: () {
                      showAlertDialog(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Add Cafeteria'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Add Menu'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Login'),
                    onTap: () {
                      Navigator.pushNamed(context, loginRoute);
                    },
                  ),
                   ListTile(
                    title: const Text('Register'),
                    onTap: () {
                      Navigator.pushNamed(context, registerRoute);
                    },
                  ),
                ],
              ),
            )

//Basic drawer example

// ? Drawer(
//     child: ListView(
//       padding: EdgeInsets.zero,
//       children: navItems,
//     ),
//   )
          : null,
      body: const Text('Main Container'),
    );
  }
}
