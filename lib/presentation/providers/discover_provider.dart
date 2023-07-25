import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repositories.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostReposity videosReposity;

  bool initialLoanding = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosReposity});

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));

    //final List<VideoPost> newVideos = videoPosts
    //  .map((video) => LocalVideoModel.fromJsonMap(video).toVideoPostEntity())
    //.toList();

    final newVideos = await videosReposity.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoanding = false;
    notifyListeners();
  }
}
