import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

typedef void IosListViewWidgetCreatedCallback(IosListViewController controller);

class IosListView extends StatefulWidget {

  const IosListView({
    Key key,
    this.hexColor,
    this.onIosListViewWidgetCreated,
    this.items,
    this.menuId,
    this.menuName,
    this.menuImageUrl,
  }) : super(key: key);

  final IosListViewWidgetCreatedCallback onIosListViewWidgetCreated;
  final String hexColor;
  final List<String> items;
  final List<String> menuId;
  final List<String> menuName;
  final List<String> menuImageUrl;

  @override
  State<StatefulWidget> createState() => _IosListViewState();
}

class _IosListViewState extends State<IosListView> {

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: "plugins/ios_list_view",
        creationParams: <String, dynamic>{
          "hexColor": widget.hexColor,
          "hidesWhenStopped": true,
          "items": widget.items,
          "menu_id": widget.menuId, // string
          "menu_name": widget.menuName, // string
          "menu_image_url": widget.menuImageUrl,
        },
        onPlatformViewCreated: _onPlatformViewCreated,
        creationParamsCodec: new StandardMessageCodec(),
      );
    }
    return Text(
        '$defaultTargetPlatform is not yet supported by the activity_indicator plugin');
  }

  void _onPlatformViewCreated(int id) {
    if (widget.onIosListViewWidgetCreated == null) {
      return;
    }
    widget.onIosListViewWidgetCreated(new IosListViewController._(id));
  }
}

class IosListViewController {

  IosListViewController._(int id)
      : _channel = MethodChannel('plugins/ios_list_view_$id');

  final MethodChannel _channel;

  Future<void> start() async {
    return _channel.invokeMethod('start');
  }

  Future<void> stop() async {
    return _channel.invokeMethod('stop');
  }
}
