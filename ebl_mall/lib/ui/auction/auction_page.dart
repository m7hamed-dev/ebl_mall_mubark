import 'package:ebl_mall/data/dummy_data.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'card_auction.dart';


class AuctionsPage extends StatefulWidget {
  const AuctionsPage({Key? key}) : super(key: key);

  @override
  _AuctionsPageState createState() => _AuctionsPageState();
}

class _AuctionsPageState extends State<AuctionsPage> {
  bool isLoading = true;

  //ShimmerAnimal
  changeLoading() {
    Future.delayed(Duration(seconds: 5), () {
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
        : GridView.builder(
          
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            scrollDirection: Axis.vertical,
            itemCount: ClassDummyData.dummyAnimals.length,
            
            // physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              //
              return CardAuctionAnimal(
                index: index,
                animalMode:ClassDummyData.dummyAnimals[index],
              );
            },
          );
  }
}
