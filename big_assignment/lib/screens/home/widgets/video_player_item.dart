import 'package:big_assignment/data/models/tiktok_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../constants/number_of_action_like.dart';
import '../../../data/models/heart_status.dart';

class VideoPlayerItem extends StatefulWidget {
  const VideoPlayerItem({
    super.key,
    required this.tiktokModel,
    required this.onHeartStatusChanged,
  });

  final TiktokModel tiktokModel;
  final ValueChanged<HeartStatus> onHeartStatusChanged;
  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _controller;

  bool _isPlaying = true;
  int numberLike = 0;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.tiktokModel.urlVideo),
    )..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true); //video lặp lại liên tục
      });
    numberLike = widget.tiktokModel.numberLike;
  }

  void _onTap() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
    setState(() {
      _isPlaying = _controller.value.isPlaying;
    });
  }

  void _onDoubleTap() {
    setState(() {
      if (widget.tiktokModel.heartStatus == HeartStatus.like) {
        widget.onHeartStatusChanged.call(HeartStatus.dontLike);
        NumberOfActionLike.numberLike--;
        debugPrint('numberLike: $numberLike');
      } else {
        widget.onHeartStatusChanged.call(HeartStatus.like);
        NumberOfActionLike.numberLike++;
        debugPrint('numberLike: $numberLike');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int height = MediaQuery.of(context).size.height.toInt();
    return GestureDetector(
      onTap: _onTap,
      onDoubleTap: _onDoubleTap,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: _controller.value.isInitialized
                ? FittedBox(
                    //làm co dãn theo kích thước của video mà không làm méo hình
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
          ),
          if (!_isPlaying)
            Center(
              child: Icon(
                Icons.play_arrow,
                size: 100 * height / 868,
                color: Colors.white38,
              ),
            ),
        ],
      ),
    );
  }
}
