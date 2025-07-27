
import 'package:big_assignment/constants/app_icons.dart';
import 'package:big_assignment/data/models/follow_status.dart';
import 'package:big_assignment/data/models/tiktok_model.dart';
import 'package:flutter/material.dart';

import '../../../constants/number_of_action_like.dart';
import '../../../data/models/heart_status.dart';
import '../../../data/models/save_status.dart';
import '../../../data/remote/firestores_service.dart';
import 'comment_sheet_widget.dart';

class ActionButtonWidget extends StatefulWidget {
  const ActionButtonWidget({
    super.key,
    required this.tiktokModel,
    required this.onHeartStatusChanged,
    required this.onSaveStatusChanged,
    required this.onFollowStatusChanged,
  });

  final TiktokModel tiktokModel;
  final ValueChanged<HeartStatus> onHeartStatusChanged;
  final ValueChanged<SaveStatus> onSaveStatusChanged;
  final ValueChanged<FollowStatus> onFollowStatusChanged;

  @override
  State<ActionButtonWidget> createState() => _ActionButtonWidgetState();
}

class _ActionButtonWidgetState extends State<ActionButtonWidget> {
  int numberLike = 0;
  int numberSave = 0;
  bool isLiked = false;
  bool isSaved = false;
  bool isFollowed = false;
  final _firestoreService = FirestoreService();
  void _commentSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        barrierLabel: 'CommentSheet',
        context: context,
        builder: (context) {
          return const CommentSheetWidget();
        });
  }

  @override
  void initState() {
    super.initState();
    NumberOfActionLike.numberLike = widget.tiktokModel.numberLike;
    numberSave = widget.tiktokModel.numberSave;
    isLiked = widget.tiktokModel.heartStatus == HeartStatus.like;
    isSaved = widget.tiktokModel.saveStatus == SaveStatus.save;
    isFollowed = widget.tiktokModel.followStatus == FollowStatus.follow;
    _firestoreService.getVideosId();
  }

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 10, top: 314),
        child: SizedBox(
          width: 50 * height / 868,
          height: 483 * height / 868,
          child: Column(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {},
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(22)),
                      child: CircleAvatar(
                        radius: 30 * height / 868,
                        backgroundImage:
                            NetworkImage(widget.tiktokModel.urlAvatar),
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isFollowed) {
                              widget.onFollowStatusChanged
                                  .call(FollowStatus.follow);
                            } else {
                              widget.onFollowStatusChanged
                                  .call(FollowStatus.unfollow);
                            }
                            isFollowed = !isFollowed;
                          });
                        },
                        child: Image.asset(
                          isFollowed ? AppIcons.plus : AppIcons.unFollow,
                          width: 21 * height / 868,
                          height: 21 * height / 868,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35.5 * height / 868),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (isLiked) {
                      widget.onHeartStatusChanged.call(HeartStatus.dontLike);
                      NumberOfActionLike.numberLike--;
                    } else {
                      widget.onHeartStatusChanged.call(HeartStatus.like);
                      NumberOfActionLike.numberLike++;
                    }
                    isLiked = !isLiked;
                  });
                },
                child: Image.asset(
                  isLiked ? AppIcons.like : AppIcons.dontLike,
                  width: 30.5 * height / 868,
                  height: 30.5 * height / 868,
                ),
              ),
              SizedBox(height: 5.64 * height / 868),
              Text(
                formatNumber(NumberOfActionLike.numberLike),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13 * height / 868,
                  fontWeight: FontWeight.w600,
                  shadows: const [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 19.5 * height / 868),
              GestureDetector(
                onTap: () {
                  _commentSheet(context);
                },
                child: Image.asset(
                  AppIcons.comment,
                  width: 35.5 * height / 868,
                  height: 40 * height / 868,
                ),
              ),
              SizedBox(height: 5.27 * height / 868),
              Text(
                formatNumber(widget.tiktokModel.numberComment),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13 * height / 868,
                  fontWeight: FontWeight.w600,
                  shadows: const [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22.5 * height / 868),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSaved) {
                      widget.onSaveStatusChanged.call(SaveStatus.dontSave);
                      numberSave++;
                    } else {
                      widget.onSaveStatusChanged.call(SaveStatus.save);
                      numberSave--;
                    }
                    isSaved = !isSaved;
                  });
                },
                child: Image.asset(
                  isSaved ? AppIcons.save : AppIcons.dontSave,
                  width: 35.5 * height / 868,
                  height: 24 * height / 868,
                ),
              ),
              SizedBox(height: 5.27 * height / 868),
              Text(
                formatNumber(numberSave),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13 * height / 868,
                  fontWeight: FontWeight.w600,
                  shadows: const [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22.5 * height / 868),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  AppIcons.share,
                  width: 35.5 * height / 868,
                  height: 30 * height / 868,
                ),
              ),
              SizedBox(height: 5.27 * height / 868),
              Text(
                widget.tiktokModel.numberShare.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13 * height / 868,
                  fontWeight: FontWeight.w600,
                  shadows: const [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50 * height / 868),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  AppIcons.music,
                  width: 50 * height / 868,
                  height: 50 * height / 868,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatNumber(int number) {
    if (number >= 1000000000) {
      return '${(number / 1000000000).toStringAsFixed(1)}B';
    } else if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    } else {
      return number.toString();
    }
  }
}
