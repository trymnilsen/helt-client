import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
    'assets/bridge.png'
  ]);
  print('ADDED IMAGES');
  runApp(new GameBoardWidget());
}

class GameBoardWidget extends StatefulWidget {
  GameBoardWidgetState createState() => new GameBoardWidgetState();
}

class GameBoardWidgetState extends State<GameBoardWidget> {
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
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
                    child: new SpriteWidget(new BoardRootNode(), SpriteBoxTransformMode.fixedWidth)
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
        color: const Color(0xFFFFFFFF),
      )
    );
  }
}

class BoardRootNode extends NodeWithSize {
  BoardRootNode(): super(new Size(750.0, 1056.0)) {
    new GrassLands(_imageMap, this);
  }
}