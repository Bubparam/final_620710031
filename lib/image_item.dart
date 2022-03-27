class ImageItem{
  final String img;
  final String ans;
  final List choice;

  ImageItem({
    required this.img,
    required this.ans,
    required this.choice,
  });

  factory ImageItem.fromJson(Map<String, dynamic> json){
    return ImageItem(
      img: json['image'],
      ans: json['answer'],
      choice: json['choice_list'],
    );
  }

  ImageItem.fromJson2(Map<String, dynamic> json)
      : img = json['image'],
        ans = json['answer'],
        choice = json['choice_list'];

}


/*
[{image: https://cpsu-test-api.herokuapp.com/images/quiz/giraffe.png, answer: GIRAFFE, choice_list: [COYOTE, CHEETAH, HYENA, GIRAFFE]},
{image: https://cpsu-test-api.herokuapp.com/images/quiz/lion.png, answer: LION, choice_list: [HYENA, GIRAFFE, LION, COYOTE]},
{image: https://cpsu-test-api.herokuapp.com/images/quiz/coyote.png, answer: COYOTE, choice_list: [CHEETAH, HYENA, COYOTE, GIRAFFE]},
{image: https://cpsu-test-api.herokuapp.com/images/quiz/cheetah.png, answer: CHEETAH, choice_list: [CHEETAH, LION, HYENA, COYOTE]},
{image: https://cpsu-test-api.herokuapp.com/images/quiz/hyena.png, answer: HYENA, choice_list: [HYENA, CHEETAH, GIRAFFE, COYOTE]}]
 */