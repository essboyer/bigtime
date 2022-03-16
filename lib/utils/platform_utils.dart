import 'dart:io';
import 'dart:ui';

import 'package:window_size/window_size.dart';

class PlatformUtils {
  // Is the device a desktop device?
  static bool isDesktop() {
    return Platform.isMacOS || Platform.isLinux || Platform.isWindows;
  }

  // Is the device a mobile device?
  static bool isMobile() {
    return Platform.isAndroid || Platform.isIOS;
  }
}
