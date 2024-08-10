import 'package:app_task/Home_Screen.dart';
import 'package:app_task/SplashScreen.dart';

import 'package:app_task/user.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(),
    );
  }
}

Map<String, User> users = {
  "Mazen@gmail.com": User(email: "Mazen@gmail.com", password: "1234"),
  "anas@gmail.com": User(email: "anas@gmail.com", password: "abcd"),
};

bool isSecured = true;

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String Remail = "Mazen@gmail.com";
  String Rpassword = "1234";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text(
          "Login Screen",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/Login.jpg"),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      label: Text("Email"),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      )),
                ),
                SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: isSecured,
                  decoration: InputDecoration(
                      label: Text("Password"),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isSecured = !isSecured;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye)),
                      border: OutlineInputBorder(borderSide: BorderSide())),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    String email = emailController.text;
                    String password = passwordController.text;

                    //User user = users[email]!;
                    if (email == Remail && password == Rpassword) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                      // Navigator.of(context).push(MaterialPageRoute(
                      //  builder: (context) => const s_app()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Invalid username!'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(
                          15,
                        )),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.login,
                            color: Colors.black,
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(
                          15,
                        )),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Jion as guest",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Forget your password?",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.red,
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
