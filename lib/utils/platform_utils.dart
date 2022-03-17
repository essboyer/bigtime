import 'dart:io';

class PlatformUtils {
  /// Is the current device a desktop device?
  static bool isDesktop() {
    return Platform.isMacOS || Platform.isLinux || Platform.isWindows;
  }

  /// Is the current device a mobile device?
  static bool isMobile() {
    return Platform.isAndroid || Platform.isIOS;
  }
}
