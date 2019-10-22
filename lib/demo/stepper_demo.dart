import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme( // 用于覆盖主题
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black,
              ),
              child: Stepper(
                currentStep: _currentStep, // 当前step
                onStepTapped: (int value) { // 点击整个step的行为
                  setState(() {
                    _currentStep = value;
                  });
                },
                onStepContinue: () { // 点击CONTINUE的行为
                  setState(() {
                    _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                  });
                },
                onStepCancel: () { // 点击CANCEL的行为
                  setState(() {
                    _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                  });
                },
                steps: [
                  Step(
                    title: Text('Login'),
                    subtitle: Text('Login first'),
                    content: Text('Magna exercitation duis non sint eu nostrud.'),
                    isActive: _currentStep == 0, // step的激活状态
                  ),
                  Step(
                    title: Text('Choose Plan'),
                    subtitle: Text('Choose you plan.'),
                    content: Text('Magna exercitation duis non sint eu nostrud.'),
                    isActive: _currentStep == 1,
                  ),
                  Step(
                    title: Text('Confirm payment'),
                    subtitle: Text('Confirm your payment method.'),
                    content: Text('Magna exercitation duis non sint eu nostrud.'),
                    isActive: _currentStep == 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}