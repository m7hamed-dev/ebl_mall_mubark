import 'package:animate_do/animate_do.dart';
import 'package:ebl_mall/models/ads_model.dart';
import 'package:ebl_mall/style/style.dart';
import 'package:ebl_mall/ui/auction/details_auction_page.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class CardAds extends StatelessWidget {
  const CardAds({Key? key, required this.adsModel}) : super(key: key);
  //
  final Datum adsModel;
  final imageUrl =
      'https://aldananews.com/wp-content/uploads/2021/06/%D8%A7%D9%84%D8%AC%D9%85%D9%84-%D8%A7%D9%84%D8%B9%D8%B1%D8%A8%D9%8A.jpg';

  //
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: InkWell(
        // onTap: () => Push.goTo(context, DetailsAnimalPage(animal: animalMode)),
        child: Container(
          height: 25,
          margin: EdgeInsets.all(4.0),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Hero(
                  tag: 'category',
                  child: Stack(
                    clipBehavior: Clip.antiAlias,
                    children: [
                      Positioned.fill(
                        child: CustomCachedNetworkImage(
                          imageUrl: imageUrl,
                          width: 300.0,
                          height: 150.0,
                        ),
                      ),
                      int.parse(adsModel.price).isEven
                          ? Positioned(
                              top: 5.0,
                              right: 5.0,
                              child: Container(
                                width: 41.0,
                                height: 19.0,
                                alignment: Alignment.center,
                                child: Text('مميذ',
                                    style: Style.medium(color: Colors.white)),
                                decoration: Easy.customDecoration(),
                              ),
                            )
                          : const SizedBox(width: 0.0, height: 0.0),
                    ],
                  ),
                ),
              ),
              Text(adsModel.name, style: Style.tiny()),
              Text('${adsModel.price}', style: Style.subTitle()),
            ],
          ),
        ),
      ),
    );
  }
}
