import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:helt/game.dart';
import 'package:helt/grasslands.dart';
import 'package:spritewidget/spritewidget.dart';

ImageMap _imageMap;

AssetBundle _initBundle() {
  if (rootBundle != null)
    return rootBundle;
  return new NetworkAssetBundle(new Uri.directory(Uri.base.origin));
}

final AssetBundle _bundle = _initBundle();

main() async {
  runApp(new LoadingScreen());
  //WidgetsFlutterBinding.ensureInitialized();
  print('MAIN');
  _imageMap = new ImageMap(_bundle);
  print('_bundle: $_bundle _imageMap: $_imageMap');
  await _imageMap.load(<String>[
    'assets/artboard.png',
    'assets/grasstile.png',
    'assets/bridge.png',
    'assets/dummycard.png',
    'assets/enemycastle.png',
    'assets/enemymarket.png',
    'assets/enemytower.png',
    'assets/energygem.png',
    'assets/fence.png',
    'assets/fencegate.png',
    'assets/knight.png',
    'assets/playercastle.png',
    'assets/playermarket.png',
    'assets/playertower.png',
    'assets/usedenergygem.png',
    'assets/playerselection.png',
    'assets/tile175.png'
  ]);
  print('ADDED IMAGES');
  runApp(new GameBoardWidget());
}

class GameBoardWidget extends StatefulWidget {
  GameBoardWidgetState createState() => new GameBoardWidgetState();
}

class GameBoardWidgetState extends State<GameBoardWidget> {
  BoardRootNode rootNode;
  Game game;
  GameBoardWidgetState() {
    Game game = new Game(_imageMap);
    rootNode = new BoardRootNode(game);
    game.createCharacters(rootNode);
  }
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Title title = new Title(
        title: "Helt",
        color: const Color(0xFF024962),
          child: Container(
            child: SafeArea(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 750.0/1056.0,
                  child: Container(
                   // color: const Color(0xFFFFFFFF),
                    child: new SpriteWidget(rootNode, SpriteBoxTransformMode.fixedWidth)
                  )
                )
              )
            ),
            color: Color(0xFF024962)
          )
      );
    return new MaterialApp(
      color: const Color(0xFF024962),
      home: title
    );
  }
}
class LoadingScreen extends StatelessWidget{
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Container(
        color: const Color(0xFF742582),
      )
    );
  }
}

class BoardRootNode extends NodeWithSize {
  BoardRootNode(Game game): super(new Size(750.0, 1056.0)) {
    new GrassLands(_imageMap, this, game);
  }
}