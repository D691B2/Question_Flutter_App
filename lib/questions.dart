class Question {
  late String Questext;
  late String ImgText;
  late bool AnswerTxt;
  Question({ String? qst, String? img, bool? ans,}){
    Questext = qst!;
    ImgText = img!;
    AnswerTxt = ans!;
  }
}