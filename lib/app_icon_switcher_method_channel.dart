import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_icon_switcher_platform_interface.dart';

/// An implementation of [AppIconSwitcherPlatform] that uses method channels.
class MethodChannelAppIconSwitcher extends AppIconSwitcherPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('app_icon_switcher');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
