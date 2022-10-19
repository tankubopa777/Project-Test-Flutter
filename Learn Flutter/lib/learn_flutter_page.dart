import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({super.key});

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Learn Flutter'),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            Image.asset('images/asuka langley.jpg'),
            SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
            ),
            Container(
              margin:  const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              color: Colors.blueGrey,
              width: double.infinity,
              child: Center(
                child: const Text(
                  "This is text widget",
                  style: TextStyle(color: Colors.white60),
                ),
              ),
              
            ),
            ElevatedButton(
              onPressed: () {
              debugPrint("Elevated Button");
            }, 
            child: const Text("Elevated Button")),
            ElevatedButton(
              onPressed: () {
              debugPrint("Elevated Button");
            }, 
            child: const Text("Elevated Button"))
          ],
        ));
  }
}
