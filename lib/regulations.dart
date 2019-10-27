import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';



class Viewer extends StatefulWidget {
  @override
  _ViewerState createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> {
  String _version = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();

    PdftronFlutter.openDocument("http://site-868571.mozfiles.com/files/868571/001_regulamin_studiow.pdf");
  }

  // Platform messages are asynchronous, so we initialize via an async method.
  Future<void> initPlatformState() async {
    String version;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      PdftronFlutter.initialize("pDww-i5EZrU7KB2UKnHSRllTIloP4njHnGKQ421kdiYFxiJskqP1239ZNpS4BWJW8xYjDOunNfySI2DyF5NSPjUYGhFMBQbaOBQfOWu-PJPsatqd6y7wXaJeLHJTV7uR0CTOdvFXcSckP0BDQbIyp_TKEQwqRfQhMm-kwcxZ1nMb5T24F8gwzWI8UpigN_8GJxBZg_AS_VyEBbDJ6_nk9KyLuoAw5oFsMcJO64zaIwSCGYjdvOsPpiokg309ZO3DKBJre3NIUCnXLOFyHh8i51uiCPE5iQhE96P-LP5DcTask8gIWjIrJf93e6WAZSBgCJpPpfaZlsDmPoNaO5ixuqsGHA1peSNjV-zDaIvdhqFfgYR9zu2v2JQc9XPLBd17O1lZ9XMeyN0hG8oA6yUtMLZWxe948BtdQUcQusUBLQ5DLXF0MQBCC0uFCpaF4IBU");
      version = await PdftronFlutter.version;
    } on PlatformException {
      version = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _version = version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PDFTron flutter app'),
        ),
        body: Center(
          child: Text('Running on: $_version\n'),
        ),
      ),
    );
  }
}