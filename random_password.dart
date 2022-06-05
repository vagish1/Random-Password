import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController password = TextEditingController();

    return Scaffold(
      body: TextField(
        controller: password,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            label: const Text("Your password Will appear here."),
            suffix: InkWell(
              onTap: () {
                generateAndUpdatePassword(password);
              },
              child: const Icon(Icons.generating_tokens_outlined),
            )),
      ),
    );
  }

  void generateAndUpdatePassword(TextEditingController password) {
    String capitalLetter = "ABVDEFGHIJKKLMNOPQRSTUVWXYZ";
    String smallLetter = "abcdefghijklmnopqrstuvwxyz";
    String specialCharacter = "`/.,><;[]{}@#\$^&*()-=+-.~";
    String number = "0123456789";

    String passwordString =
        "$capitalLetter-$smallLetter-$specialCharacter-$number";

    password.text = List.generate(20, (index) {
      int randomIndex = Random.secure().nextInt(passwordString.length);
      return passwordString[randomIndex];
    }).join("");
  }
}
