import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:localstorage/localstorage.dart';
import 'package:seventh_player/cores/custom_card.dart';
import 'package:seventh_player/features/video_player/presentation/controllers/video_player_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, VideoPlayerStore> {
  final LocalStorage storage = LocalStorage('token');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Exit'),
                content: const Text('do you really want to go out?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Modular.to.pop(),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Modular.to.navigate('/login'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          icon: const Icon(Icons.settings),
        ),
        title: Image.asset('assets/images/seventh.png'),
        centerTitle: true,
        actions: const [Icon(Icons.search)],
      ),
      body: _body(),
    );
  }

  _body() {
    final _loggedUsername = storage.getItem('get_username');

    return Observer(builder: (_) {
      return Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Hello, ',
                    style: TextStyle(
                        color: HexColor('#c3c908'),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    _loggedUsername,
                    style: TextStyle(color: HexColor('#1a6069'), fontSize: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        'File name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HexColor('#1a6069')),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller.fileName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'ex. my_video.mp4',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.getUrl();
                    },
                    child: Container(
                      width: 150,
                      child: const Center(
                        child: Text("See video"),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: HexColor("1a6069"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  controller.statusVideo == 2
                      ? const Center(
                          child: Text('Video not found!'),
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
