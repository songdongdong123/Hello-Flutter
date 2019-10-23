import 'dart:async';
import 'package:flutter/material.dart';
// 在Dart库中，有两种实现异步编程的方式（Future和Stream），
/** 
 * 为了将Stream的概念可视化与简单化，可以将它想成是管道（pipe）的两端，它只允许从一端插入数据并通过管道从另外一端流出数据。
  在Flutter中，
  我们将这样的管道称作Stream；
  为了控制Stream，我们通常可以使用StreamController来进行管理；
  为了向Stream中插入数据，StreamController提供了类型为StreamSink的属性sink作为入口；
  StreamController提供stream属性作为数据的出口。
 * 
*/
class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;
  String _data = '...';

  @override
  void dispose() {
    // TODO: implement dispose
    _streamDemo.close(); // 移除小部件的时候关闭Stream
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('创建Stream之前');
    // fromFuture相当于js中的promise
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamDemo = StreamController.broadcast();
    _sinkDemo = _streamDemo.sink;

    print('开始监听Stream');
    // 创建监听
    // onError, onDone为订阅，分表是发生错误是要做的事情和完成时要做的事情
    // _streamDemo.listen返回的是StreamSubscription（订阅）可以用来暂停，恢复，取消订阅或者监听
    _streamSubscription = _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);

    print('初始化完成');

  }

  void onDone () {
    print('Done!');
  }

  void onError (error) {
    print('Error: $error');
  }

  void onData (String data) {
    // 获取Stream上的数据（属于手动更新状态）
    // setState(() {
    //   _data = data; 
    // });
    print('$data');
  }

  void _pauseStream () {
    print('暂停监听');
    _streamSubscription.pause();
  }

  void _resumeStream () {
    print('恢复监听');
    _streamSubscription.resume();
  }

  void _cancelStream () {
    print('取消监听');
    _streamSubscription.cancel();
  }

  void _addDataToStream () async {
    print('给stream添加数据');
    String data = await fetchData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  Future<String> fetchData() async {
    // 模拟异步
    await Future.delayed(Duration(seconds: 5)); //延迟3秒
    // throw '模拟错误';
    return 'Hello ~';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(_data),
            // 这里使用StreamBuilder自动构建小部件，用来显示更新小部件
            StreamBuilder(
              stream: _streamDemo.stream, // 绑定stream
              initialData: '...', // 初始值
              builder: (context, snapshot) {
                return Text('${snapshot.data}'); // 通过snapshot拿到stream上的数据
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Add'), //暂停监听
                  onPressed: _addDataToStream, // 给stream添加数据
                ),
                FlatButton(
                  child: Text('Pause'), //暂停监听
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('Resume'), //恢复监听
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  // 取消监听后无法恢复
                  child: Text('Cancel'), //取消监听
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
