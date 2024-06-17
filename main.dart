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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  //

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final wtController = TextEditingController();
  final ftController = TextEditingController();
  final inController = TextEditingController();
  var result = '';

  var bgColor = Colors.grey[300];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: const Text('Find your BMI',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )
          ),
          centerTitle: true,
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BMI',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                      label: Text('Enter your weight (in kgs)'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 11),
                  TextField(
                    controller: ftController,
                    decoration: const InputDecoration(
                      label: Text('Enter your height (in ft)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 11),
                  TextField(
                    controller: inController,
                    decoration: const InputDecoration(
                      label: Text('Enter your height (in inch)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inController.text.toString();
          
                        if (wt != "" && ft != "" && inch != "") {
                          //Calculating BMI if none of the boxes is empty
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iInch = int.parse(inch);
          
                          var tInch = (ift * 12) + iInch;
                          var tCm = tInch * 2.54;
                          var tM = tCm/100;
          
                          var bmi = iwt/(tM*tM);
                          
                          var message =" ";

                          if(bmi>25){
                            message = "You are overweight!";
                            bgColor = Colors.redAccent[200];
                          }
                          else if (bmi<18){
                            message = "You are underweight";
                            bgColor = Colors.redAccent[200];
                          }
                          else{
                            message = "You are HEALTHY!!";
                            bgColor = Colors.green[400];
                          }

                          setState((){
                            result = "$message \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                          }
                          );
                        } else {
                          setState((){
                            result = "Sabai blank fill garnus ta!!";
                          });
                        }
                      },
                      child: const Text("Calculate")),
                      const SizedBox(height: 16),
                  Text(result, 
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
