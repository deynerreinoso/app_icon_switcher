import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_icon_switcher/app_icon_switcher_method_channel.dart';

void main() {
  MethodChannelAppIconSwitcher platform = MethodChannelAppIconSwitcher();
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

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
