import "package:flutter/material.dart";
import "circle_icon.dart";
import "bottom_information.dart";


class BillCenter extends StatefulWidget {
  Animation<double> animation;
  double bill;
  AnimationStatus animationStatus = AnimationStatus.forward;
  AnimationController animationController;
  TextEditingController textController;

  BillCenter(this.animation, this.bill, this.animationStatus, this.animationController, this.textController, { Key key }) : super(key: key);

  @override
  BillCenterState createState() => BillCenterState(this.animation, this.bill, this.animationStatus, this.animationController, this.textController);
}

class BillCenterState extends State<BillCenter> with TickerProviderStateMixin {
  double bill;
  AnimationStatus animationStatus;
  AnimationController animationController;
  TextEditingController textEditingController;
  Animation<double> animation;
  BillCenterState(this.animation, this.bill, this.animationStatus, this.animationController, this.textEditingController);


  initState() {
    super.initState();
    animationController.addStatusListener((status) {
      animationStatus = status;
    });
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
            height: 95,
            width: 285,
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment(0, 0),
            decoration: BoxDecoration(color: Colors.white, border: bill != null && bill > 0
                ? Border.all(color: Colors.green, width: 3)
                : Border.all(color: Colors.red[300], width: 3)),
            child: new IntrinsicWidth(
                stepHeight: 5,
                stepWidth: 2,
                child: new TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Tap to enter bill',
                        helperText: 'Bill Amount',
                        hintStyle: TextStyle(fontSize: 22.0),
                        helperStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                            fontFamily: 'Mali'),
                        prefixIcon: Icon(Icons.attach_money, color: Colors.green),
                        suffixIcon: CircleIconButton(
                            activeBill: bill != null && bill > 0,
                            onPressed: () {
                              textEditingController.clear();
                              setState(() { bill = 0; });
                              switch (animationStatus) {
                                case AnimationStatus.completed:
                                  animationController.reverse(from: 1.0);
                                  break;
                                case AnimationStatus.forward:
                                  animationController.reverse(from: animation.value);
                                  break;
                                default:
                                  break;
                              }
                            })
                    ),
                    style: new TextStyle(
                      fontSize: 22.0, // height: 2.0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.numberWithOptions(
                        signed: false, decimal: true),
                    autofocus: true,
                    autocorrect: false,
                    onChanged: (value) {
                      var billValue = double.tryParse(value);
                      if (billValue == null) {
                        if (value.isNotEmpty) {
                          textEditingController.clear();
                          Scaffold.of(context).hideCurrentSnackBar();
                          billValue = 0;
                        }
                        switch (animationStatus) {
                          case AnimationStatus.completed:
                            animationController.reverse(from: 1.0);
                            Scaffold.of(context).hideCurrentSnackBar();
                            break;
                          case AnimationStatus.reverse:
                            break;
                          case AnimationStatus.dismissed:
                            break;
                          case AnimationStatus.forward:
                            animationController.reverse(from: animation.value);
                            Scaffold.of(context).hideCurrentSnackBar();
                            break;
                        }
                      } else {
                        switch (animationStatus) {
                          case AnimationStatus.completed:
                            break;
                          case AnimationStatus.reverse:
                            animationController.forward(from: animation.value);
                            Scaffold.of(context).showSnackBar(snackBar());
                            break;
                          case AnimationStatus.dismissed:
                            animationController.forward(from: 0.0);
                            Scaffold.of(context).showSnackBar(snackBar());
                            break;
                          case AnimationStatus.forward:
                            break;
                        }
                      }
                      setState(() { bill = billValue; });
                    })
            )
        )
    );
  }
}