import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:network_connectivity/network_connectivity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isNetworkAvailable = false;

  @override
  void initState() {
    super.initState();
    initNetworkState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initNetworkState() async {
    bool isNetworkAvailable;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      isNetworkAvailable =
          await NetworkConnectivity.isNetworkAvailable ?? false;
    } on PlatformException {
      isNetworkAvailable = false;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _isNetworkAvailable = isNetworkAvailable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('app'),
        ),
        body: Center(
          child: Text('Is Connected: $_isNetworkAvailable\n'),
        ),
      ),
    );
  }
}
