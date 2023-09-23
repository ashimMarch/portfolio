
import 'dart:math' as math;

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../globals/app_assets.dart';

class RotatedAvatar extends StatefulWidget {
  const RotatedAvatar({
    super.key,
  });

  @override
  State<RotatedAvatar> createState() => _RotatedAvatarState();
}

class _RotatedAvatarState extends State<RotatedAvatar> with SingleTickerProviderStateMixin{
late final AnimationController _controller;
@override
void initState() {
  super.initState();
  _controller = AnimationController(vsync: this, duration: const Duration(seconds: 6))..repeat();
}
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: Stack(
        children: [
          Image.asset(
            AppAssets.profile2,
            height: 400,
          ),
          AnimatedBuilder(
            animation: _controller,
            builder:(context, _) => Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: Image.asset(
                AppAssets.profile3,
                height: 400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
