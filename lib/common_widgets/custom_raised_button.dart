import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton(
      {this.child,
      this.color,
      this.borderRadius: 6.0, //default value
      this.height: 50.0,
      this.onPressed})
      : assert(borderRadius != null);

  final Widget child;
  final Color color;
  final double borderRadius;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        child: child,
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        onPressed: onPressed,
      ),
    );
  }
}

/*
  Widget _buildFakeButtonContainer(Color color, [double height = 100.0]) {
    return Container(
      color: color,
      child: SizedBox(height: height),
    );
  }

  //SizedBox(height: 8.0),
  //_buildFakeButtonContainer(Colors.red),
  //SizedBox(height: 8.0),
  //_buildFakeButtonContainer(Colors.purple),
 */
