import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormDemo'),
        elevation: 0.0,
      ),
      body: Theme(
        // 使用Theme小部件，中的ThemeData属性可以覆盖主题颜色的设置，
        // 使用Theme小部件，中的Theme.of(context).copyWith()只会覆盖当前部件主题颜色的设置
        data: Theme.of(context).copyWith(
          primaryColor: Colors.pink,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();

  String username, password;

  bool autovalidate = false; //初始化时，关闭自动验证

  void submitRegisterForm () {
    // 初始化完成，在点击提交时，如表单数据校验通过，完成正常流程
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save(); //将registerFormKey表单对应的数据保存起来
      registerFormKey.currentState.validate(); // 验证表单
      debugPrint('username: $username');
      debugPrint('password: $password');

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('正在注册.......')
        )
      );
    } else {
      // 否则，打开自动验证
      setState(() {
       autovalidate = true; 
      });
    }
  }

  String validatorUsername (value) {
    if (value.isEmpty) {
      return 'Username is require';
    }

    return null;
  }

  String validatorPassword (value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey, // 这里绑定key可以使submitRegisterForm函数正确获取到对应的表单数据
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'UserName',
              helperText: '', // 帮助信息展示字段，可以使错误信息展示的时候更加自然
            ),
            onSaved: (value) {
              username = value; // 保存表单数据的时候，会把当前文本输入框输入的内容赋值给全局的username
            },
            validator: validatorUsername, //validator属性，用来验证当前文本输入框输入的内容

            // autovalidate: true, //开启自动验证表单字段，这样做一开始就会开启自动验证，不太友好
            autovalidate: autovalidate,
          ),
          TextFormField(
            obscureText: true, //隐藏具体设置内容，相当于input[type] = 'pwd'
            decoration: InputDecoration(
              labelText: 'Password',
              helperText: '',
            ),
            onSaved: (value) {
              password = value; // 保存表单数据的时候，会把当前文本输入框输入的内容赋值给全局的username
            },
            validator: validatorPassword, //验证密码
            autovalidate: autovalidate,
          ),
          SizedBox(height: 32.0,),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Register', style: TextStyle(color: Colors.white)),
              elevation: 1.0,
              onPressed: submitRegisterForm,
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  // 文本编辑控制器
  final textEditingController = TextEditingController();

  @override
  void dispose () {
    // 使用完成后销毁，否则占内存
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // 初始化state
    super.initState();
    // textEditingController.text = 'hi'; //可以给文本输入框设置默认值
    textEditingController.addListener( //可以给通过给文本编辑控制器添加监听事件，来监听文本输入框变化
      () {
        debugPrint('input: ${textEditingController.text}');  
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    //这里聚焦的时候有一个样式的改变，这里样式使用的主题颜色就是我们上面修改的对当前部件生效的主题色，而不是App的主题颜色
    return TextField(
      controller: textEditingController,//文本编辑控制器
      // onChanged: (value) { //监听文本输入框实时改变内容
      //   debugPrint('input: $value');
      // },
      onSubmitted: (value) {//监听输入完成确定时（键盘自带的确定键），文本输入框的最终值
        debugPrint('submit：$value');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),//设置文本输入框的小图标
        labelText: 'Title', //设置输入框的标题
        hintText: 'Enter the post title', //设置文本输入框的占位文字类似input的placeholder
        // border: InputBorder.none, //取消TextField默认的底部边框
        border: OutlineInputBorder(), // 给TextField添加一个四周边框
        filled: true, //开启背景色，默认为灰色
      ),
    ); 
  }
}

// 主题设置demo
class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Theme.of(context)指的是距离小部件最近的主题颜色
      color: Theme.of(context).accentColor,
    );
  }
}