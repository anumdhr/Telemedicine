import 'package:flutter/foundation.dart';

void sPrint(Object data) {
  if (kDebugMode) {
    print(
        '------------------------*** DEBUG PRINT START ***-------------------\n');
    print(data);
    print(
        '------------------------*** DEBUG PRINT END ***-------------------\n\n');
  }
}
