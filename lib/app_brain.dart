import 'questions.dart';

class AppBrain {
   int _Qstnumber = 0;
  List<Question> _GrpQuest = [
    Question(
      qst: 'The number of planets in the solar system is 8 ?',
      img: 'images/image-1.jpg',
      ans: true,
    ),
    Question(
      qst: 'Cats are carnivores ?',
      img: 'images/image-2.jpg',
      ans: true,
    ),
    Question(
      qst: 'Is China located in Africa ?',
      img: 'images/image-3.jpg',
      ans: false,
    ),
    Question(
      qst: 'Is the earth flat ?',
      img: 'images/image-4.jpg',
      ans: false,
    ),
    Question(
      qst: 'Are vegetables important ?',
      img: 'images/image-5.jpg',
      ans: true,
    ),
    Question(
      qst: 'Can we live without the sun ?',
      img: 'images/image-6.jpg',
      ans: false,
    ),
    Question(
      qst: 'Do chickens lay eggs ?',
      img: 'images/image-7.jpg',
      ans: true,
    ),
    Question(
      qst: 'Is there a sea in Algeria ?',
      img: 'images/8.jpg',
      ans: true,
    ),
    Question(
      qst: 'Death Note is Best Anime ?',
      img: 'images/9.jpg',
      ans: true,
    ),
    Question(
      qst: 'Is there a gulf in Egypt ?',
      img: 'images/10.jpeg',
      ans: false,
    ),
    Question(
      qst: 'Do bees lay eggs ?',
      img: 'images/11.jpg',
      ans: false,
    ),
    Question(
      qst: 'The Gulf of Mexico is the largest gulf in the world ?',
      img: 'images/12.jpg',
      ans: true,
    ),
  ];

  void chcknextqst(){
    if (_Qstnumber <_GrpQuest.length-1){
      _Qstnumber++;
    }
  }
  

  String getqstext(){
    return _GrpQuest[_Qstnumber].Questext;
  }
   String getqsimg(){
    return _GrpQuest[_Qstnumber].ImgText;
  }

 bool getqscorrect(){
    return _GrpQuest[_Qstnumber].AnswerTxt;
  }

  bool questFinish(){
    if (_Qstnumber >= _GrpQuest.length-1){
      return true;
    }else {
      return false;
    }
  }

  void restart(){
    _Qstnumber = 0;
  }

}
