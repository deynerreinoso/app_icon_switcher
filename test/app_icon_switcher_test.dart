import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_icon_switcher/app_icon_switcher_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppIconSwitcherPlatform
    with MockPlatformInterfaceMixin
    implements AppIconSwitcherPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  const MethodChannel channel = MethodChannel('app_icon_switcher');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
