import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebl_mall/style/style.dart';
import 'package:ebl_mall/widgets/custom_chip.dart';
import 'package:ebl_mall/widgets/my_elevated_btn.dart';
import 'package:ebl_mall/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import '../../main.dart';
// details single animal
// animals

class DetailsauctionPage extends StatefulWidget {
  final AnimalMode animal;
  const DetailsauctionPage({Key? key, required this.animal}) : super(key: key);

  @override
  _DetailsauctionPageState createState() => _DetailsauctionPageState();
}

class _DetailsauctionPageState extends State<DetailsauctionPage> {
  final description = '''هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيب''';
  bool isShowAuction = false;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Icon(
            Icons.notifications_on,
            color: Colors.white,
          ),
          SizedBox(width: 4.0),
          Text(
            widget.animal.name,
            style: Style.medium(color: Colors.white),
          ),
        ],
      )),
      bottomNavigationBar: _bottomNavigationBar(),
      body: BodyWidget(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Hero(
              tag: Key(widget.animal.imgUrl),
              child: Container(
                height: context.height * 0.30,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(
                          widget.animal.imgUrl,
                          fit: BoxFit.fill,
                        );
                      },

                      // indicatorLayout: PageIndicatorLayout.COLOR,
                      autoplay: true,
                      itemCount: 1,

                      pagination: SwiperPagination(
                        alignment: Alignment.bottomLeft,
                        builder: SwiperPagination.dots,
                      ),
                    ),
                    Positioned(
                      bottom: context.height * -0.05,
                      left: 0,
                      right: 0,
                      child: FadeInLeft(
                        child: Container(
                          height: 70.0,
                          // width: context.width * 0.70,
                          // padding: EdgeInsets.symmetric(vertical: 4.0),
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Card(
                            elevation: 2.0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0)),
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('ريال ${widget.animal.price}',
                                    style:
                                        Style.bold(color: Style.primaryColor)),
                                Text('السعر الحالي للمذاد',
                                    style: Style.tiny()),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // body
            _body(),
          ],
        ),
      ),
    );
  }

  FadeInRight _body() {
    return FadeInRight(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        // color: isShowAuction ? Colors.amber : Colors.green,

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: isShowAuction
              ? auctionDetailsCard()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.animal.price} SR',
                          style: Style.bold(color: Style.primaryColor),
                        ),
                        Text(
                          widget.animal.name,
                          style: Style.labelStyle(),
                        ),
                      ],
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
                        Icon(Icons.location_on_sharp,
                            color: Style.primaryColor),
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
      ),
    );
  }

  FadeInUp _bottomNavigationBar() {
    return FadeInUp(
      duration: const Duration(milliseconds: 1200),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MyElevatedBtn(
          color: Style.heighOrang,
          elevation: 20.0,
          onPressed: () {
            setState(() {
              isShowAuction = !isShowAuction;
            });
          },
          child: Text(
            isShowAuction ? ' مذايدة الأن' : ' دخول إلي المذاد',
            style: Style.medium(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget auctionDetailsCard() {
    return FadeInRight(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InputWidget(
          hint: ' قم بإدخل المبلغ المراد المذيدة به ',
          textInputType: TextInputType.number,
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

  Column animalProperty() {
    return Column(
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

class CustomCachedNetworkImage extends StatelessWidget {
  //
  final String imageUrl;
  final bool isCircleShape;
  final double? width, height;
  //
  const CustomCachedNetworkImage(
      {Key? key,
      required this.imageUrl,
      this.isCircleShape = false,
      this.width,
      this.height})
      : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      // width: width ?? 50,
      height: height ?? 50,
      imageUrl: imageUrl,

      imageBuilder: (context, imageProvider) {
        return Container(
          width: width ?? 50,
          height: height ?? 50,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: isCircleShape ? BoxShape.circle : BoxShape.rectangle,
            // borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
            ),
          ),
        );
      },
      placeholder: (context, url) => ShimmerLoadImage(),
      errorWidget: (context, url, error) =>
          Image.network('https://a7b.cc/wp-content/uploads/2019/04/3427.jpg'),
      // errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}


// class DetailsauctionPage extends StatefulWidget

