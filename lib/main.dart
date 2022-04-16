import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

AppBrain _appBrain = AppBrain();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(333333),
          shadowColor: Colors.black,
          title: Text('Questions'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  int degree = 0;
  List<Padding> Answer = [];
  void checkanswer(bool checkuser) {
    setState(() {
      bool correctanswer = _appBrain.getqscorrect();
      if (correctanswer == checkuser) {
        degree++;
        Answer.add(Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.thumb_up,
            color: Colors.blue,
            size: 20,
          ),
        ));
      } else {
        Answer.add(Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.thumb_down,
            color: Colors.orange,
            size: 20,
          ),
        ));
      }
      if (_appBrain.questFinish() == true) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Finish",
          desc: "Your Degree is $degree",

          buttons: [

            DialogButton(
              child: Text(
                "Again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        _appBrain.restart();
        Answer = [];
        degree = 0;
      } else {
        _appBrain.chcknextqst();
      }
      




    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: Answer,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0), //add border radius
                child: Image.asset(
                  _appBrain.getqsimg(),
                  height: 200.0,
                  width: 300.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                _appBrain.getqstext(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: FlatButton(
              onPressed: () {
                checkanswer(true);
              },
              color: Colors.blue,
              child: Text(
                "Yes, it's True",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: FlatButton(
              onPressed: () {
                checkanswer(false);
              },
              color: Colors.orangeAccent,
              child: Text(
                "No, it's False",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
