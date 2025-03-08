import 'package:flutter/material.dart';

class InteractionButton extends StatefulWidget {
  final IconData icon;
  final int count;
  final Color? color;
  final VoidCallback? onTap;
  final int size;
  final String? defaultText;
  final int textSize;
  const InteractionButton({
    super.key,
    required this.icon,
    required this.count,
    this.color,
    this.onTap,
    this.size = 20,
    this.defaultText = '0',
    this.textSize = 16,
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
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
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
                    size: widget.size.toDouble(),
                    color: widget.color ?? Colors.grey[600],
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 4),
          SizedBox(
            width: 40,
            child: Text(
              widget.count == 0 ? widget.defaultText! : '${widget.count}',
              style: TextStyle(
                fontSize: widget.textSize.toDouble(),
                color: widget.color ?? Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
