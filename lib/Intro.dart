import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'Home.dart';
import 'Routes.dart';

class Intro extends StatelessWidget{
  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titlePadding: EdgeInsets.all(20.0),
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return new WillPopScope(
        onWillPop: () async => false,
        child:IntroductionScreen(
      pages: [
        PageViewModel(
          title: "",
          image: _buildImage('images/mail.jpg'),
          body:
          "Nareszcie nadszedł ten moment! Otrzymałeś wyczekiwany list z wynikami rekrutacji Politechniki Łódzkiej.",
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          image: _buildImage('images/envelope.jpg'),
          body:
          "Otwierając kopertę nie masz cienia wątpliwości, że wynik rekrutacji jest pozytywny. W końcu tak wiele pracy zostało włożone w to by zdobyć jak najwięcej punktów. Tym większe twoje ździwienie czytając pierwsze słowa listu ...",
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          image: _buildImage('images/desk.jpg'),
          body:"\"Co, zdawało ci się że tak po prostu przyjmiemy cię do grona studentów? Nic bardziej mylnego!\n Zawiedzeni znajomością przez studentów  własnych praw i obowiązków wprowadziliśmy egzamin z regulaminu uczelni który musi przejść każdy kandydat.\"",
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "",
          image: _buildImage('images/desk.jpg'),
          body:
          "\"Kandydaci zostali losowo podzieleni na trzosobowe grupy. Tylko jedna osoba o najwyższym wyniku egzaminu z każdej grupy zostanie przyjęta do grona studentów. Mamy nadzieję, że stanowi to wystarczającą motywację do uważnego przeczytania regulaminu.\"",
          decoration: pageDecoration,
        ),

        PageViewModel(
          title: "O grze",
          bodyWidget: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0)
            ),
            Text( "• Quiz podzielony jest na 10 etapów.\n• Zaliczenie etapu wymaga poprawnej odpowiedzi na każde z pytań.\n• Spróbuj zaliczyć każdy etap jak najmniejszą ilością podejść, ich suma zadecyduje o końcowym wyniku.\n• Pomiędzy podejściami do etapu możesz zajrzeć do regulaminu w menu głównym. \n• Powodzenia!",
              textAlign:TextAlign.left ,
              style: TextStyle(
                fontSize: 19.0,
              ),
    )
    ],
    ),
          decoration: pageDecoration,
        ),
      ],
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      onDone: () => Navigator.push(context, FadeRoute(page: Home())),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Pomiń'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Start', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    ),
    );
  }
}

