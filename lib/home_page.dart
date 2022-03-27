import 'package:final_620710031/api_result.dart';
import 'package:final_620710031/image_data.dart';
import 'package:final_620710031/image_item.dart';
import 'package:final_620710031/result_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _animalIndex = 0;
  var count = 0;
  var round = 1;

  @override
  void initState() {
    super.initState();
    _loadAnimal();
  }

  @override
  Widget build(BuildContext context) {
    var imageItem = ImageData.list[_animalIndex];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.yellow.shade50,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.yellowAccent.shade100,
              offset: Offset(5.0, 5.0),
              spreadRadius: 2.0,
              blurRadius: 5.0,
            )
          ],
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('สัตว์ตัวนี้มีชื่อว่าอะไร ?',
                        style: TextStyle(fontSize: 30.0)),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.network(
                        imageItem.img,
                        width: 450,
                        height: 450,
                      ),
                    ),
                    Row(
                      children: [
                        for (var i = 0; i < imageItem.choice.length; i++)
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextButton(
                                child: Text(imageItem.choice[i]),
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.pink),
                                onPressed: () {
                                  if (imageItem.choice[i] == imageItem.ans &&
                                      round == ImageData.list.length) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ResultPage(index: count)),
                                    );
                                  } else if (imageItem.choice[i] ==
                                      imageItem.ans) {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('ถูกต้องครับ'),
                                            content:
                                                Text('ทำข้อต่อไปได้เลยครับ'),
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('ตกลง'),
                                              )
                                            ],
                                          );
                                        });
                                    setState(() {
                                      _animalIndex++;
                                      round++;
                                    });
                                  } else if (imageItem.choice[i] !=
                                      imageItem.ans) {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('ผิดครับ'),
                                            content: Text('ลองใหม่ดูครับ'),
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('ตกลง'),
                                              )
                                            ],
                                          );
                                        });
                                    setState(() {
                                      count++;
                                      print(count);
                                    });
                                  }
                                }),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _loadAnimal() async {
    final url = Uri.parse('https://cpsu-test-api.herokuapp.com/quizzes');
    var result = await http.get(url, headers: {'id': '620710031'});

    var json = jsonDecode(result.body);
    var apiResult = ApiResult.fromJson(json);
    /*List<dynamic> data= json['data'];
    print(data);*/

    setState(() {
      ImageData.list = apiResult.data
          .map<ImageItem>((item) => ImageItem.fromJson(item))
          .toList();
    });
  }
}
