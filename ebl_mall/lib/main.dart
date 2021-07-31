import 'package:animations/animations.dart';
import 'package:ebl_mall/data/local_storage.dart';
import 'package:ebl_mall/style/style.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';
import 'ui/home/home_page.dart';

Future<void> main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  //
  await LocalStorage.initLocalStorage();

  runApp(MyApp());
}

//
final int seconds = 3;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ebl Mall APP',
      theme: Style.themeData(),
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: MyHomePage(),
      ),
    );
  }
}

class ListExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return OpenContainer(
          transitionType: ContainerTransitionType.fade,
          closedBuilder: (BuildContext _, VoidCallback openContainer) {
            return ListTile(
              leading: Image.network(
                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                width: 60.0,
                fit: BoxFit.cover,
              ),
              title: Text('Title $index'),
              onTap: openContainer,
            );
          },
          openBuilder: (BuildContext _, VoidCallback __) {
            return DetailScreen(
              title: 'Title $index',
              imageUrl:
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            );
          },
          onClosed: (_) => print('Closed'),
        );
      },
    );
  }
}

class DetailScreen extends StatefulWidget {
  final String title;
  final String imageUrl;

  const DetailScreen({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _largePhoto = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 500),
        reverse: !_largePhoto,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            child: child,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.scaled,
          );
        },
        child: _largePhoto
            ? GestureDetector(
                onTap: () => setState(() => _largePhoto = !_largePhoto),
                child: Image.network(
                  widget.imageUrl,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => _largePhoto = !_largePhoto),
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(widget.title),
                    const SizedBox(height: 20.0),
                    const Text('_loremIpsumParagraph'),
                  ],
                ),
              ),
      ),
    );
  }
}

class MyGradiant extends StatelessWidget {
  final Widget child;
  const MyGradiant({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            HexColor('#fec163'),
            HexColor('#de4313'),
          ],
        ),
      ),
      child: child,
    );
  }
}

// container
class ContainerWidget extends StatelessWidget {
  final Widget content;
  final String title;
  const ContainerWidget({Key? key, required this.content, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: HexColor('#c4c4c4'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.centerRight,
            width: double.infinity,
            padding: EdgeInsets.all(12.0),
            // height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: HexColor('#faf6f1'),
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: HexColor('##faf6f1'),
              ),
            ),
            child: Text(title, style: Style.bold(color: Style.primaryColor)),
          ),
          Divider(),
          content,
        ],
      ),
    );
  }
}

class Easy {
  static BoxDecoration customDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(2.0),
      color: HexColor('#ff367e'),
    );
  }
}

// all models
class AnimalMode {
  final String name;
  final String imgUrl;
  final double price;
  final String phone;

  AnimalMode(
      {required this.phone,
      required this.imgUrl,
      required this.name,
      required this.price});
}

class Push {
  static goTo(BuildContext context, Widget page) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => page));
  }
}

extension CustomExtensions on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

// body with safeArea
class BodyWidget extends StatelessWidget {
  //
  final Widget child;
  const BodyWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return SafeArea(child: child);
    return SafeArea(
        child: Directionality(textDirection: TextDirection.rtl, child: child));
  }
}

// all shimmers
// shimmer animall
class ShimmerAnimal extends StatelessWidget {
  //
  const ShimmerAnimal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(
        4,
        (index) => Shimmer.fromColors(
          child: Container(
            width: 193,
            height: 195,
            margin: EdgeInsets.all(4.0),
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 3.0),
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(top: 3.0),
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
        ),
      ),
    );
  }
}

class ShimmerCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      // width: 100.0,
      margin: EdgeInsets.all(4.0),
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (c, i) {
            return Container(
              height: 60.0,
              width: 100.0,
              margin: EdgeInsets.all(4.0),
              // color: Colors.red,
              child: Shimmer.fromColors(
                child: Card(color: Colors.grey),
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
              ),
            );
          }),
    );
  }
}

class ShimmerLoadImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      margin: EdgeInsets.all(4.0),
      child: Shimmer.fromColors(
        child: Card(color: Colors.grey),
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
      ),
    );
  }
}
