import 'package:flutter/gestures.dart';
import 'package:helt/game.dart';
import 'package:spritewidget/spritewidget.dart';

class BridgeTile extends Sprite {
  int x;
  int y;
  Game game;
  BridgeTile(SpriteTexture image, int x, int y, Game game) : super(image) {
    userInteractionEnabled = true;
    this.x = x;
    this.y = y;
    this.game = game;
  }

  @override
  handleEvent(SpriteBoxEvent event) {
    if (event.type == PointerDownEvent) {
      print('Click on Bridge$x / $y');
      game.click(x, y);
    }
    return true;
  }
}
