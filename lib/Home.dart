import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './questionsData.dart';
import './Settings.dart';
import 'Stages.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';

const String _documentPath = 'assets/PDFs/regulamin_studiow.pdf';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    QuestionsData.getInstance();
    return new HomeState();
  }

}

class HomeState extends State<Home>{

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: new Scaffold(
          appBar: AppBar(centerTitle: true,
            title: Text('QuizPOL',style: TextStyle( fontSize: 35)),
          leading: new Container()),
      body: new Stack(
        children: <Widget>[
          Container(
              child :new Image.asset("assets/images/logo-pl.png",
                height: 120,
                width: 230,
              )
          ),
          Center(
            child: Container(
              child:new Column(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.025)
                  ),
                  new IconButton(icon: new Icon(Icons.settings, color: Colors.black, size: 40),
                      padding: EdgeInsets.only(left :MediaQuery.of(context).size.width*0.75 ),
                      onPressed: () {
                        startSettings();
                      }),
                  new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.1)
                  ),
                  startGameButton('Rozpocznij grę'),

                  new Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.03)),
                  infoButton("Informacje o politechnice"),
                ],
              )
            )
          )
        ],
      )
    ),
      onWillPop: () {
        return Future.value(false); // if true allow back else block it
      },
    );

  }


  MaterialButton infoButton(var text)
  {
    return new MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      color: Colors.lightBlueAccent,
      onPressed:startMyApp,
      minWidth: MediaQuery.of(context).size.width * 0.5,
      height: 100.0,
      child: new Text(text,
          style: new TextStyle(
              color: Colors.black
          )
      ),
    );
  }

  MaterialButton startGameButton(var text)
  {
    return new MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
      color: Colors.lightBlueAccent,
      onPressed: startQuiz1,
      minWidth: MediaQuery.of(context).size.width * 0.5,
      height: 100.0,
      child: new Text(text,
          style: new TextStyle(
              color: Colors.black
          )
      ),
    );
  }
  void startQuiz1(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Stage()));
    });
  }

  void startMyApp(){


    setState(() {
      prepareTestPdf().then((path) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FullPdfViewerScreen(path)),
        );
      });
    });
  }

  void startSettings(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Settings()));
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
          title: Text("Document"),
        ),
        path: pdfPath);
  }
}