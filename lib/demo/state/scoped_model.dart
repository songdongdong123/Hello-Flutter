import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

// scoped_model 传递数据
class ScopedModelDemo extends  StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // 2.使用ScopedModel包裹父容器
    return ScopedModel(
      model: CounterModel(),// 3.关联相关的model
      child: Scaffold(
        appBar: AppBar(
          title: Text('ScopedModelDemo'),
          elevation: 0.0,
        ),
        body: CountWrapper(),
        // 4.使用ScopedModelDescendant包裹需要使用model的属性的小部件
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context,_, model) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.increaseCount, // 5.获取model的属性
          ),
        )
        
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
    
    return ScopedModelDescendant<CounterModel>(
      builder: (context,_, model) => ActionChip(
        label: Text('${model.count}'),
        onPressed: model.increaseCount,
      ),
    );
  }
}

// 1.把状态和方法放在model里面
class CounterModel extends Model {
  int _count = 0;
  int get count => _count;
  void increaseCount () {
    _count += 1;
    notifyListeners();
  }
}

