
import 'dart:async';

import 'package:flutter/services.dart';

class NetworkConnectivity {
  static const MethodChannel _channel =
      const MethodChannel('network_connectivity');

  static Future<bool?> get isNetworkAvailable async {
    final bool? status = await _channel.invokeMethod('getConnectionStatus');
    return status;
  }
}
