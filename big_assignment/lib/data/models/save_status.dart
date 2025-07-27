import 'package:big_assignment/constants/app_icons.dart';

enum SaveStatus {
  save,
  dontSave,
}

extension SaveSatusExtension on SaveStatus {
  String get icon {
    switch (this) {
      case SaveStatus.save:
        return AppIcons.save;
      case SaveStatus.dontSave:
        return AppIcons.dontSave;
    }
  }
}
