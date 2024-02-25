import 'package:rxdart/rxdart.dart';

class PhoneNumCheckRepo{
  bool isValidate = false;

  final _numberValidationStream = BehaviorSubject<bool>();

  Stream<bool> get isNumValidate => _numberValidationStream.stream;
  Sink get _addValue => _numberValidationStream.sink;

  void onCheckNumber({required String number}) {
    if(number.isNotEmpty){
      RegExp hexNum = RegExp(r'^\+\d{3}\s*\d{2,3}\s{0,1}\-*\s{0,1}\d{0,8}|^9\d{9}|^[4-5]\d{0,7}');
      if((hexNum.hasMatch(number) && number.length==10)){
        _addValue.add(true);
      }else{
        _addValue.add(false);
      }
    }else{
      _addValue.add(false);
    }
  }

  bool getCurrentState() => isValidate;

  void dispose() {
    _numberValidationStream.close();
  }
}