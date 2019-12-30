import 'package:demo7/jsz_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _info = "init";
  String _platformVersion = "vs";
  static const EventChannel _eventChannel = EventChannel('jsz_plugin_event');

  void _incrementCounter() {

    setState(() {
      _counter++;
    });
  }

  void _callOs() async{
    String platformVersion;
    try {
      platformVersion = await JszPlugin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
     setState(() {
      _platformVersion = platformVersion;
    });
    
  }

  void _callEvent() async{
    await JszPlugin.info;
  }

  @override
  void initState() {
    super.initState();
    _eventChannel.receiveBroadcastStream().listen(_onEnvent, onError: _onError);
  }

  void _onEnvent(Object obj){
    setState(() {
      _info = obj;
    });
  }

  void _onError(Object obj){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              '$_platformVersion',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              '$_info',
              style: TextStyle(
                fontSize: 12,
                color: Colors.red
              ),
            ),
            IconButton(icon: Icon(Icons.ac_unit),onPressed: _callOs,),
            IconButton(icon: Icon(Icons.access_time),onPressed: _callEvent,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
