import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:imagebutton/imagebutton.dart';

class WidgetDialogTrue extends StatefulWidget {
  final String description;
  final Function onTap;

  const WidgetDialogTrue({Key key, this.description, this.onTap}) : super(key: key);

  @override
  _WidgetDialog createState() => _WidgetDialog();
}

class _WidgetDialog extends State<WidgetDialogTrue>
    with SingleTickerProviderStateMixin {
  Animation<double> _scaleAnimation;
  AnimationController _controller;
  Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this)..repeat(reverse: true);
    _scaleAnimation = Tween<double>(begin: 0.57, end: 0.70).animate(_controller);
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 40),
              child:  Column(
          children: [
            Stack(
              children: [
                Align(
                  heightFactor: 1.0,
                  child: Image(
                    image: AssetImage('assets/images/star1.png'),
                    width: 350,
                  ),
                ),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Align(
                    heightFactor: 1.0,
                    child: Image(
                      image: AssetImage('assets/images/star2.png'),
                      width: 350,
                    ),
                  ),
                ),
                Center(
                  child: Image(
                    image: AssetImage('assets/images/face_true.png'),
                    width: 240,
                  ),
                ),
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: Image(
                    image: AssetImage('assets/images/hand_true.png'),
                    width: 180,
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              overflow: Overflow.visible,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 224,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/show_result.png'),
                          fit: BoxFit.fill)),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.description ?? "null",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -20,
                  child: ImageButton(
                      height: 65,
                      width: 140,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[Text("")],
                      onTap: widget.onTap,
                      unpressedImage:
                      Image.asset("assets/images/btn_next.png"),
                      pressedImage:
                      Image.asset("assets/images/btn_next_hover.png")),)
              ],
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
}
