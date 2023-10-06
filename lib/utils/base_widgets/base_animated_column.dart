import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class BaseAnimatedColumn extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final int animationDuration = 375;
  final bool? scrollable;
  const BaseAnimatedColumn({super.key, required this.children, this.crossAxisAlignment, this.mainAxisAlignment, this.mainAxisSize, this.scrollable});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: (scrollable??false) ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
      child: AnimationLimiter(
        child: Column(
          crossAxisAlignment: crossAxisAlignment??CrossAxisAlignment.center,
          mainAxisAlignment: mainAxisAlignment??MainAxisAlignment.start,
          mainAxisSize: mainAxisSize??MainAxisSize.min,
          children: AnimationConfiguration.toStaggeredList(
            duration: Duration(milliseconds: animationDuration),
            childAnimationBuilder: (widget) => SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: children,
          ),
        ),
      ),
    );
  }
}
