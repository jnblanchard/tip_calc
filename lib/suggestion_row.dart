import "package:flutter/material.dart";

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class SuggestionRow extends StatefulWidget {

  final bool isBottom;
  Animation<double> animation;

  SuggestionRow(this.animation, this.isBottom, { Key key }) : super(key: key);

  @override
  SuggestionRowState createState() => SuggestionRowState(this.animation, this.isBottom);

}

class SuggestionRowState extends State<SuggestionRow> with TickerProviderStateMixin  {
  final bool isBottom;
  TextEditingController textController;
  Animation<double> animation;

  SuggestionRowState(this.animation, this.isBottom);

  initState() {
    super.initState();
    animation.addListener(() {
      setState(() {});
    });
  }


  Text topLabel(double factor) {
    var calc = factor * 100;
    return Text("${calc.toInt().toString()}%",
        textAlign: TextAlign.center,
        maxLines: 1,
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          fontFamily: 'Mali',
        )
    );
  }

  Widget buttonWith(double factor) {
    return IntrinsicWidth(
        stepWidth: 3,
        stepHeight: 3,
        child: new Container(
            alignment: Alignment(0, 0),
            decoration: new BoxDecoration(
                color: Colors.white,
                border: new Border.all(
                    color: Colors.grey[300],
                    width: 2)),
            child: new MaterialButton(
              onPressed: () {
                //setText(factor);
              },
              color: Colors.green,
              highlightColor: Colors.lime[200],
              textColor: Colors.white,
              elevation: 8,
              highlightElevation: 16,
              height: 60,
              minWidth: 60,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(6.0)),
              child: topLabel(factor),
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Transform.scale(
          scale: animation.value,
          child: Transform.translate(offset: Offset(0, isBottom ? -85 : 85), child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 2),
              isBottom ? buttonWith(0.05) : buttonWith(0.25),
              Spacer(flex: 1),
              isBottom ? buttonWith(0.1) : buttonWith(0.3),
              Spacer(flex: 1),
              isBottom ? buttonWith(0.15) : buttonWith(0.35),
              Spacer(flex: 1),
              isBottom ? buttonWith(0.2) : buttonWith(0.4),
              Spacer(flex: 2)
            ],
          ))
        )
    );
  }
}
