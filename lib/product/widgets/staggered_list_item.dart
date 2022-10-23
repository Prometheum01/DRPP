import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StaggeredItem extends StatelessWidget {
  const StaggeredItem({super.key, required this.index, required this.child});

  final int index;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: ScaleAnimation(child: child),
      ),
    );
  }
}
