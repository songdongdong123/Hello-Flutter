import 'package:flutter/material.dart';

// 无状态的小部件
// 一旦创建，无法更改状态
// class StateManagementDemo extends StatelessWidget {
//   // StatelessWidget的变量都必须使用final来修饰，表示不可更改
//   int count = 0;
//   @override
//   Widget build(BuildContext context) {
//     // Scaffold基本页面结构
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('StateManagementDemo'),
//         elevation: 0.0,
//       ),
//       body: Center(
//         child: Chip(
//           label: Text('$count'),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           // 在控制台上count的值是不断改变的，但是在视图上是不变得
//           count += 1;
//           print(count);
//         },
//       ),
//     );
//   }
// }

// 由父輩管理狀態
class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;
  void _increaseCount() {
    setState(() {
      // StatefulWidget小部件，改变状态必须使用setState
      _count += 1;
    });
    print(_count);
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold基本页面结构
    return CounterProvider(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0.0,
        ),
        body: CountWrapper(), // 传递count状态和回调函数_increaseCount
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _increaseCount,
        ),
      ),
    );
  }
}
class CountWrapper extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount = CounterProvider.of(context).increaseCount;
    return ActionChip(
      label: Text('$count'),
      onPressed: increaseCount,
    );
  }
}


// 这里其实就是创建了一个InheritedWidget
// 用它来作为一个顶层的状态管理容器，然后任意节点的子类使用【CounterProvider.of(context).属性】来访问父类的属性
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({this.count, this.increaseCount, this.child})
      : super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
