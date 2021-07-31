import 'package:ebl_mall/data/constant.dart';
import 'package:ebl_mall/style/style.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../main.dart';
import 'details_auction_page.dart';

// card auction animal
class CardAuctionAnimal extends StatelessWidget {
  //
  final int index;
  final AnimalMode animalMode;
  //
  const CardAuctionAnimal(
      {Key? key, required this.index, required this.animalMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Push.goTo(
        context,
        DetailsauctionPage(animal: animalMode),
      ),
      //
      child: Container(
        width: 193,
        height: 195,
        margin: EdgeInsets.symmetric(vertical: 2.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              // color: HexColor("#ffffff"),
              color: Colors.grey.shade300,
              blurRadius: 2.0,
              spreadRadius: 2.0,
              offset: Offset(0.0, 2.0),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: Constant.crossAxisAlignment,
          mainAxisAlignment: Constant.mainAxisAlignment,
          children: [
            Expanded(
              flex: 3,
              child: Hero(
                // tag: animalMode,
                tag: Key(animalMode.imgUrl),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 0.0,
                        horizontal: 6.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/img_camel.jpg',
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: HexColor("#ffffff"),
                            blurRadius: 11.0,
                            spreadRadius: 0.0,
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                      ),
                    ),
                    index.isEven
                        ? Positioned(
                            top: 20.0,
                            right: 15.0,
                            child: Container(
                              width: 41.0,
                              height: 19.0,
                              alignment: Alignment.center,
                              child: Text('مميذ', style: Style.medium()),
                              decoration: Easy.customDecoration(),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(animalMode.name),
                    Text('${animalMode.price}', style: Style.subTitle()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
