import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

class WidgetDialogFail extends StatefulWidget {
  final Function onTap;
  final String description;

  const WidgetDialogFail({Key key, this.onTap, this.description}) : super(key: key);

  @override
  _WidgetDialogFailState createState() => _WidgetDialogFailState();
}

class _WidgetDialogFailState extends State<WidgetDialogFail>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.1, 0.2),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    ));
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
                    Center(
                      child: Image(
                        image: AssetImage('assets/images/face_wrong.png'),
                        width: 240,
                      ),
                    ),
                    SlideTransition(
                      position: _offsetAnimation,
                      child: Image(
                        image: AssetImage('assets/images/hand_wrong.png'),
                        width: 160,
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
                          Image.asset("assets/images/btn_play_again.png"),
                          pressedImage:
                          Image.asset("assets/images/btn_play_again_hover.png")),)
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
