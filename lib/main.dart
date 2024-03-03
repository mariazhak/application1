import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Student list'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var stud1 = Student('Mariia', 'Zhak');
  var stud2 = Student('Misha', 'Mishyn');

  //function that is used to set age and return as a string
  String _setterAge(int age, Student stud) {
    stud.setAge(age);
    return stud.outputAge();
  }

  //i wrote this functions here in order to give them ability to change states
  void _markAdder(Student stud) {
    setState(() {
      stud.setMark(stud.getMark()+1);
    });
  }
  void _markSubstractor(Student stud) {
    setState(() {
      stud.setMark(stud.getMark()-1);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 400.0,
              height: 200.0,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                  color: Color(0xFFFFCC80),
                  border: Border(
                  top: BorderSide(),
                  left: BorderSide(),
                  right: BorderSide(),
                  bottom: BorderSide(),
                  ),
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(stud1.studData()),
                  Text(_setterAge(17, stud1)),
                  const Text('Mark:'),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _markAdder(stud1);
                          },
                          child: const Text('+'),
                        ),
                      ),
                      Expanded(
                        child: Text(stud1.getMarkStr(), textAlign: TextAlign.center),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _markSubstractor(stud1);
                          },
                          child: const Text('-'),
                        ),
                        ),
                      ],
                    ),
                  ],
                  ),
                  ),
            Container(
              width: 400.0,
              height: 200.0,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Color(0xFFFFCC80),
                border: Border(
                  top: BorderSide(),
                  left: BorderSide(),
                  right: BorderSide(),
                  bottom: BorderSide(),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(stud2.studData()),
                  Text(_setterAge(21, stud2)),
                  const Text('Mark:'),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _markAdder(stud2);
                          },
                          child: const Text('+'),
                        ),
                      ),
                      Expanded(
                        child: Text(stud2.getMarkStr(), textAlign: TextAlign.center),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _markSubstractor(stud2);
                          },
                          child: const Text('-'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

                ],


      ),
    ),
    );
  }
}

class Student{
  String name ;
  String surname;
  int _age = 0;
  int _mark = 0;

  Student(this.name, this.surname); //constructor

  int getAge() => _age; //getter for age
  void setAge(int age) => _age = age; //setter for age

  int getMark() => _mark;//getter for mark
  String getMarkStr() => '$_mark';
  void setMark(int mark) => _mark = mark; //setter for mark

  String studData() => '$name $surname'; //returns name and surname as one string
  String outputAge() => 'Age: $_age'; //returns age as string in desired format

}
