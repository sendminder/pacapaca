import 'package:flutter/material.dart';

class InteractionButton extends StatefulWidget {
  final IconData icon;
  final int count;
  final Color? color;
  final VoidCallback? onTap;

  const InteractionButton({
    super.key,
    required this.icon,
    required this.count,
    this.color,
    this.onTap,
  });

  @override
  State<InteractionButton> createState() => _InteractionButtonState();
}

class _InteractionButtonState extends State<InteractionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onTap != null) {
          _controller.forward();
          widget.onTap!();
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 4),
          SizedBox(
            width: 20,
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Icon(
                    widget.icon,
                    size: 20,
                    color: widget.color ?? Colors.grey[600],
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 4),
          SizedBox(
            width: 24,
            child: Text(
              '${widget.count}',
              style: TextStyle(
                fontSize: 16,
                color: widget.color ?? Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
