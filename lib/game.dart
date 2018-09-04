import 'dart:async';
import 'dart:ui';

import 'package:helt/character.dart';
import 'package:helt/world.dart';
import 'package:spritewidget/spritewidget.dart';

enum SelectionState {
  None,
  CharacterSelected
}

class Game {
  List<Character> playerCharacters;
  List<Character> enemyCharacters;
  Sprite selectionSprite;
  SelectionState state;
  ImageMap imageMap;
  Node rootNode;
  Game(ImageMap imageMap) {
    playerCharacters = new List<Character>();
    enemyCharacters = new List<Character>();
    this.imageMap = imageMap;
    Timer.periodic(Duration(seconds: 2), onTick);
  }
  void onTick(Timer timer) {

  }
  void click(int x, int y) {
    int playerIdx = playerCharacters.indexWhere((character) => character.x == x && character.y == y);
    int enemyIdx = enemyCharacters.indexWhere((character) => character.x == x && character.y == y);

    if(playerIdx >= 0 || enemyIdx >= 0) {
      print("clicked on character");
      if(selectionSprite != null) {
        print("Resetting selection sprite");
        resetSelection();
      }
      selectionSprite = Sprite.fromImage(this.imageMap[playerIdx != -1 ? "assets/playerselection.png" : "assets/tile175.png"]);
      selectionSprite.position = Offset(World.getScreenX(x), World.getScreenY(y) - 20);
      this.rootNode.addChild(selectionSprite);
      state = SelectionState.CharacterSelected;
    } else {
      print("Did not click on character");
      if(state == SelectionState.CharacterSelected) {
        resetSelection();
      }
    }
  }
  void resetSelection() {
    rootNode.removeChild(this.selectionSprite);
    this.selectionSprite = null;
    state = SelectionState.None;
  }
  void createCharacters(Node rootNode) {
    this.rootNode = rootNode;
    //create two characters each
    var knightTexture = new SpriteTexture(imageMap["assets/knight.png"]);
    var playerCharOne = new Character(knightTexture, 2, 4 + 6, CharacterOwner.Player);
    playerCharOne.scale = 1.5;
    playerCharOne.position = new Offset(World.getScreenX(2), World.getScreenY(4 + 6) - 40);
    rootNode.addChild(playerCharOne);
    var playerCharTwo = new Character(knightTexture, 4, 4 + 6, CharacterOwner.Player);
    playerCharTwo.scale = 1.5;
    playerCharTwo.position = new Offset(World.getScreenX(4), World.getScreenY(4 + 6) - 40);
    rootNode.addChild(playerCharTwo);
    playerCharacters.add(playerCharOne);
    playerCharacters.add(playerCharTwo);

    //Create enemy characters
    var enemyCharOne = new Character(knightTexture, 2, 4, CharacterOwner.Enemy);
    enemyCharOne.position = new Offset(World.getScreenX(2), World.getScreenY(4) - 40);
    enemyCharOne.scale = 1.5;
    rootNode.addChild(enemyCharOne);
    var enemyCharTwo = new Character(knightTexture, 4, 4, CharacterOwner.Enemy);
    enemyCharTwo.position = new Offset(World.getScreenX(4), World.getScreenY(4) - 40);
    enemyCharTwo.scale = 1.5;
    rootNode.addChild(enemyCharTwo);
    enemyCharacters.add(enemyCharOne);
    enemyCharacters.add(enemyCharTwo);

  }
}