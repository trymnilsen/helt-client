import 'dart:ui';

import 'package:helt/bridgetile.dart';
import 'package:helt/game.dart';
import 'package:helt/grasstile.dart';
import 'package:helt/tower.dart';
import 'package:helt/world.dart';
import 'package:spritewidget/spritewidget.dart';

class GrassLands extends World {
  Game game;
  GrassLands(ImageMap imageMap, NodeWithSize rootNode, Game game) : super(imageMap, rootNode) {
    //Create tiles
    this.game = game;
    createEnemyArea(imageMap, rootNode);
    createBridge(imageMap, rootNode);
    createPlayerArea(imageMap, rootNode);
  }
  createPlayerArea(ImageMap imageMap, NodeWithSize rootNode) {
    SpriteTexture texture = SpriteTexture(imageMap["assets/grasstile.png"]);
    //Create ground
    for (int y = 0; y < 6; y++) {
      for (int x = 0; x < 7; x++) {
        var tile = new GrassTile(texture, x, y + 9, this.game);
        tile.position = new Offset(World.getScreenX(x), World.getScreenY(y + 9));
        rootNode.addChild(tile);
      }
    }
    //Create towers
    var leftTower = new Tower(imageMap, TowerColor.Player);
    leftTower.position = new Offset(World.getScreenX(1), World.getScreenY(11) - 42);
    rootNode.addChild(leftTower);
    var rightTower = new Tower(imageMap, TowerColor.Player);
    rightTower.position = new Offset(World.getScreenX(5), World.getScreenY(11) - 42);
    rootNode.addChild(rightTower);

    //Castle
    var castle = new Castle(imageMap, TowerColor.Player);
    castle.position = new Offset(World.getScreenX(3), World.getScreenY(13) - 58);
    rootNode.addChild(castle);
    createFence(imageMap, rootNode, true);
  }
  createEnemyArea(ImageMap imageMap, NodeWithSize rootNode) {
    SpriteTexture texture = SpriteTexture(imageMap["assets/grasstile.png"]);
    for (int y = 0; y < 6; y++) {
      for (int x = 0; x < 7; x++) {
        var tile = new GrassTile(texture, x, y, this.game);
        tile.position = new Offset(World.getScreenX(x), World.getScreenY(y));
        rootNode.addChild(tile);
      }
    }

    var leftTower = new Tower(imageMap, TowerColor.Enemy);
    leftTower.position = new Offset(World.getScreenX(1), World.getScreenY(3) - 42);
    rootNode.addChild(leftTower);
    var rightTower = new Tower(imageMap, TowerColor.Enemy);
    rightTower.position = new Offset(World.getScreenX(5), World.getScreenY(3) - 42);
    rootNode.addChild(rightTower);

    createFence(imageMap, rootNode, false);
    //Castle
    var castle = new Castle(imageMap, TowerColor.Enemy);
    castle.position = new Offset(World.getScreenX(3), World.getScreenY(1) - 58);
    rootNode.addChild(castle);
  }
  createBridge(ImageMap imageMap, NodeWithSize rootNode) {
    SpriteTexture bridge = SpriteTexture(imageMap["assets/bridge.png"]);
    //Create left bridge
    var topLeft = new BridgeTile(bridge, 1, 6, this.game);
    topLeft.position = new Offset(World.getScreenX(1),World.getScreenY(6) - 14);
    rootNode.addChild(topLeft);
    var middleLeft = new BridgeTile(bridge, 1, 7, this.game);
    middleLeft.position = new Offset(World.getScreenX(1),World.getScreenY(7) - 14);
    rootNode.addChild(middleLeft);
    var bottomLeft = new BridgeTile(bridge, 1, 8, this.game);
    bottomLeft.position = new Offset(World.getScreenX(1),World.getScreenY(8) - 14);
    rootNode.addChild(bottomLeft);
    //Create right bridge
    var topRight = new BridgeTile(bridge, 5, 6, this.game);
    topRight.position = new Offset(World.getScreenX(5),World.getScreenY(6)- 14);
    rootNode.addChild(topRight);
    var middleRight = new BridgeTile(bridge, 5, 7, this.game);
    middleRight.position = new Offset(World.getScreenX(5),World.getScreenY(7)- 14);
    rootNode.addChild(middleRight);
    var bottomRight = new BridgeTile(bridge, 5, 8, this.game);
    bottomRight.position = new Offset(World.getScreenX(5),World.getScreenY(8)- 14);
    rootNode.addChild(bottomRight);
  }
  createFence(ImageMap imageMap, NodeWithSize rootNode, bool isPlayerSide) {
    for(int i = 0; i<7; i++) {
      var sprite = new Sprite.fromImage(imageMap["assets/fence.png"]);
      sprite.position = new Offset(World.getScreenX(i), World.getScreenY(isPlayerSide ? 14 : 0) - 20);
      rootNode.addChild(sprite);
    }
  }
}