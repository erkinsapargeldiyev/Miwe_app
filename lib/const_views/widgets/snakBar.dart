import 'package:flutter/material.dart';

class Snakbar {
  static void snakBar({
    required String title,
    required BuildContext context,
    required Color color,
  }) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (_) => _CustomSnackbar(message: title, backgroundColor: color),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(milliseconds: 1000), () {
      overlayEntry.remove();
    });
  }
}

class _CustomSnackbar extends StatefulWidget {
  final String message;
  final Color backgroundColor;

  const _CustomSnackbar({required this.message, required this.backgroundColor});

  @override
  State<_CustomSnackbar> createState() => _CustomSnackbarState();
}

class _CustomSnackbarState extends State<_CustomSnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _sizeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 55,
      left: 40,
      right: 40,
      child: SizeTransition(
        sizeFactor: _sizeAnimation,
        axis: Axis.vertical,
        axisAlignment: -100.0,
        child: Center(
          child: Container(
            width: 300,
            height: 40,
            child: Material(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(10),
              child: Center(
                child: Text(
                  widget.message,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
