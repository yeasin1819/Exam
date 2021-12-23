import 'package:flutter/material.dart';

int main() {
  runApp(HomePage());

  return 0;
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sliderValue = 20;
  int incrementDecrement = 30;
  Color activeColor = Colors.green;
  Color inActiveColor = Colors.amber;
  Color box1Color = Colors.amber;
  Color box2Color = Colors.amber;

  void box1ColorUpdate() {
    
    setState(() {
      box1Color = activeColor;
    box2Color = inActiveColor;
    });
  }

  void box2ColorUpdate() {
   
    setState(() {
       box2Color = activeColor;
    box1Color = inActiveColor;
    });
  }

  Widget Box(title, color, method) {
    return Expanded(
        child: GestureDetector(
      onTap: method,
      child: Card(
        color: color,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 35,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Exam",
      home: Scaffold(
        backgroundColor: Color(0xFF0c1234),
        appBar: AppBar(
          title: Text("Exam App"),
          backgroundColor: Color(0xFF12153b),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Box("Box1", box1Color, box1ColorUpdate),
                Box("Box2", box2Color, box2ColorUpdate),
              ],
            ),
            Expanded(
              child: Card(
                color: Color(0xff141a3c),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sliderValue.round().toString(),
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Slider(
                      max: 200,
                      value: sliderValue,
                      onChanged: (value) {
                        sliderValue = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: Color(0xff13193b),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      incrementDecrement.toString(),
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          backgroundColor: Color(0xff212747),
                          child: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (incrementDecrement > 0) incrementDecrement--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        FloatingActionButton(
                          backgroundColor: Color(0xff212747),
                          child: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              incrementDecrement++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
