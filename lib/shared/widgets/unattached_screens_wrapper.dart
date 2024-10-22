import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'full_page_progress_indicator.dart';

class UnattachedScreensWrapper extends StatelessWidget {
  const UnattachedScreensWrapper({required this.isLoading, required this.canPop, required this.content, super.key});

  final bool canPop;
  final bool isLoading;
  final Widget content;

  Widget _background() {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: const BlurHash(hash: 'L11{v+fiR2e?tofiR3e?tofhRMjJ'),
    );
  }

  Widget _body(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(64),
            child: content,
          ),
        ),
      ],
    );
  }

  Widget _backButton(BuildContext context) {
    return Positioned(
      top: 8,
      left: 8,
      child: SafeArea(
        child: IconButton(onPressed: () => context.router.maybePop(), icon: const Icon(Icons.arrow_back)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: _body(context),
        ),
        if (canPop) _backButton(context),
        if (isLoading) const FullPageProgressIndicator(),
      ],
    );
  }
}