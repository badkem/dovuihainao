import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:lichamduong/src/presentation/base/base.dart';
import 'package:lichamduong/src/presentation/quizpage/quiz_viewmodel.dart';
import 'package:lichamduong/src/presentation/widgets/widget_answer.dart';
import 'package:lichamduong/src/resource/model/quiz.dart';
import 'package:lichamduong/src/resource/repo/quiz_repository.dart';
import 'package:lichamduong/src/resource/services/provider.dart';
import 'package:lichamduong/src/resource/services/sound.dart';


class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: null,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/quiz_bg.png'),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: [
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
                    if (viewModel.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      print(viewModel.getChoices);
                      return WidgetQuizList(
                        quiz: viewModel.getQuestion,
                        choices: viewModel.getChoices,
                        lives: viewModel.getLives,
                        level: viewModel.getLevel,
                      );
                    }
                  },
                ),
              )
            ],
          )),
    ));
  }
}

class WidgetQuizList extends StatefulWidget {
  final Quiz quiz;
  final int lives;
  final int level;
  final List<String> choices;

  const WidgetQuizList({Key key,  this.lives, this.level, this.quiz, this.choices})
      : super(key: key);

  @override
  _WidgetQuizListState createState() => _WidgetQuizListState();
}

class _WidgetQuizListState extends State<WidgetQuizList> {
  final soundService = locator<SoundService>();
  @override
  void initState() {
    soundService.playSound('play');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/quiz_head.png",
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(left: 40.0, top: 12.0),
                  child: Text(widget.lives.toString(),
                    style: TextStyle(
                      fontSize: 33,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: ImageButton(
                    height: 50,
                    width: 50,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[Text("")],
                    onTap: () {
                      Navigator.pop(context);
                      soundService.playSound('back');
                    },
                    unpressedImage: Image.asset("assets/images/btn_back.png"),
                    pressedImage:
                        Image.asset("assets/images/btn_back_hover.png")),
              ),
              Align(
                alignment: Alignment.topRight,
                child: ImageButton(
                    height: 50,
                    width: 50,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[Text("")],
                    unpressedImage:
                        Image.asset("assets/images/btn_gameplay_share.png"),
                    pressedImage: Image.asset(
                        "assets/images/btn_gameplay_share_hover.png")),
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/quiz_question.png')),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                  "Cấp độ " + widget.level.toString(),
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    )),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    width: 340,
                    height: 200,
                    child: Text(
                      widget.quiz.cauHoi,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: <Widget>[
                WidgetButtonAnswer(type: QuestionType.QuestionA, question: widget.choices[0]),
                WidgetButtonAnswer(type: QuestionType.QuestionB, question: widget.choices[1]),
                WidgetButtonAnswer(type: QuestionType.QuestionC, question: widget.choices[2]),
                WidgetButtonAnswer(type: QuestionType.QuestionD, question: widget.choices[3]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
