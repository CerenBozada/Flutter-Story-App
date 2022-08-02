import 'dart:convert';
import 'dart:math';
import 'dart:js' as js;
import 'package:alfred/main.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Quiz {
  int id;
  String name, image, sound;
  Quiz.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.name = json["name"];
    this.image = json["image"];
    this.sound = json["sound"] ?? null;
  }
}

class QuizPage extends StatefulWidget {
  final String jsonStr;

  QuizPage(this.jsonStr);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with TickerProviderStateMixin {
  ConfettiController _controllerCenter;

  List<Quiz> animalQuiz = [];
  Quiz currentQuestion;
  List<Quiz> finalQuestions = [];
  int currentQuestionIndex = 0;
  bool isFinished = false;
  // Map<String, dynamic> animals;
  void nextQuestion() {
    if (currentQuestionIndex == animalQuiz.length - 1) {
      isFinished = true;
      _controllerCenter.play();
      setState(() {});
      return;
    }
    currentQuestionIndex++;
    currentQuestion = animalQuiz[currentQuestionIndex];
    var randomUniqueQuestions = List.from(animalQuiz);
    randomUniqueQuestions.shuffle();
    finalQuestions = [
      ...randomUniqueQuestions
          .where((question) => question.id != currentQuestion.id)
          .take(3),
      currentQuestion
    ];
    js.context.callMethod('playAudio', [currentQuestion.sound]);
    finalQuestions.shuffle();
    print(currentQuestion.name);
    setState(() {});
  }

  @override
  void initState() {
    /*animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });*/

    List<dynamic> animals = jsonDecode(widget.jsonStr);
    for (var json in animals) {
      animalQuiz.add(Quiz.fromJson(json));
    }
    animalQuiz.shuffle();
    currentQuestion = animalQuiz[
        currentQuestionIndex]; //state.questions.find(question => question.id == state.currentQuestionId);
    var randomUniqueQuestions = animalQuiz
        .where((question) => question.id != currentQuestion.id)
        .take(3);

    print(randomUniqueQuestions.length);
    finalQuestions = [...randomUniqueQuestions, currentQuestion]..shuffle();
    js.context.callMethod('playAudio', [currentQuestion.sound]);
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 1));
    print(currentQuestion.name);
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        int rowSize = 4;
    double width = MediaQuery.of(context).size.width;
    if (width > 1200) {
      rowSize = 4;
    } else if (width > 900) {
      rowSize = 4;
    } else if (width > 768) {
      rowSize = 4;
    } else {
      rowSize = 2;
    }
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Quiz'),
          trailing: GestureDetector(
              onTap: () {
                
              
              },
              child: Icon(Icons.apps)),
        ),
        child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://wallpaperaccess.com/full/1422294.jpg"))),
          child: Center(
            child: !isFinished
                ? Container(
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: rowSize),
                        itemCount: finalQuestions.length,
                        itemBuilder: (BuildContext context, int index) {
                          Quiz quiz = finalQuestions[index];
                          // Whatever sort of things you want to build
                          // with your Post object at yourPosts[index]:
                          return GestureDetector(
                            onTap: () {
                              if (currentQuestion == quiz) {
                                _controllerCenter.play();
                              
                                nextQuestion();
                              }
                            },
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),
                              child: Container(
                                key: ValueKey<int>(currentQuestion.id),
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: GridTile(
                                        child: Image.network(
                                            finalQuestions[index].image)),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                : Column(
                  children: [Image.network( "assets/images/minnion.gif"),
                    Text("TEBRİKLER!",style: TextStyle(fontSize:20,color:Colors.orange ),),
                  ],
                ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: ConfettiWidget(
            confettiController: _controllerCenter,
            blastDirectionality: BlastDirectionality
                .explosive, // don't specify a direction, blast randomly
            shouldLoop: isFinished
                ? true
                : false, // start again as soon as the animation is finished
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple
            ], // manually specify the colors to be used
          ),
        ),
      ],
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
