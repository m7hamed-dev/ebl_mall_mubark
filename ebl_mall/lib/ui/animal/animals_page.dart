import 'package:animate_do/animate_do.dart';
import 'package:ebl_mall/data/dummy_data.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'card_animal.dart';

// animals
class AnimalsPage extends StatefulWidget {
  @override
  _AnimalsPageState createState() => _AnimalsPageState();
}

class _AnimalsPageState extends State<AnimalsPage> {
  bool isLoading = true;

  //ShimmerAnimal
  changeLoading() {
    Future.delayed(Duration(seconds: seconds), () {
      isLoading = false;
      setState(() {});
    });
  }

  @override
  void initState() {
    changeLoading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? ShimmerAnimal()
        : FadeInUp(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              scrollDirection: Axis.vertical,
              itemCount: ClassDummyData.dummyAnimals.length,
              // physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                //
                return _cardAds();
                // return CardAnimal(
                //   index: index,
                //   animalMode: ClassDummyData.dummyAnimals[index],
                // );
                //
              },
            ),
          );
  }

  Widget _cardAds() {
    return Text('data');
  }
}
