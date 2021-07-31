import 'package:animate_do/animate_do.dart';
import 'package:ebl_mall/style/style.dart';
import 'package:ebl_mall/widgets/card_contact.dart';
import 'package:ebl_mall/widgets/custom_cached_network_img.dart';
import 'package:ebl_mall/widgets/custom_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

import '../../main.dart';
// details single animal
// animals

class DetailsAnimalPage extends StatelessWidget {
  final AnimalMode animal;
  const DetailsAnimalPage({Key? key, required this.animal}) : super(key: key);
  final description = '''هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيب''';
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.transparent),
      bottomNavigationBar: CardContact(animal: animal),
      body: BodyWidget(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Hero(
              tag: animal,
              child: Container(
                height: context.height * 0.30,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      animal.imgUrl,
                      fit: BoxFit.fill,
                    );
                  },

                  // indicatorLayout: PageIndicatorLayout.COLOR,
                  autoplay: true,
                  itemCount: 1,
                  pagination: SwiperPagination(
                    // alignment: Alignment.bottomCenter,
                    builder: SwiperPagination.dots,
                  ),
                ),
              ),
            ),
            // body
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FadeInRight(
                    duration: const Duration(milliseconds: 800),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${animal.price} SR',
                          style: Style.bold(color: Style.primaryColor),
                        ),
                        Text(
                          animal.name,
                          style: Style.labelStyle(),
                        ),
                      ],
                    ),
                  ),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'الرياض شارع الرياض ',
                        style: Style.labelStyle(),
                      ),
                      SizedBox(width: 10.0),
                      Icon(Icons.location_on_sharp, color: Style.primaryColor),
                    ],
                  ),
                  //
                  SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomChip(
                      label: Text(
                        'التفاصيل',
                        style: Style.medium(color: Style.primaryColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(description, style: Style.labelStyle()),
                  ),
                  SizedBox(height: 10.0),
                  CustomChip(
                    label: Text(
                      'المواصفات',
                      style: Style.medium(color: Style.primaryColor),
                    ),
                  ),
                  // properties of animal
                  animalProperty(),
                  // details person
                  SizedBox(height: 10.0),
                  CustomChip(
                    label: Text(
                      'تفاصيل المعلن',
                      style: Style.medium(color: Style.primaryColor),
                    ),
                  ),
                  //
                  detailsWoner(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailsWoner() {
    final imageUrl =
        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';
    // return Container(
    //   child: ListTile(
    //     onTap: () {},
    //     // leading: Icon(Icons.home),
    //     contentPadding: EdgeInsets.zero,
    //     title: Text(
    //       'عبدالله محمد القحطاني',
    //       style: Style.labelStyle(),
    //     ),
    //     subtitle: Row(
    //       children: [
    //         Text(
    //           'mohm@gmail.com',
    //           style: Style.labelStyle(),
    //         ),
    //         Icon(Icons.email, color: Style.primaryColor),
    //       ],
    //     ),
    //     trailing: CustomCachedNetworkImage(imageUrl: imageUrl),
    //   ),
    // );
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'عبدالله محمد القحطاني',
              style: Style.labelStyle(),
            ),
            SizedBox(width: 10.0),
            CustomCachedNetworkImage(imageUrl: imageUrl),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'mohm@gmail.com',
              style: Style.labelStyle(),
            ),
            Icon(Icons.email, color: Style.primaryColor)
          ],
        ),
      ],
    );
  }

  FadeInRight animalProperty() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1100),
      child: Column(
        children: [
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _column('title', 20),
              _column('السن', 20),
              _column('السن', 20),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _column('السن', 20),
              _column('السن', 20),
              _column('السن', 20),
            ],
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Column _column(title, subtitle) {
    return Column(
      children: [
        Text(title, style: Style.labelStyle()),
        SizedBox(height: 10.0),
        Text(
          subtitle.toString(),
          style: Style.labelStyle(color: Style.primaryColor),
        ),
      ],
    );
  }
}


