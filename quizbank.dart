import 'questions.dart';
class Quizbank {
  int _questionNumber = 0;
  List<Questions> _questionBank=[
    Questions(q:'Venus is the hottest planet in the solar system.', a:true ),
    Questions(q:'Humans are born with more bones than they have as adults.', a:true ),
    Questions(q:'Sharks are mammals.', a:false),
    Questions(q:'Sloths take two weeks to digest food.', a:true),
    Questions(q:'Antibiotics are effective against viruses.', a:false),
    Questions(q:'Holland is a region in The Netherlands.', a:true),
    Questions(q:'Ostriches bury their heads in the sand when frightened.', a:false),
    Questions(q:'Penguins wear tuxedos because they are on a permanent formal dress code.', a:false),
    Questions(q:'Bats are blind.', a:false),
    Questions(q:'Halloween originated as an ancient Irish festival.', a:true),
    Questions(q:'A snail can sleep for up to three years.', a:true),
    Questions(q:'A goldfish has a memory span of only three seconds.', a:false),
    Questions(q:'Crocodiles cannot stick out their tongues.', a:true),
    Questions(q:'The tongue is the strongest muscle in the human body.', a:false),
    Questions(q:'Coffee is made from beans.', a:false),
  ];
  void nextQuestion(){
    if(_questionNumber<_questionBank.length-1){
      _questionNumber++;
    }
  }
  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }
  bool getQuestionAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }
  bool isFinished() {
    if (_questionNumber == _questionBank.length-1) {
      return true;
    }
    else {
      return false;
    }
  }
  void reset(){
    _questionNumber=0;
  }
}
