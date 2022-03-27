import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final int index;
  const ResultPage({Key? key, required this.index}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late int _count = widget.index;

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('จบเกม', style: TextStyle(fontSize: 100.0)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('ทายผิดทั้งหมด $_count ครั้ง',
                      style: TextStyle(fontSize: 30.0)),
                ),
                TextButton(
                    child: Text('เริ่มเกมใหม่'),
                    style: TextButton.styleFrom(
                        primary: Colors.white, backgroundColor: Colors.pink),
                    onPressed: () {})
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
