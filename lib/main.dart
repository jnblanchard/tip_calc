import 'package:flutter/material.dart';
import 'suggestion_row.dart';
import 'enter_bill.dart';

void main() => runApp(TipCalculator());

class TipCalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Tip App",
        home: TipScreen(),
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          cursorColor: Colors.black12,
          fontFamily: 'Mali',
          buttonTheme: new ButtonThemeData(minWidth: 80, height: 50),
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 25.0, fontStyle: FontStyle.normal),
            body1: TextStyle(fontSize: 22.0),
          ),
        ));
  }
}

class TipScreen extends StatefulWidget {
  TipScreen({Key key}) : super(key: key);


  @override
  TipScreenState createState() => TipScreenState();
}

class TipScreenState extends State<TipScreen> with TickerProviderStateMixin {

  Animation<double> animation;
  AnimationController animationController;
  AnimationStatus animationStatus = AnimationStatus.dismissed;
  TextEditingController textController = TextEditingController();

  var bill = 0.0;


  initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: 250), vsync: this);

    animation =
        Tween(begin: 0.0, end: 1.0).animate(animationController);
  }

  dispose() {
    super.dispose();
    animationController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text( "Tip Calculator"),
        ),
        body: Align( alignment: Alignment.lerp(Alignment.topCenter, null, 0.5), child: Stack(
          fit: StackFit.loose,
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            SuggestionRow(animation, false),
            SuggestionRow(animation, true),
            BillCenter(animation, bill, animationStatus, animationController, textController)
          ], ), )
    );
  }
}
