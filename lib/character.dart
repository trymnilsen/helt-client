import 'dart:ui';

import 'package:spritewidget/spritewidget.dart';

enum CharacterOwner {
  Player,
  Enemy
}
class Character extends Sprite {
  CharacterOwner owner;
  int x;
  int y;
  Character(SpriteTexture texture, int x, int y, CharacterOwner owner) : super(texture) {
    this.x = x;
    this.y = y;
    this.owner = owner;
  }
}
class CharacterOwnerIdentifier extends Node {
  static Paint playerPaint = new Paint()..color = const Color(0xff3f828e);
  static Paint enemyPaintPaint = new Paint()..color = const Color(0xffa94f2f);
  CharacterOwner owner;
  CharacterOwnerIdentifier(CharacterOwner owner) {
    this.owner = owner;
  }
@override
void paint(Canvas canvas) {
  canvas.drawRect(
    new Rect.fromLTWH(0.0, 0.0, 30.0, 10.0),
    owner == CharacterOwner.Player ? playerPaint : enemyPaintPaint
  );
}
}