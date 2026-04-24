import 'package:flutter/material.dart';

class TapOpacity extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double pressedOpacity;
  final Duration duration;
  final Curve curve;
  final HitTestBehavior behavior;

  const TapOpacity({
    super.key,
    required this.child,
    this.onTap,
    this.pressedOpacity = 0.6,
    this.duration = const Duration(milliseconds: 150),
    this.curve = Curves.easeInOut,
    this.behavior = HitTestBehavior.translucent,
  }) : assert(pressedOpacity >= 0 && pressedOpacity <= 1);

  @override
  State<TapOpacity> createState() => _TapOpacityState();
}

class _TapOpacityState extends State<TapOpacity> {
  late ValueNotifier<double> _opacityNotifier;

  @override
  void initState() {
    super.initState();
    _opacityNotifier = ValueNotifier(1.0);
  }

  @override
  void dispose() {
    _opacityNotifier.dispose();
    super.dispose();
  }

  void _onPressed() {
    _opacityNotifier.value = widget.pressedOpacity;
    widget.onTap?.call();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (!mounted) return;
      _opacityNotifier.value = 1.0;
    });
  }

  void _setPressed(bool pressed) {
    _opacityNotifier.value = pressed ? widget.pressedOpacity : 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onPressed(),
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      behavior: widget.behavior,
      child: ValueListenableBuilder(
        valueListenable: _opacityNotifier,
        builder: (_, opacity, _) {
          return AnimatedOpacity(
            opacity: opacity,
            duration: widget.duration,
            curve: widget.curve,
            child: widget.child,
          );
        },
      ),
    );
  }
}
