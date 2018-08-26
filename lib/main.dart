import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
    'assets/artboard.png'
  ]);
  print('ADDED IMAGES');
  runApp(new GameBoard());
}

class GameBoard extends StatefulWidget {
  GameBoardState createState() => new GameBoardState();
}

class GameBoardState extends State<GameBoard> {
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Title(
        title: "Helt",
        color: const Color(0xFFFFFFFF),
        child: new SpriteWidget(new BoardRootNode(), SpriteBoxTransformMode.fixedWidth),
      )
    );
  }
}
class LoadingScreen extends StatelessWidget{
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Container(
        color: const Color(0xFFFFFFFF),
      )
    );
  }
}

class BoardRootNode extends NodeWithSize {
  BoardRootNode(): super(new Size(750.0, 1337.0)) {
    var imageNode = new Sprite.fromImage(_imageMap["assets/artboard.png"]);
    imageNode.position = Offset(750.0 / 2, 1337.0 / 2);
    addChild(imageNode);
  }
}