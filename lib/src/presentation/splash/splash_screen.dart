
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:launch_review/launch_review.dart';
import 'package:lichamduong/src/presentation/moreapp/more_app.dart';
import 'package:lichamduong/src/presentation/quizpage/quiz_screen.dart';
import 'package:lichamduong/src/presentation/quizpage/quiz_viewmodel.dart';
import 'package:lichamduong/src/resource/repo/quiz_repository.dart';
import 'package:lichamduong/src/resource/services/provider.dart';
import 'package:lichamduong/src/resource/services/sound.dart';

import '../presentation.dart';

class SplashScreen extends StatefulWidget {
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final soundService = locator<SoundService>();
  bool volume = true;
  @override
  void initState() {
    soundService.playSound('music_bg');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: soundService.enableSound$,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          final bool isSoundEnabled = snapshot.data;
          return SafeArea(child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash_bg.png'),
                    fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          "assets/images/splash_head.png",
                          height: 450,
                        ),
                      ),
                      Align(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: ImageButton(
                                  height: 50,
                                  width: 50,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[Text("")],
                                  unpressedImage:
                                  Image.asset("assets/images/btn_sp_share.png"),
                                  pressedImage:
                                  Image.asset("assets/images/btn_sp_share_hover.png")),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: ImageButton(
                                  height: 50,
                                  width: 50,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[Text("")],
                                  onTap: () {
                                    soundService.playSound('back');
                                  },
                                  unpressedImage:
                                  Image.asset("assets/images/btn_ratethisapp.png"),
                                  pressedImage:
                                  Image.asset("assets/images/btn_ratethisapp_hover.png")),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: ImageButton(
                                  height: 50,
                                  width: 50,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[Text("")],

                                  unpressedImage:
                                  Image.asset("assets/images/btn_sound_on.png"),
                                  pressedImage:
                                  Image.asset("assets/images/btn_sound_off.png")),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: BaseWidget<QuizViewModel>(
                      viewModel: QuizViewModel(
                        quizRepository: QuizRepository(),
                      ),
                      onViewModelReady: (viewModel) async {
                        viewModel.setLoading(true);
                        await viewModel.init();
                        viewModel.setLoading(false);
                      },
                      builder: (context, viewModel, child) {
                        return Container(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "Cấp độ " + viewModel.getLevel.toString(),
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ImageButton(
                                      height: 70,
                                      width: 200,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[Text("")],
                                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen()));},
                                      unpressedImage:
                                      Image.asset("assets/images/btn_play.png"),
                                      pressedImage:
                                      Image.asset("assets/images/btn_play_hover.png")),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ImageButton(
                                      height: 70,
                                      width: 200,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[Text("")],
                                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => MoreAppScreen()));},
                                      unpressedImage:
                                      Image.asset("assets/images/btn_moreapp.png"),
                                      pressedImage:
                                      Image.asset("assets/images/btn_moreapp_hover.png")),
                                ),
                              ],
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ));
        });
  }

}
