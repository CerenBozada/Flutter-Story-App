import 'dart:convert';
import 'dart:math';
import 'dart:js' as js;
import 'package:alfred/Quiz.dart';
import 'package:alfred/main.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowPage extends StatefulWidget {
  String title, jsonstr;
  ShowPage(this.title, this.jsonstr);
  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  List<dynamic> items;
  @override
  void initState() {
    items = jsonDecode(widget.jsonstr);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int rowSize = 4;
    double width = MediaQuery.of(context).size.width;
    if (width > 1200) {
      rowSize = 6;
    } else if (width > 900) {
      rowSize = 5;
    } else if (width > 768) {
      rowSize = 4;
    } else {
      rowSize = 2;
    }
    print(MediaQuery.of(context).size.width);
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Hayvanlar'),
          trailing: GestureDetector(
              onTap: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage(widget.jsonstr)),
                );
              },
              child: Icon(Icons.apps)),
        ),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://wallpaperaccess.com/full/1422294.jpg"))),
          child: Center(
            child: Container(
              width: width * 0.80,
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: rowSize),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Whatever sort of things you want to build
                    // with your Post object at yourPosts[index]:
                    return GestureDetector(
                      onTap: () {
                        js.context
                            .callMethod('playAudio', [items[index]["sound"]]);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GridTile(
                              child: Image.network(items[index]["image"]),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
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
