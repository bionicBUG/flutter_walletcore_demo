import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eth Wallet demo',
      home: MyHomePage(title: 'Eth Wallet connect example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('test.wallet/eth');
  final controller = TextEditingController();
  String walletAddress = '';

  void connect(String walletSeed) async {
    walletAddress = await platform
        .invokeMethod("testEth", <String, String>{'seed': walletSeed});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Enter the seed'),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller,
            ),
            SizedBox(
              height: 10,
            ),
            Text("The wallet address is $walletAddress"),
            TextButton(
              child: Text("Connect Wallet"),
              onPressed: () async {
                if (controller.text == "") {
                } else {
                  connect(controller.text);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
