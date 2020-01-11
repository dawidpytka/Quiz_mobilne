import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';

import './Settings.dart';
import './questionsData.dart';
import 'Stages.dart';

const String _documentPath = 'assets/PDFs/regulamin_studiow.pdf';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    QuestionsData.getInstance();
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  Future<String> prepareTestPdf() async {
    final ByteData bytes =
        await DefaultAssetBundle.of(context).load(_documentPath);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$_documentPath';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }

  Future<void> infoAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('\n Informacje \n', textAlign: TextAlign.center),
          content: Text(
              'QuizPOL ver. 1.0.0 \n\n'
              '© 2020 QuizPOL',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.5))),
          actions: <Widget>[
            Center(
              child: FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
          elevation: 24.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40.0))),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: new Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Settings.color,
              title: Text('QuizPOL', style: TextStyle(fontSize: 35)),
              leading: new Container()),
          body: new Stack(
            children: <Widget>[
//          Container(
//              child :new
//          ),
              new Row(
                children: <Widget>[
                  Image.asset(
                    "assets/images/logo-pl.png",
                    height: 120,
                    width: 230,
                  ),
                  new Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.25)),
                  IconButton(
                      icon: new Icon(Icons.settings,
                          color: Colors.black, size: 40),
                      onPressed: () {
                        startSettings();
                      }),
                ],
              ),
              Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.1)),
                  startGameButton('Rozpocznij grę'),
                  new Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.03)),
                  infoButton("Informacje o politechnice"),
                  new Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.1)),
                ],
              )),
              Column(
                children: <Widget>[
                  new Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.4)),
                  Row(
                    children: <Widget>[
                      new Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.8)),
                      IconButton(
                          icon: new Icon(Icons.info,
                              color: Settings.color, size: 40),
                          onPressed: () {
                            infoAlert(context);
                          }),
                    ],
                  )
                ],
              )
            ],
          )),
      onWillPop: () {
        return Future.value(false); // if true allow back else block it
      },
    );
  }

  MaterialButton infoButton(var text) {
    return new MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      color: Settings.color,
      onPressed: startMyApp,
      minWidth: MediaQuery.of(context).size.width * 0.5,
      height: 100.0,
      child: new Text(text, style: new TextStyle(color: Colors.black)),
    );
  }

  MaterialButton startGameButton(var text) {
    return new MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      color: Settings.color,
      onPressed: startQuiz1,
      minWidth: MediaQuery.of(context).size.width * 0.5,
      height: 100.0,
      child: new Text(text, style: new TextStyle(color: Colors.black)),
    );
  }

  void startQuiz1() {
    setState(() {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new Stage()));
    });
  }

  void startMyApp() {
    setState(() {
      prepareTestPdf().then((path) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FullPdfViewerScreen(path)),
        );
      });
    });
  }

  void startSettings() {
    setState(() {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new Settings()));
    });
  }
}

class FullPdfViewerScreen extends StatelessWidget {
  final String pdfPath;

  FullPdfViewerScreen(this.pdfPath);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text("Regulamin",style: TextStyle( fontSize: 35)),
          backgroundColor: Settings.color,
        ),
        path: pdfPath);
  }
}
