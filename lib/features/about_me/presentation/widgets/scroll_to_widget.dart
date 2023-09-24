import 'package:flutter/material.dart';

void scrollToWidget({
  required BuildContext context,
  required ScrollController scrollController,
  required GlobalKey key,
}) {
  try {
    final RenderBox renderBox =
        key.currentContext?.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    scrollController.animateTo(position.dy,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  } catch (e) {
    print(e.toString());
  }
}
