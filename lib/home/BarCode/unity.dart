import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class Unity extends StatefulWidget {
  const Unity({Key? key}) : super(key: key);

  @override
  State<Unity> createState() => _UnityState();
}

class _UnityState extends State<Unity> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  UnityWidgetController? _unityWidgetController;
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Unity Flutter Demo'),
        ),
        body: Card(
          margin: const EdgeInsets.all(8),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: <Widget>[
              UnityWidget(
                onUnityCreated: _onUnityCreated,
                onUnityMessage: _onUnityMessage,
                onUnitySceneLoaded: _onUnitySceneLoaded,
                fullscreen: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onUnityMessage(message) {
    print('Received message from Unity: ${message.toString()}');
  }

  void _onUnityCreated(UnityWidgetController controller) {
    _unityWidgetController = controller;
  }

  void _onUnitySceneLoaded(SceneLoaded? sceneInfo) {
    if (sceneInfo != null) {
      print(
          'Scene loaded from Unity: ${sceneInfo.name}, Build index: ${sceneInfo.buildIndex}');
    }
  }
}
