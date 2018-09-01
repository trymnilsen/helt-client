import 'dart:ui';

import 'package:helt/bridgetile.dart';
import 'package:helt/grasstile.dart';
import 'package:helt/world.dart';
import 'package:spritewidget/spritewidget.dart';

class GrassLands extends World {
  GrassLands(ImageMap imageMap, NodeWithSize rootNode) : super(imageMap, rootNode) {
    //Create tiles
    createEnemyArea(imageMap, rootNode);
    createPlayerArea(imageMap, rootNode);
    //createBridge(imageMap, rootNode);
  }
  createPlayerArea(ImageMap imageMap, NodeWithSize rootNode) {
    SpriteTexture texture = SpriteTexture(imageMap["assets/grasstile.png"]);
    for (int y = 0; y < 6; y++) {
      for (int x = 0; x < 7; x++) {
        var tile = new GrassTile(texture, x, y);
        tile.position = new Offset(World.getScreenX(x), World.getScreenY(y));
        rootNode.addChild(tile);
      }
    }
  }
  createEnemyArea(ImageMap imageMap, NodeWithSize rootNode) {
    SpriteTexture texture = SpriteTexture(imageMap["assets/grasstile.png"]);
    for (int y = 0; y < 6; y++) {
      for (int x = 0; x < 7; x++) {
        var tile = new GrassTile(texture, x, y + 9);
        tile.position = new Offset(World.getScreenX(x), World.getScreenY(y+9));
        rootNode.addChild(tile);
      }
    }
  }
  createBridge(ImageMap imageMap, NodeWithSize rootNode) {
    SpriteTexture bridge = SpriteTexture(imageMap["assets/bridge.png"]);
    //Create left bridge
    var topLeft = new BridgeTile(bridge, 1, 6);
    topLeft.position = new Offset(World.getScreenX(1),World.getScreenY(6) - 10);
    rootNode.addChild(topLeft);
    var middleLeft = new BridgeTile(bridge, 1, 7);
    middleLeft.position = new Offset(World.getScreenX(1),World.getScreenY(7) - 10);
    rootNode.addChild(middleLeft);
    var bottomLeft = new BridgeTile(bridge, 1, 8);
    bottomLeft.position = new Offset(World.getScreenX(1),World.getScreenY(8) - 10);
    rootNode.addChild(bottomLeft);
    //Create right bridge
    var topRight = new BridgeTile(bridge, 5, 6);
    topRight.position = new Offset(World.getScreenX(5),World.getScreenY(6)- 14);
    rootNode.addChild(topRight);
    var middleRight = new BridgeTile(bridge, 5, 7);
    middleRight.position = new Offset(World.getScreenX(5),World.getScreenY(7)- 14);
    rootNode.addChild(middleRight);
    var bottomRight = new BridgeTile(bridge, 5, 8);
    bottomRight.position = new Offset(World.getScreenX(5),World.getScreenY(8)- 14);
    rootNode.addChild(bottomRight);
  }
}