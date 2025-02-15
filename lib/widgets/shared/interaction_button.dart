import 'package:flutter/material.dart';

class InteractionButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24,
            child: Icon(
              icon,
              size: 24,
              color: color ?? Colors.grey[600],
            ),
          ),
          const SizedBox(width: 4),
          SizedBox(
            width: 30,
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 16,
                color: color ?? Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
