// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'context_ext.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CovidMonitor(),
    );
  }
}

class CovidMonitor extends StatelessWidget {
  const CovidMonitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = context.media.size.height;
    final screenWidth = context.media.size.width;
    final appTitle = AppBar(
      title: const Text('Exercise Workshop Day 2'),
    );

    final statusBar = context.media.padding.top;

    final finalHeight =
        (screenHeight - appTitle.preferredSize.height - statusBar);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) {
          if (constrains.maxWidth > 480) {
            return LandscapeView(finalHeight, screenWidth);
          } else {
            return PortraitView(finalHeight, screenWidth);
          }
        },
      ),
    );
  }
}

class LandscapeView extends StatelessWidget {
  final screenHeight, screenWidth;
  const LandscapeView(double this.screenHeight, double this.screenWidth,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(
          children: [
            TopBanner(screenHeight, screenWidth * 0.5),
            Expanded(child: CardListContent(screenWidth, true))
          ],
        ));
  }
}

class PortraitView extends StatelessWidget {
  final screenHeight, screenWidth;
  const PortraitView(double this.screenHeight, double this.screenWidth,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(children: [
          TopBanner(screenHeight * 0.25, screenWidth),
          Expanded(child: CardListContent(screenWidth, false))
        ]));
  }
}

class TopBanner extends StatelessWidget {
  final screenHeight, screenWidth;
  const TopBanner(double this.screenHeight, double this.screenWidth, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: HexColor('#abc7ff'),
        height: screenHeight,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
              child: CovidContent('Perkembangan\nCOVID-19 Indonesia', 30,
                  TextAlign.center, FontWeight.bold, '#082151'),
            ),
            Center(
              child: CovidContent('Last Update: 2022-03-10 18:00:00', 15,
                  TextAlign.center, FontWeight.bold, '#082151'),
            )
          ],
        ),
      ),
    );
  }
}

class CardListContent extends StatelessWidget {
  final screenWidth, isLandscape;
  const CardListContent(double this.screenWidth, bool this.isLandscape,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: isLandscape
              ? const EdgeInsets.only(left: 32, right: 32, bottom: 32, top: 32)
              : const EdgeInsets.only(left: 32, right: 32, bottom: 32),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: HexColor('#ffdcc3'),
              ),
              height: 150,
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CovidContent('Kasus Aktif', 15, TextAlign.left,
                        FontWeight.bold, '#954b00'),
                    CovidContent('5,457,775', 30, TextAlign.left,
                        FontWeight.bold, '#954b00'),
                    CovidContent('49,447 ↑', 20, TextAlign.left,
                        FontWeight.normal, '#954b00')
                  ],
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: HexColor('#95f7b7'),
              ),
              height: 150,
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CovidContent('Sembuh', 15, TextAlign.left, FontWeight.bold,
                        '#026e3a'),
                    CovidContent('5,457,775', 30, TextAlign.left,
                        FontWeight.bold, '#026e3a'),
                    CovidContent('49,447 ↑', 20, TextAlign.left,
                        FontWeight.normal, '#026e3a')
                  ],
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: HexColor('#ffd9d3'),
              ),
              height: 150,
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CovidContent('Meninggal', 15, TextAlign.left,
                        FontWeight.bold, '#b70b05'),
                    CovidContent('5,457,775', 30, TextAlign.left,
                        FontWeight.bold, '#b70b05'),
                    CovidContent('49,447 ↑', 20, TextAlign.left,
                        FontWeight.normal, '#b70b05')
                  ],
                ),
              )),
        ),
      ],
    );
  }
}

class CovidContent extends StatelessWidget {
  final content, size, textAlign, fontWeight, textColor;
  const CovidContent(
      String this.content,
      int this.size,
      TextAlign this.textAlign,
      FontWeight this.fontWeight,
      String this.textColor,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
          fontSize: size * context.media.textScaleFactor,
          fontWeight: fontWeight,
          color: HexColor(textColor)),
      textAlign: textAlign,
    );
  }
}
