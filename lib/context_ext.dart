import 'package:flutter/widgets.dart';

extension Media on BuildContext {
  MediaQueryData get media {
    return MediaQuery.of(this);
  }
}
