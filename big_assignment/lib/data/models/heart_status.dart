import 'package:big_assignment/constants/app_icons.dart';

enum HeartStatus {
  like,
  dontLike,
}

extension HeartSatusExtension on HeartStatus {
  String get icon {
    switch (this) {
      case HeartStatus.like:
        return AppIcons.like;
      case HeartStatus.dontLike:
        return AppIcons.dontLike;
    }
  }
}
