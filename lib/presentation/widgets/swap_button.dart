import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SwapButton extends StatefulWidget {
  final VoidCallback onTap;

  const SwapButton({super.key, required this.onTap});

  @override
  State<SwapButton> createState() => _SwapButtonState();
}

class _SwapButtonState extends State<SwapButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    widget.onTap();
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Animate(
        controller: _controller,
        effects: const [
          RotateEffect(
              duration: Duration(milliseconds: 300), curve: Curves.easeInOut)
        ],
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: 0.2),
            border: Border.all(
                color: Colors.white.withValues(alpha: 0.3), width: 2),
          ),
          child: const Icon(Icons.swap_vert, color: Colors.white, size: 32),
        ),
      ),
    );
  }
}
