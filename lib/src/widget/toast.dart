import 'dart:async';

import 'package:flutter/material.dart';
import 'package:crm/src/constant/constant.dart';

class Toast {
  static void error(BuildContext context, String error) =>
      showToast(context, message: error, type: ToastType.error);

  static void success(BuildContext context, String success) =>
      showToast(context, message: success, type: ToastType.success);
}

OverlayEntry? _previousEntry;

enum ToastType { info, error, success, warning }

void showToast(BuildContext context,
    {required String message, required ToastType type}) {
  late OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (_) => FlutterToast(
      message: message.capitalizeFirst,
      type: type,
      onDismissed: () {
        overlayEntry.remove();
        _previousEntry = null;
      },
    ),
  );

  if (_previousEntry != null && _previousEntry!.mounted) {
    _previousEntry?.remove();
  }
  // SchedulerBinding.instance
  //     .addPostFrameCallback((_) => Overlay.of(context).insert(overlayEntry));
  Overlay.of(context).insert(overlayEntry);

  _previousEntry = overlayEntry;
}

class FlutterToast extends StatefulWidget {
  const FlutterToast({
    super.key,
    required this.message,
    required this.type,
    required this.onDismissed,
  });

  final String message;
  final ToastType type;
  final void Function() onDismissed;

  @override
  State<FlutterToast> createState() => _FlutterToastState();
}

class _FlutterToastState extends State<FlutterToast>
    with SingleTickerProviderStateMixin {
  late final Animation<Offset> _offsetAnimation;
  late final AnimationController _animationController;
  late final Tween<Offset> _offsetTween;

  Timer? _timer;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
      reverseDuration: const Duration(milliseconds: 600),
    );
    _animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _timer = Timer(const Duration(milliseconds: 3000), () {
            if (mounted) {
              _animationController.reverse();
            }
          });
        }
        if (status == AnimationStatus.dismissed) {
          _timer?.cancel();
          widget.onDismissed.call();
        }
      },
    );

    _offsetTween = Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero);

    _offsetAnimation = _offsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
        reverseCurve: Curves.linearToEaseOut,
      ),
    );
    if (mounted) {
      _animationController.forward();
    }
    super.initState();
  }

  Color get _typeColor {
    switch (widget.type) {
      case ToastType.info:
        return Palette.blue;

      case ToastType.error:
        return Palette.red;

      case ToastType.success:
        return Palette.green;

      case ToastType.warning:
        return Palette.orange;
    }
  }

  IconData get _iconData {
    switch (widget.type) {
      case ToastType.info:
        return Icons.info_outline_rounded;

      case ToastType.error:
        return Icons.error_outline_rounded;

      case ToastType.success:
        return Icons.check_circle_outline_rounded;

      case ToastType.warning:
        return Icons.warning_amber_rounded;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16.0.r,
      bottom: null,
      left: 16.0.r,
      right: 16.0.r,
      child: SlideTransition(
        position: _offsetAnimation,
        child: SafeArea(
          child: Material(
            borderRadius: BorderRadius.circular(8.0.r),
            child: InkWell(
              onTap: () {
                if (mounted) {
                  _animationController.reverse();
                }
              },
              borderRadius: BorderRadius.circular(8.0.r),
              child: Container(
                padding: EdgeInsets.all(12.0.r),
                decoration: BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.circular(8.0.r),
                  border: Border(
                    left: BorderSide(color: _typeColor, width: 2.0.w),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Palette.black.withOpacity(0.25),
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0.0, 1.0),
                    ),
                    const BoxShadow(
                      color: Color(0x17cfcfcf),
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                      offset: Offset(0.0, 1.0),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: _typeColor.withOpacity(0.2),
                      radius: 16.0.sp,
                      child: Icon(_iconData, color: _typeColor, size: 20.0.sp),
                    ),
                    SizedBox(width: 8.0.w),
                    Expanded(
                      child: Text(widget.message),
                    ),
                    SizedBox(width: 8.0.w),
                    const Icon(Icons.close),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
