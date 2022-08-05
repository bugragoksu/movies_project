import 'package:flutter/material.dart';

mixin PaginationList {
  final ScrollController scrollController = ScrollController();
  late final void Function()? onLoadMore;
  bool isLoadingMore = false;

  void paginationDispose() {
    scrollController.dispose();
  }

  void addScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge && scrollController.position.pixels != 0) {
        if (onLoadMore != null) onLoadMore?.call();
      }
    });
  }

  Widget paginationLoader() {
    if (isLoadingMore) {
      return loadingMoreIndicator();
    } else {
      return const SizedBox(height: 24);
    }
  }

  Widget loadingMoreIndicator() {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
