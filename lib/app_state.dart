import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _postIsSaved = true;
  bool get postIsSaved => _postIsSaved;
  set postIsSaved(bool _value) {
    _postIsSaved = _value;
  }

  bool _termofservices = true;
  bool get termofservices => _termofservices;
  set termofservices(bool _value) {
    _termofservices = _value;
  }
}
