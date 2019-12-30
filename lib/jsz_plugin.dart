import 'package:flutter/services.dart';

class JszPlugin{
  static const MethodChannel _methodChannel =
      const MethodChannel('jsz_plugin_method');
  
  // static Future<Void> init() async{
  //   _eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  // }

  static Future<String> get platformVersion async {
    final String version = await _methodChannel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get info async {
    final String info = await _methodChannel.invokeMethod('getInfo');
    return info;
  }
}