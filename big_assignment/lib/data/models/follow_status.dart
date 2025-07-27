import 'package:big_assignment/constants/app_icons.dart';

enum FollowStatus {
  follow,
  unfollow,
}

extension FollowStatusExtension on FollowStatus {
  String get icon {
    switch (this) {
      case FollowStatus.follow:
        return AppIcons.plus;
      case FollowStatus.unfollow:
        return AppIcons.unFollow;
    }
  }
}
