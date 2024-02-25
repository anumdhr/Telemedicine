import 'dart:async';

import 'package:rxdart/rxdart.dart';

class CheckboxRepo{
  late bool _checkBoxState;

  CheckboxRepo({required bool initialState}) {
    _checkBoxState = initialState;
    _addValue.add(_checkBoxState);
  }

  final _checkBoxStream = BehaviorSubject<bool>();

  Stream<bool> get checkBoxState => _checkBoxStream.stream;
  Sink get _addValue => _checkBoxStream.sink;

  void onCheckBoxClick({required bool state}) {
    _addValue.add(state);
  }

  bool getCurrentState() => _checkBoxState;

  void dispose() {
    _checkBoxStream.close();
  }
}