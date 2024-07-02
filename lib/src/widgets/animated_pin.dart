import 'package:flutter/material.dart';

class AnimatedPin extends StatefulWidget {
  const AnimatedPin({super.key,
    this.child,
  });

  final Widget? child;

  @override
  AnimatedPinState createState() => AnimatedPinState();
}

class AnimatedPinState extends State<AnimatedPin> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return JumpingContainer(controller: _controller, child: widget.child);
  }
}

class JumpingContainer extends AnimatedWidget {
  const JumpingContainer({
    required final AnimationController controller,
    super.key,
    this.child,
  }) : super(listenable: controller);

  final Widget? child;

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(final BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -10 + _progress.value * 10),
      child: child,
    );
  }
}
