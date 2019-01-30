import "package:flutter/material.dart";

class CircleIconButton extends StatelessWidget {
  final double size;
  final Function onPressed;
  final IconData icon;

  final bool activeBill ;

  CircleIconButton({this.size = 20.0, this.icon = Icons.clear, this.onPressed, this.activeBill = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: this.onPressed,
        child: SizedBox(
            width: size,
            height: size,
            child: Stack(
              alignment: AlignmentDirectional.center,

              children: <Widget>[
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: activeBill? Colors.red[200] : Colors.grey[300]),
                ),
                Icon(
                  icon,
                  size: size * 0.6,
                )
              ],
            )));
  }
}