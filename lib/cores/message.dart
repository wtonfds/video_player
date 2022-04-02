import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MessageCard extends StatelessWidget {
  String message;
  MessageCard({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Card(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
        ListTile(
          title: Text(message),
        ),
        ButtonBar(
          children: [
            ElevatedButton(
              child: const Text('voltar'),
              onPressed: () {
                Modular.to.pop();
              },
            )
          ],
        ),
      ])),
    ));
  }
}
