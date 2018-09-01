import 'package:flutter/gestures.dart';
import 'package:spritewidget/spritewidget.dart';

class BridgeTile extends Sprite {
  int x;
  int y;

  BridgeTile(SpriteTexture image, int x, int y) : super(image) {
    userInteractionEnabled = true;
    this.x = x;
    this.y = y;
  }

  @override
  handleEvent(SpriteBoxEvent event) {
    if (event.type == PointerDownEvent) {
      print('Click on Bridge$x / $y');
    }
    return true;
  }
}
