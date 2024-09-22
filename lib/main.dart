import 'package:FlutterQuiz/playQuiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  static TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();

  @override
  void initState() {
    super.initState();
    name.text = '';
    mail.text = '';
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: null,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Let's Play Quiz",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Enter your information's below",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: SizedBox(
                  width: 350,
                  child: TextField(
                    controller: name,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white54,
                      labelText: "Enter your name",
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                     
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12)),
                          borderSide:
                              BorderSide(width: 2, color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.white),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Center(
                child: SizedBox(
                  width: 350,
                  child: TextField(
                    controller: mail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white54,
                        labelText: "Enter your e-mail",
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                       
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () {
                  if (name.text.isEmpty || mail.text.isEmpty) {
                    var snackbar = const SnackBar(
                        content:
                            Text('please filled the both text-fields'));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlayQuiz()),
                    );
                  }
                },
                child: Center(
                  child: Container(
                    width: 350,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8), // 15
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: const Text(" START ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
