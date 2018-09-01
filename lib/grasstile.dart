import 'package:flutter/gestures.dart';
import 'package:spritewidget/spritewidget.dart';

class GrassTile extends Sprite {
  int x;
  int y;

  GrassTile(SpriteTexture image, int x, int y) : super(image) {
    userInteractionEnabled = true;
    this.x = x;
    this.y = y;
  }

  @override
  handleEvent(SpriteBoxEvent event) {
    if (event.type == PointerDownEvent) {
      print('Click on $x / $y');
    }
    return true;
  }
}
