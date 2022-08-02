import 'dart:convert';
import 'dart:math';
import 'dart:js' as js;
import 'package:alfred/data.dart';
import 'package:alfred/main.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fable {
  String name, image, sound;
  bool isPlaying = false;
  int id;
  Fable(this.name, this.image, this.sound);
  Fable.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.image = json["image"];
    this.sound = json["sound"] ?? null;
  }
}

class FablePage extends StatefulWidget {
  @override
  _FablePageState createState() => _FablePageState();
}

class _FablePageState extends State<FablePage> with TickerProviderStateMixin {
  List<Fable> fableList = [];
  Fable playing;
  @override
  void initState() {
    /*animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });*/
    List<dynamic> animals = jsonDecode(fables);
    for (var json in animals) {
      fableList.add(Fable.fromJson(json));
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Masallar'),
        ),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://wallpaperaccess.com/full/1422294.jpg"))),
            child: WillPopScope(
              onWillPop: () {
                js.context.callMethod('stopAudio');
                return Future.value(true);
              },
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: 300,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: fableList
                            .map((Fable fable) => GestureDetector(
                                  onTap: () {
                                    if (playing == fable) {
                                      js.context.callMethod(
                                          'stopAudio', [fable.sound]);
                                      playing = null;
                                    } else {
                                      js.context.callMethod(
                                          'playAudio', [fable.sound]);
                                      playing = fable;
                                    }
                                    setState(() {});
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      PageItem(
                                          image: fable.image, text: fable.name),
                                      Icon(
                                        playing != fable
                                            ? Icons.play_arrow
                                            : Icons.stop,
                                        color: Colors.black26,
                                        size: 70,
                                      ),
                                      Icon(
                                        playing != fable
                                            ? Icons.play_arrow
                                            : Icons.stop,
                                        color: Colors.white,
                                        size: 60,
                                      ),
                                    ],
                                  ),
                                ))
                            .toList()),
                  ),
                ),
              ),
            ),
          ),
        ));
    //return ListView(children: );
  }
}
/*Stack(
      children: <Widget>[
        //CENTER -- Blast
        Align(
          alignment: Alignment.center,
          child: ConfettiWidget(
            confettiController: _controllerCenter,
            blastDirectionality: BlastDirectionality
                .explosive, // don't specify a direction, blast randomly
            shouldLoop:
                true, // start again as soon as the animation is finished
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple
            ], // manually specify the colors to be used
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: FlatButton(
              onPressed: () {
                _controllerCenter.play();
              },
              child: _display('blast')),
        ),

        //CENTER RIGHT -- Emit left
        Align(
          alignment: Alignment.centerRight,
          child: ConfettiWidget(
            confettiController: _controllerCenterRight,
            blastDirection: pi, // radial value - LEFT
            particleDrag: 0.05, // apply drag to the confetti
            emissionFrequency: 0.05, // how often it should emit
            numberOfParticles: 20, // number of particles to emit
            gravity: 0.05, // gravity - or fall speed
            shouldLoop: false,
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink
            ], // manually specify the colors to be used
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: FlatButton(
              onPressed: () {
                _controllerCenterRight.play();
              },
              child: _display('pump left')),
        ),

        //CENTER LEFT - Emit right
        Align(
          alignment: Alignment.centerLeft,
          child: ConfettiWidget(
            confettiController: _controllerCenterLeft,
            blastDirection: 0, // radial value - RIGHT
            emissionFrequency: 0.6,
            minimumSize: const Size(10,
                10), // set the minimum potential size for the confetti (width, height)
            maximumSize: const Size(50,
                50), // set the maximum potential size for the confetti (width, height)
            numberOfParticles: 1,
            gravity: 0.1,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: FlatButton(
              onPressed: () {
                _controllerCenterLeft.play();
              },
              child: _display('singles')),
        ),

        //TOP CENTER - shoot down
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _controllerTopCenter,
            blastDirection: pi / 2,
            maxBlastForce: 5, // set a lower max blast force
            minBlastForce: 2, // set a lower min blast force
            emissionFrequency: 0.05,
            numberOfParticles: 50, // a lot of particles at once
            gravity: 1,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: FlatButton(
              onPressed: () {
                _controllerTopCenter.play();
              },
              child: _display('goliath')),
        ),
        //BOTTOM CENTER
        Align(
          alignment: Alignment.bottomCenter,
          child: ConfettiWidget(
            confettiController: _controllerBottomCenter,
            blastDirection: -pi / 2,
            emissionFrequency: 0.01,
            numberOfParticles: 20,
            maxBlastForce: 100,
            minBlastForce: 80,
            gravity: 0.3,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: FlatButton(
              onPressed: () {
                _controllerBottomCenter.play();
              },
              child: _display('hard and infrequent')),
        ),
      ],
    );
  }

  Text _display(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }*/
