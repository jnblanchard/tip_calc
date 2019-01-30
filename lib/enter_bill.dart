import "package:flutter/material.dart";
import "circle_icon.dart";


class BillCenter extends StatefulWidget {
  Animation<double> animation;
  double bill;
  AnimationStatus animationStatus = AnimationStatus.forward;
  AnimationController controller;
  TextEditingController textController;

  BillCenter(this.animation, this.bill, this.animationStatus, this.controller, this.textController { Key key }) : super(key: key);

  @override
  BillCenterState createState() => BillCenterState(this.animation, this.bill, this.animationStatus, this.controller, this.textController);
}

class BillCenterState extends State<BillCenter> with TickerProviderStateMixin {
  double bill;
  AnimationStatus animationStatus;
  AnimationController controller;
  TextEditingController textEditingController;
  Animation<double> animation;
  BillCenterState(this.animation, this.bill, this.animationStatus, this.controller, this.textEditingController);


  initState() {
    super.initState();
    controller.addStatusListener((status) {
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
                                  controller.reverse(from: 1.0);
                                  break;
                                case AnimationStatus.forward:
                                  controller.reverse(from: animation.value);
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
                          billValue = 0;
                        }
                        switch (animationStatus) {
                          case AnimationStatus.completed:
                            controller.reverse(from: 1.0);
                            break;
                          case AnimationStatus.reverse:
                            break;
                          case AnimationStatus.dismissed:
                            break;
                          case AnimationStatus.forward:
                            controller.reverse(from: animation.value);
                            break;
                        }
                      } else {
                        switch (animationStatus) {
                          case AnimationStatus.completed:
                            break;
                          case AnimationStatus.reverse:
                            controller.forward(from: animation.value);
                            break;
                          case AnimationStatus.dismissed:
                            controller.forward(from: 0.0);
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