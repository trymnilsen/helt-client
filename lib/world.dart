import 'package:spritewidget/spritewidget.dart';

class World {
  static double spacingHeight = 90.0;
  static double spacingWidth = 95.0;
  static const double gridSizeWidth = 95.0;
  static const double gridSizeHeight = 65.0;
  List<List<List<TileData>>> tiles;
  World(ImageMap imageMap, NodeWithSize rootNode) {
    tiles = new List<List<List<TileData>>>();
    //Create tiles

  }
  static double getScreenX(int gridX) {
    return gridSizeWidth * gridX + spacingWidth;
  }
  static double getScreenY(int gridY) {
    return gridSizeHeight * gridY + spacingHeight;
  }
}

class TileData {
  String type;
}
