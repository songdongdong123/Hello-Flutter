import 'dart:async';

import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return Center(
      // 使用StreamBuilder构建可以取出stream值的小部件
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context, snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'),
            onPressed: () {
              // _counterBloc.log();
              _counterBloc.counter.add(1);
            },
          );
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc; // 5.获取CounterBloc

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        // _counterBloc.log(); // 6.使用CounterBloc中的方法
        _counterBloc.counter.add(1);
      },
    );
  }
}

class CounterProvider extends InheritedWidget { // 3.创建CounterProvider
// 4.使用InheritedWidget传递数据

  final Widget child;
  final CounterBloc bloc;
  
  CounterProvider({
    this.child,
    this.bloc
  }) : super(child: child);

  static CounterProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProvider)as CounterProvider);
  }

  @override
  bool updateShouldNotify( CounterProvider oldWidget) {
    return true;
  }
}

class CounterBloc { // 2.创建CounterBloc
  // 使用stream输出数据
  int _count = 0;
  final _counterController = StreamController<int>();
  Stream<int> get count => _counterController.stream;

  // 使用sink输入数据
  final _counterActionController = StreamController<int>();
  StreamSink<int> get counter => _counterActionController.sink;

  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  void onData (int data) {
    print('$data');
    _count = data + _count;
    _counterController.add(_count);
  }

  void disponse () {
    _counterActionController.close();
    _counterController.close();
  }

  void log () {
    print('BLoC');
  }
}