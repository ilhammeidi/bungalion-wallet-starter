import 'package:flutter/foundation.dart';

bool isOnDesktopAndWeb() {
  if (kIsWeb) {
    return true;
  }
  switch (defaultTargetPlatform) {
    case TargetPlatform.macOS:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return true;
    case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
  }
}

bool isOnAndorid() {
  if (kIsWeb) {
    return false;
  }
  switch (defaultTargetPlatform) {
    case TargetPlatform.macOS:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return false;
    case TargetPlatform.iOS:
      return false;
    case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return true;
  }
}

bool isOnIos() {
  if (kIsWeb) {
    return false;
  }
  switch (defaultTargetPlatform) {
    case TargetPlatform.macOS:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return false;
    case TargetPlatform.iOS:
      return true;
    case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return false;
  }
}

bool isUrl(String path) {
  try {
    final uri = Uri.parse(path);
    return uri.isAbsolute && (uri.scheme == 'http' || uri.scheme == 'https' || uri.scheme == 'ftp');
  } catch (e) {
    return false;
  }
}
