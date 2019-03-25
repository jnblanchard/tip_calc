# Tip

Creating a cross-platform app is easy!
```dart
  void main() => runApp(TipCalculator());
```

Declare some animation to make it look cool.
```dart
  @override void initState() {
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 250), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
  }

  dispose() {
    animationController.dispose();
    super.dispose();
  }
```

Create a text entry space for tip amounts.
```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
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
          ], ), ));
   }
```
Animate suggestions into view using the animation!
```dart
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
```
