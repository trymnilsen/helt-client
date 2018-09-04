import 'dart:ui';

import 'package:spritewidget/spritewidget.dart';

enum TowerColor {
  Player,
  Enemy
}

class Tower extends NodeWithSize{
  Tower(ImageMap map, TowerColor color)
    : super(Size(90.0,110.0)) {
      var spriteTexture;
      if(color == TowerColor.Player) {
        spriteTexture = SpriteTexture(map["assets/playertower.png"]);
      } else {
        spriteTexture = SpriteTexture(map["assets/enemytower.png"]);
      }

      Sprite towerSprite = Sprite(spriteTexture);
      addChild(towerSprite);
  }
}
class Castle extends NodeWithSize{
  Castle(ImageMap map, TowerColor color)
    : super(Size(90.0,110.0)) {
      var spriteTexture;
      if(color == TowerColor.Player) {
        spriteTexture = SpriteTexture(map["assets/playercastle.png"]);
      } else {
        spriteTexture = SpriteTexture(map["assets/enemycastle.png"]);
      }

      Sprite towerSprite = Sprite(spriteTexture);
      addChild(towerSprite);
  }
}