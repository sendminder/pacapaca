import 'package:flutter/material.dart';

class RotatingPacaLoader extends StatefulWidget {
  final double size;

  const RotatingPacaLoader({
    super.key,
    this.size = 48.0,
  });

  @override
  State<RotatingPacaLoader> createState() => _RotatingPacaLoaderState();
}

class _RotatingPacaLoaderState extends State<RotatingPacaLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset(
        'assets/icon/pacappi.png',
        width: widget.size,
        height: widget.size,
      ),
    );
  }
}
