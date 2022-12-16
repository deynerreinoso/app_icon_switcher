import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'app_icon_switcher_method_channel.dart';

abstract class AppIconSwitcherPlatform extends PlatformInterface {
  /// Constructs a AppIconSwitcherPlatform.
  AppIconSwitcherPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppIconSwitcherPlatform _instance = MethodChannelAppIconSwitcher();

  /// The default instance of [AppIconSwitcherPlatform] to use.
  ///
  /// Defaults to [MethodChannelAppIconSwitcher].
  static AppIconSwitcherPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AppIconSwitcherPlatform] when
  /// they register themselves.
  static set instance(AppIconSwitcherPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
