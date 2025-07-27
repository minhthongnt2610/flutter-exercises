import 'package:big_assignment/data/models/firebase/fb_tiktok_model.dart';
import 'package:big_assignment/data/models/tiktok_model.dart';
import 'package:big_assignment/screens/home/widgets/action_button_widget.dart';
import 'package:big_assignment/screens/home/widgets/app_bar_widget.dart';
import 'package:big_assignment/screens/home/widgets/bottom_bar_widget.dart';
import 'package:big_assignment/screens/home/widgets/video_player_item.dart';
import 'package:flutter/material.dart';

import '../../data/remote/firestores_service.dart';
import 'widgets/info_widget.dart';

class TiktokHomeFollowing extends StatefulWidget {
  static const routeName = '/tiktok_home_following';
  const TiktokHomeFollowing({super.key});

  @override
  State<TiktokHomeFollowing> createState() => _TiktokHomeFollowingState();
}

class _TiktokHomeFollowingState extends State<TiktokHomeFollowing> {
  final _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestoreService.getVideos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }
        final tiktokLists = snapshot.data
            ?.map((fbTiktokModel) => fbTiktokModel.toTiktokModel())
            .toList();

        if (tiktokLists == null) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          appBar: const AppBarWidget(),
          body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: tiktokLists.length,
            itemBuilder: (context, index) {
              final tiktokModel = tiktokLists[index];
              return Stack(
                children: [
                  VideoPlayerItem(
                    tiktokModel: tiktokModel,
                    onHeartStatusChanged: (heartStatus) async {
                      final fbTiktokModel = tiktokModel
                          .copyWith(
                            heartStatus: heartStatus,
                          )
                          .toFbTiktokModel();
                      await _firestoreService.updateVideo(fbTiktokModel);
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ActionButtonWidget(
                      tiktokModel: tiktokModel,
                      onHeartStatusChanged: (heartStatus) async {
                        final fbTiktokModel = tiktokModel
                            .copyWith(
                              heartStatus: heartStatus,
                            )
                            .toFbTiktokModel();
                        await _firestoreService.updateVideo(fbTiktokModel);
                      },
                      onSaveStatusChanged: (saveStatus) async {
                        final fbTiktokModel = tiktokModel
                            .copyWith(
                              saveStatus: saveStatus,
                            )
                            .toFbTiktokModel();
                        await _firestoreService.updateVideo(fbTiktokModel);
                      },
                      onFollowStatusChanged: (followStatus) async {
                        final fbTiktokModel = tiktokModel
                            .copyWith(
                              followStatus: followStatus,
                            )
                            .toFbTiktokModel();
                        await _firestoreService.updateVideo(fbTiktokModel);
                      },
                    ),
                  ),
                  InfoWidget(tiktokModel: tiktokModel),
                ],
              );
            },
          ),
          bottomNavigationBar: const BottomBarWidget(),
        );
      },
    );
  }
}
