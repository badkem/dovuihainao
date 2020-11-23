import 'package:flutter/material.dart';
import 'package:lichamduong/src/presentation/base/base_viewmodel.dart';
import 'package:lichamduong/src/presentation/widgets/widget_dialog_fail.dart';
import 'package:lichamduong/src/presentation/widgets/widget_dialog_false.dart';
import 'package:lichamduong/src/presentation/widgets/widget_dialog_true.dart';
import 'package:lichamduong/src/resource/model/quiz.dart';
import 'package:lichamduong/src/resource/repo/quiz_repository.dart';
import 'package:lichamduong/src/resource/services/provider.dart';
import 'package:lichamduong/src/resource/services/sound.dart';
import 'package:rxdart/rxdart.dart';

class QuizViewModel extends BaseViewModel {
  final QuizRepository quizRepository;
  final soundService = locator<SoundService>();
  var _quizsSubject = BehaviorSubject<List<Quiz>>();
  var _quizQues = BehaviorSubject<Quiz>();
  var _lives = BehaviorSubject<int>();
  var _level = BehaviorSubject<int>();
  var _choices = BehaviorSubject<List<String>>();
  var _quiz = <Quiz>[];

  QuizViewModel({this.quizRepository});

  Future<void> init() async {
    _quiz = await quizRepository.fetchQuizList();
    _quiz.shuffle();
    _quizsSubject.value = _quiz;
    setQuiz(_quiz);
    setLevel(1);
    setLives(5);
    setQuestion(_quiz[getLevel]);
    setChoices(getQuestion);
  }

  List<Quiz> get getQuiz => _quizsSubject.value;

  void setQuiz(List<Quiz> quiz) {
    _quizsSubject.add(quiz);
  }

  List<String> get getChoices => _choices.value;

  void setChoices(Quiz quiz) {
    _choices.add([quiz.a, quiz.b, quiz.c, quiz.d]..shuffle());
  }

  Quiz get getQuestion => _quizQues.value;

  void setQuestion(Quiz quiz) => _quizQues.add(quiz);

  int get getLevel => _level.value;

  void setLevel(int i) => _level.add(i);

  int get getLives => _lives.value;

  void setLives(int i) => _lives.add(i);

  void answer(String answer) {
    if (getQuestion.dapAn == answer) {
      _level.value++;
      _showDialogTrue(context);
    } else {
      _lives.value--;
      if(getLives == 0) {
        soundService.playSound('fail');
        _showDialogLose(context);
      } else {
       _showDialogFalse(context);
      }
    }
  }

  void _showDialogTrue(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WidgetDialogTrue(
          onTap: (){
            nextQuestion();
            },
          description: getQuestion.giaiThich,
        );
      },
    );
  }

  void _showDialogFalse(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WidgetDialogFalse(
          onTap: (){
            nextQuestion();
          },
          description: getQuestion.giaiThich,
        );
      },
    );
  }

  void _showDialogLose(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
       return WidgetDialogFail(
         description: "Bạn đã hết mạng!"
                      "Trở lại cấp độ 1",
         onTap: () {
           setLevel(1);
           setLives(5);
           notifyListeners();
           nextQuestion();
         },
       );
      },
    );
  }

  void _showDialogWin(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Giỏi"),
          content: Text("Trở lại level 1! Ok?"),
          actions: <Widget>[
            FlatButton(
              child: Text("Chơi lại"),
              onPressed: () {
                setLives(5);
                setLevel(1);
                notifyListeners();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void nextQuestion() {
    _quiz.shuffle();
    setQuestion(_quiz[getLevel]);
    setChoices(_quiz[getLevel]);
    notifyListeners();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _quizQues.close();
    _level.close();
    _lives.close();
    _quizsSubject.close();
    _choices.close();
    super.dispose();
  }
}
