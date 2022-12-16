
import 'package:flutter/services.dart';
import 'app_icon_switcher_platform_interface.dart';

class AppIconSwitcher {
  static const MethodChannel _channel = MethodChannel('app_icon_switcher');

  Future<String?> getPlatformVersion() {
    return AppIconSwitcherPlatform.instance.getPlatformVersion();
  }

  static Future<void> updateIcon(String iconName) async {
    await _channel.invokeMethod('updateIcon', { 'name': iconName });
  }

  static Future<void> resetIcon() async {
    await _channel.invokeMethod('resetIcon');
  }
}
