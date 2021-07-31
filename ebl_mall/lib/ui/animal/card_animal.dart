import 'package:ebl_mall/data/constant.dart';
import 'package:ebl_mall/models/category_model.dart';
import 'package:ebl_mall/models/sub_category_model.dart';
import 'package:ebl_mall/style/style.dart';
import 'package:ebl_mall/ui/auction/details_auction_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

// card animal
class CardAnimal extends StatelessWidget {
  //
  final int index;
  final CategoryModel category;
  //
  const CardAnimal({Key? key, required this.index, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Push.goTo(context, DetailsAnimalPage(animal: animalMode)),
      child: Container(
        // width: 193,
        height: 295,
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
          crossAxisAlignment: Constant.crossAxisAlignment,
          children: [
            Hero(
              tag: category,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Container(
                  //   height: 90.0,
                  //   width: double.infinity,
                  //   // margin: EdgeInsets.symmetric(
                  //   //   vertical: 3.0,
                  //   //   horizontal: 3.0,
                  //   // ),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(5.0),
                  //     image: DecorationImage(
                  //       image: AssetImage(
                  //         'assets/images/img_camel.jpg',
                  //       ),
                  //     ),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: HexColor("#ffffff"),
                  //         blurRadius: 11.0,
                  //         spreadRadius: 0.0,
                  //         offset: Offset(0.0, 2.0),
                  //       )
                  //     ],
                  //   ),
                  // ),
               
               CustomCachedNetworkImage(imageUrl: category.img),
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
                      : const SizedBox(width: 0.0, height: 0.0),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: Constant.crossAxisAlignment,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(category.name),
                Text('${category.name}', style: Style.subTitle()),
              ],
            )
          ],
        ),
      ),
    );
  
  }
}
